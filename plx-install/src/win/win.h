#pragma once

#include <common.h>

enum WinResult {
    NONE,
    CANCEL,
    OKAY,
    NEXT,
    PREVIOUS
};

typedef struct _win_st WINDOW;

class Win {
public:
    Win() { _windowCount++; };
    virtual ~Win() {};

    virtual void refresh() = 0;
    virtual void drawString(int x, int y, const char *str) = 0;
    virtual void waitInput() = 0;

    int width() { return _width; };
    int height() { return _height; };

    int containerWidth() { return _containerWidth; };
    int containerHeight() { return _containerHeight; };

    virtual void run() = 0;

    WinResult result() { return _result; }

    void addKeyBinding(int key, WinResult);

protected:
    int _width;
    int _height;
    static int _containerWidth;
    static int _containerHeight;
    static int _windowCount;
    static bool _initialized;
    WinResult _result;
    std::map<int, WinResult> _keyBindings;
};

class WinCurses : public Win {
public:
    WinCurses(int w, int h);
    virtual ~WinCurses();

    virtual void refresh();
    virtual void drawString(int x, int y, const char *str);
    virtual void waitInput();
    virtual void run();

    WINDOW *window() { return _wnd; }

private:
    WINDOW *_wnd;
};

