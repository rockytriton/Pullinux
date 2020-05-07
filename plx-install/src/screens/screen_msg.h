#pragma once

#include "screen_factory.h"

#include <menu.h>
#include <curses.h>

class MsgScreen : public Screen {
public:
    MsgScreen();
    virtual ~MsgScreen();

    void message(const string &msg);

    virtual WinResult run();
    virtual string next() { return nullptr; };

private:
    static ScreenRegister<MsgScreen> reg;
    string _msg;

    WINDOW *menuWnd;
    ITEM **items;
    MENU *menu;
    ITEM *curItem;
};
