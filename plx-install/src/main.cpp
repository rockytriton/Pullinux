#include <common.h>

#include "win/win.h"

#include "screens/screen_factory.h"

const string PLX_INST = "Pullinux Installer";
const string PLX_START = "Press any key to start";

int main(int argc, char **argv) {

    Win *win = new WinCurses(-2, -2);

    win->refresh();
    win->drawString((win->width() / 2) - (PLX_INST.size() / 2), 1, PLX_INST.c_str());
    win->drawString((win->width() / 2) - (PLX_START.size() / 2), win->height() / 2, PLX_START.c_str());

    win->refresh();

    win->addKeyBinding(10, WinResult::OKAY);

    win->run();

    if (win->result() == WinResult::OKAY) {
        
    }

    
    //delete win;

    Screen *sc = ScreenFactory::create("MOUNT");
    sc->run();

    return 0;
}
