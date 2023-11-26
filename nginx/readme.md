# Generate a cert:

brew install mkcert nss
mkcert -install
mkcert roqua.eu \*.roqua.eu \*.rom.roqua.eu localhost 127.0.0.1 ::1

# Install nginx server config

echo "include /Users/marten/dotfiles/nginx/roqua.conf" > /opt/homebrew/etc/nginx/servers/roqua.conf
