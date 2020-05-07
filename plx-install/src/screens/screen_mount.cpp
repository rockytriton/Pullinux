#include "screen_mount.h"
#include <form.h>

#include "screen_msg.h"

FORM *form;
WINDOW *formWnd;

MountScreen::MountScreen() {

    _wnd->drawString(4, 2, "Pullinux 1.0.0 Installation");

    const string mnt = "Press F12 To Cancel";
    _wnd->drawString((_wnd->width() / 2) - (mnt.size() / 2), _wnd->height() - 3, mnt.c_str());
    FIELD *field[2];
    
    init_pair(1, COLOR_CYAN, COLOR_BLACK);
    
    field[0] = new_field(1, 28, 0, 1, 0, 0);
    field[1] = NULL;

    form = new_form(field);
    int rows, cols;
    scale_form(form, &rows, &cols);

    formWnd = newwin(rows + 2, cols + 2, 8, 8);
    keypad(formWnd, TRUE);

    set_form_win(form, formWnd);
    set_form_sub(form, derwin(formWnd, rows, cols, 1, 1));

    box(formWnd, 0, 0);
    wattron(formWnd, COLOR_PAIR(1));
    mvwprintw(formWnd, 0, 2, "Enter Partition: ");
    wattroff(formWnd, COLOR_PAIR(1));
    refresh();
    
    post_form(form);
    _wnd->refresh();

    wrefresh(formWnd);

    refresh();
}

MountScreen::~MountScreen() {
    
}

WinResult MountScreen::run() {
    int ch;
    while((ch = wgetch(formWnd)) != KEY_EXIT) {
        switch(ch) {
            case KEY_DOWN: {
                cout << "DOWN" << endl;
            } break;
            case KEY_F(12): {
                MsgScreen *msg = (MsgScreen *)ScreenFactory::create("MSG");
                msg->message("Are you sure you want to exit?");
                WinResult result = msg->run();

                if (result == WinResult::OKAY) {
                    cleanup_exit();
                }

                delete msg;

                box(formWnd, 0, 0);
                wattron(formWnd, COLOR_PAIR(1));
                mvwprintw(formWnd, 0, 2, "Enter Partition: ");
                wattroff(formWnd, COLOR_PAIR(1));

                _wnd->refresh();
                wrefresh(formWnd);
                refresh();
            }break;
            default: {
                form_driver(form, ch);
            } break;
        }
    }

    unpost_form(form);
    free_form(form);

    return WinResult::OKAY;
}

ScreenRegister<MountScreen> MountScreen::reg("MOUNT");

screenMap *ScreenFactory::_screenMap;
