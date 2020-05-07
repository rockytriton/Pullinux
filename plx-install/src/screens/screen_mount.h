#pragma once

#include "screen_factory.h"

class MountScreen : public Screen {
public:
    MountScreen();
    virtual ~MountScreen();

    virtual WinResult run();
    virtual string next() { return "COPY"; };

private:
    static ScreenRegister<MountScreen> reg;
};


