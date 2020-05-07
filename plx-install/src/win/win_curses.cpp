#include "win.h"

#include <ncurses.h>

WinCurses::WinCurses(int w, int h) {
    if (!_initialized) {
        initscr();
        cbreak();
        noecho();

        //clear();

        start_color();
        keypad(stdscr, TRUE);

        _containerWidth = COLS - 1;
        _containerHeight = LINES - 1;

        _initialized = true;
    }

    if (w < 0) {
        _width = _containerWidth + w;
        _height = _containerHeight + h;
    } else {
        _width = w;
        _height = h;
    }

    ::refresh();

    _wnd = newwin(_height, _width, (_containerHeight - _height) / 2, (_containerWidth - _width) / 2);
    box(_wnd, 0, 0);
    wrefresh(_wnd);
}

WinCurses::~WinCurses() {
    wborder(_wnd, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');
    wrefresh(_wnd);
    
    werase(_wnd);
    delwin(_wnd);

    if (--_windowCount == 0) {
        echo();
        endwin();
    }
}

void WinCurses::refresh() {
    //::refresh();
    redrawwin(_wnd);
    wrefresh(_wnd);
}

void WinCurses::drawString(int x, int y, const char *str) {
    wmove(_wnd, y, x);
    wprintw(_wnd, str);
    //printw(str);
    //mvaddstr(y, x, str);
}

void WinCurses::waitInput() {
    
}

void WinCurses::run() {
    int ch;

    while((ch = getch()) != 27) {
        std::map<int, WinResult>::iterator it = _keyBindings.find(ch);

        if (it != _keyBindings.end()) {
            _result = (*it).second;
            break;
        } else {
            std::cout << "NOPE: " << ch << endl;
        }
    }
}

void cleanup_exit() {
    endwin();
    exit(0);
}
