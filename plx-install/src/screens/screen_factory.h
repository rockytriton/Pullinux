#pragma once

#include <common.h>

#include <map>

#include "screen.h"

template<typename T> Screen * createScreen() { return new T; }


typedef std::map<string, Screen*(*)()> screenMap;

class ScreenFactory {
public:

    static Screen *create(const string &name) {
        screenMap::iterator it = getMap()->find(name);

        if (it == _screenMap->end()) {
            return nullptr;
        }

        return it->second();
    }

    static void registerScreen(const string &name);

protected:
    static screenMap *getMap() {
        if (!_screenMap) {
            _screenMap = new screenMap();
        }

        return _screenMap;
    }

    static screenMap *_screenMap;
};

template<typename T>
class ScreenRegister : ScreenFactory {
public:
    ScreenRegister(const string &name) {
        getMap()->insert(std::make_pair(name, &createScreen<T>));
    }
};

