#include "win.h"

int Win::_windowCount = 0;
bool Win::_initialized = false;
int Win::_containerWidth = 0;
int Win::_containerHeight = 0;

void Win::addKeyBinding(int key, WinResult r) {
    _keyBindings[key] = r;
}

