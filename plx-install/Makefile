CPP=g++
CPPFLAGS=-g $(shell root-config --cflags) -Isrc/include

SRCS=src/main.cpp src/win/win.cpp src/win/win_curses.cpp src/screens/screen.cpp src/screens/screen_msg.cpp src/screens/screen_mount.cpp
OBJS=$(subst .cpp,.o,$(SRCS))

all: plx-install

plx-install: $(OBJS)
	$(CPP) -lcurses -lform -lmenu -o plx-install $(OBJS)

win_curses.o: src/win/win_curses.cpp
main.o: src/main.cpp
win.o: src/win/win.cpp
screen.o: src/screens/screen.cpp
screen_msg.o: src/screens/screen_msg.cpp
screen_mount.o: src/screens/screen_mount.cpp

clean:
	rm -rf $(OBJS)

