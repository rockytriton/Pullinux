#include "screen.h"

Screen::Screen() {
    _wnd = new WinCurses(-2, -2);
}

Screen::Screen(int w, int h) {
    _wnd = new WinCurses(w, h);
}

Screen::~Screen() {
    delete _wnd;
}
