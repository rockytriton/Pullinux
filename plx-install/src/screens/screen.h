#pragma once

#include <common.h>
#include "../win/win.h"

#include <form.h>

class Screen {
public:
    Screen();
    Screen(int w, int h);
    virtual ~Screen();

    virtual WinResult run() = 0;
    virtual string next() = 0;

protected:

    Win *_wnd;
    FIELD *_fields[10];
};

