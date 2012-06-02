#
# $Id: web.pl 47 2004-10-05 18:53:17Z max $
#                2007-02-25 00:44:00Z don $
#
#   web-irssi v0.2.1
#   A web interface for irssi
#   http://max.kellermann.name/projects/web-irssi/
#   http://www.donneker.de/projects/web-irssi/
#
# (c) 2004 Max Kellermann (max@duempel.org)
# Enhancements (c) 2007 Stefan Hummert (web.irssi@my.donster.de)
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; version 2 of the License.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

use strict;
use Irssi;

use Fcntl ':flock';
use CGI::Util qw(escape unescape);

use vars qw($VERSION %IRSSI);

$VERSION = '0.2.1';
%IRSSI = (
          authors => 'Max Kellermann, Stefan Hummert',
          contact => 'max@duempel.org, web.irssi@my.donster.de',
          name => 'web-irssi',
          description => 'A web interface for irssi',
          url => 'http://readme.gzipped.org/projects/web-irssi/',
          license => 'GNU GPL v2',
         );

use vars qw($next_userlist_update);
BEGIN {
    $next_userlist_update = 0;
}

sub poll {
    my $state_dir = "$ENV{HOME}/.web-irssi";
    mkdir $state_dir;

    local *FILE;

    my @servers = Irssi::servers;
    my %servers = map {
        $_->{chatnet} => $_
    } @servers;

    # handle input dir

    my $input_dir = "$state_dir/input";

    local *DIR;
    if (opendir DIR, $input_dir) {
        my @names = sort { $a cmp $b } readdir DIR;
        closedir DIR;
        foreach my $name (@names) {
            next unless -f "$input_dir/$name";

            if ($name =~ /^(\w+):\d+$/) {
                # parse file name

                my $server_name = $1;

                my $server = $servers{$server_name};
                next unless defined $server;

                # handle file contents

                if (open FILE, "$input_dir/$name") {
                    while (<FILE>) {
                        s/^\s+//;
                        s/\s+$//;
                        if (m,^/,) {
                            # forward server command
                            $server->command($_);
                        } elsif (m,^:close +(.*)$,) {
                            # close an irssi window
                            my $window = Irssi::window_find_item($1);
                            $window->destroy
                              if defined $window;
                        }
                    }

                    close FILE;
                }
            } elsif ($name =~ /^:\d+$/) {
                if (open FILE, "$input_dir/$name") {
                    # a global command without chatnet

                    while (<FILE>) {
                        s/^\s+//;
                        s/\s+$//;
                        if (m,^:connect +(.*)$,) {
                            # connect to a chatnet

                            Irssi::command_runsub('server', "connect $1", undef, undef);
                        }
                    }

                    close FILE;
                }
            }

            unlink "$input_dir/$name";
        }

        closedir DIR;
    }

    # create chatnets file, a list of all connected chatnets

    if (open FILE, ">$state_dir/chatnets") {
        flock FILE, LOCK_EX;

        foreach my $chatnet (Irssi::chatnets) {
            my $server = Irssi::server_find_chatnet($chatnet->{name});
            my $address = defined $server ? $server->{address} : '';
            print FILE "$chatnet->{name}\t$address\n";
        }

        close FILE;
    }

    # create windows files, a file for each open window

    my $windows_dir = "$ENV{HOME}/.web-irssi/windows";
    mkdir $windows_dir;
    my $userlist_dir = "$ENV{HOME}/.web-irssi/userlist";

    opendir DIR, $windows_dir;
    my %files = map { -f "$windows_dir/$_" ? ( $_ => 1 ) : () } readdir DIR;
    closedir DIR;
    #if (exists $files{"."}) delete $files{"."};
    delete $files{"."} if exists $files{"."};
    delete $files{".."} if exists $files{".."};

    my $userlist_update = time >= $next_userlist_update;
    if ($userlist_update) {
        $next_userlist_update = time + 60;
        # Irssi::print("next_userlst_upd: $next_userlist_update " . time . " time userlst_upd: $userlist_update", MSGLEVEL_CRAP);
        mkdir $userlist_dir
    }

    foreach my $server (@servers) {
        my $server_ename = escape($server->{chatnet});

        my $min_time = time - 60;

        # write channel files

        my @channels = $server->channels;
        foreach my $channel (@channels) {
            # write channel properties to file

            my $ename = escape($channel->{name});
            my $fname = "$server_ename:$ename";
            my $mtime = 0;
            if (exists $files{$fname}) {
                delete $files{$fname};
                $mtime = (stat "$windows_dir/$fname")[9];
            }
            # Irssi::print("$windows_dir/$fname mtime: $mtime, min_time: $min_time", MSGLEVEL_CRAP);

            local *FILE;
            if ($userlist_update) {
                # update userlist file
                # Irssi::print("in userlist_update to $userlist_dir/$fname", MSGLEVEL_CRAP);

                open FILE, ">$userlist_dir/$fname";
                flock FILE, LOCK_EX;
                foreach my $nick ($channel->nicks) {
                    print FILE "$nick->{nick}\t$nick->{host}\t$nick->{realname}\n";
                }
            }

            next if $mtime > $min_time;
            open FILE, ">$windows_dir/$fname";
            flock FILE, LOCK_EX;
            foreach my $key (qw(topic topic_by)) {
                print FILE "$key=$channel->{$key}\n"
                  if defined $channel->{$key};
            }
            print FILE "ownnick=$channel->{ownnick}{nick}\n";
        }

        # write query files

        my @queries = $server->queries;
        foreach my $query (@queries) {
            # write query properties to file

            my $ename = escape($query->{name});
            my $fname = "$server_ename:$ename";
            if (exists $files{$fname}) {
                delete $files{$fname};
            } else {
                local *FILE;
                open FILE, ">$windows_dir/$fname";
                close FILE;
            }
        }
    }

    # remove all stale window files

    foreach my $ename (keys %files) {
        # Irssi::print("unlinked $windows_dir/$ename", MSGLEVEL_CRAP);
        unlink("$windows_dir/$ename");
    }

    # remove all stale userlist files

    if ($userlist_update) {
        if (opendir DIR, $userlist_dir) {
            my $min_time = time - 7201;
            while (my $name = readdir DIR) {
                my $filename = "$userlist_dir/$name";
                my $mtime = (stat $filename)[9];
		if ( $mtime < $min_time and $filename != "." and $filename != ".." )
		{
                  unlink $filename;
		  # Irssi::print("unlinked $filename mtime: $mtime min_time: $min_time ", MSGLEVEL_CRAP);
		}
            }
            closedir DIR;
        }
    }
}

Irssi::timeout_add(1000, "poll", undef);
