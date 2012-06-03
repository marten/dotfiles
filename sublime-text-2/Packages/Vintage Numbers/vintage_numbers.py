"""
Vintage Numbers plugin for Sublime Text 2
by Ignacy Sokolowski
"""
import sublime
import sublime_plugin


class ViNumberMixin(object):
    """Mixin for Sublime Text 2 TextCommands that enables incrementing
    and decrementing number at the caret position in Vintage command mode.
    It works with caret at any position of a number.
    It doesn't support negative numbers yet.

    Default key bindings are setup like in Vi:
        ctrl+a -- incrementing
        ctrl+x -- decrementing

    """

    def run(self, edit):
        new_sel = []
        int_method = getattr(int, self.int_method)
        for s in reversed(self.view.sel()):
            # Getting caret position.
            (row, col) = self.view.rowcol(s.begin())
            # Getting line and char at the caret.
            line = self.view.substr(self.view.line(self.view.text_point(row, 0)))
            char = line[col]

            if s.empty() and char.isdigit():
                # Getting begining and end columns of the whole number position.
                beg, end = (col, col + 1)
                while beg >= 0 and line[beg:end].isdigit():
                    beg -= 1
                beg += 1
                while end <= len(line) and line[beg:end].isdigit():
                    end += 1
                end -= 1

                # Incrementing/decrementing the number and converting to string.
                number = str(int_method(int(line[beg:end]), 1))

                # Counting region that will be replaced.
                start = s.b - (col - beg)
                stop = s.b - (col - end)

                # Replacing number at the caret
                # with the incremented/decremented one.
                self.view.replace(edit, sublime.Region(start, stop), number)

            new_sel.append(s)

        self.view.sel().clear()
        for s in new_sel:
            self.view.sel().add(s)


class ViIncrementNumberCommand(sublime_plugin.TextCommand, ViNumberMixin):
    """Sublime Text 2 TextCommand to increment number at the caret position
    in Vintage command mode.
    It works with caret at any position of a number.
    It doesn't support negative numbers yet.

    Default key binding is setup to "ctrl+a" like in Vi.

    """
    int_method = '__add__'

    def run(self, edit):
        ViNumberMixin.run(self, edit)


class ViDecrementNumberCommand(sublime_plugin.TextCommand, ViNumberMixin):
    """Sublime Text 2 TextCommand to decrement number at the caret position
    in Vintage command mode.
    It works with caret at any position of a number.
    It doesn't support negative numbers yet.

    Default key binding is setup to "ctrl+x" like in Vi.

    """
    int_method = '__sub__'

    def run(self, edit):
        ViNumberMixin.run(self, edit)
