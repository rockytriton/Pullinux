#include "screen_msg.h"
#include <form.h>
#include <ncurses.h>
#include <menu.h>



MsgScreen::MsgScreen() : Screen(10, 44) {
    char *choices[] = {
        "<Cancel>", "  <OK>    "
    };

    int numChoices = 2;
    items = (ITEM **)calloc(numChoices + 1, sizeof(ITEM *));

    for (int i=0; i<numChoices; i++) {
        items[i] = new_item(choices[i], NULL);//, choices[i]);
    }

    items[numChoices] = NULL;
}

void MsgScreen::message(const string &msg) {
    _msg = msg;

    //refresh();
    //_wnd->refresh();

    set_current_item(menu, items[0]);

    //_wnd->refresh();
    
    menu = new_menu(items);
    menuWnd = newwin(10, 44, (LINES / 2) - 5, (COLS/2) - 22);
    keypad(menuWnd, true);

    set_menu_win(menu, menuWnd);
    WINDOW *dw = derwin(menuWnd, 1, 24, 7, 8);
    set_menu_sub(menu, dw);
    set_menu_format(menu, 1, 2);
    set_menu_mark(menu, "   ");
    box(menuWnd, 0, 0);

    mvwaddch(menuWnd, 2, 0, ACS_LTEE);
    mvwhline(menuWnd, 2, 1, ACS_HLINE, 42);
    mvwaddch(menuWnd, 2, 43, ACS_RTEE);

    //_wnd->drawString(2, 2, "Pullinux 1.0.0 Installation");
    mvwprintw(menuWnd, 4, 22 - (msg.size() / 2), msg.c_str());

    //_wnd->refresh();


    post_menu(menu);
    wrefresh(menuWnd);
    refresh();
}

MsgScreen::~MsgScreen() {
    
}

WinResult MsgScreen::run() {
    WinResult result = WinResult::NONE;

    while(result == WinResult::NONE) {
        int ch = wgetch(menuWnd);

        switch(ch) {
            case KEY_DOWN: {
                menu_driver(menu, REQ_LEFT_ITEM);
                
            } break;
            case KEY_UP: {
                menu_driver(menu, REQ_RIGHT_ITEM);
            } break;
            case KEY_ENTER:
            case 10: {
                result = current_item(menu) == items[0] ? 
                        WinResult::CANCEL : WinResult::OKAY;
            } break;
        }

        wrefresh(menuWnd);
    }

    unpost_menu(menu);
    free_menu(menu);
    for(int i = 0; i < 2; ++i)
            free_item(items[i]);

    wborder(menuWnd, ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ');
    wrefresh(menuWnd);
    werase(menuWnd);
    delwin(menuWnd);

    return result;
}

ScreenRegister<MsgScreen> MsgScreen::reg("MSG");
