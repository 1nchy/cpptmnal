LIB = libtmnal
LIB_PREFIX_NAME = libtmnal.so
SO_NAME = libtmnal.so.1
LIB_NAME = libtmnal.so.1.0.0

CXX = g++
CXXFLAGS = -shared -fPIC -Wl,-soname,$(SO_NAME) -o $(LIB_NAME) $(SRC_NAME)

SRC_NAME = terminal.cpp
INC_NAME = terminal.hpp

PREFIX = /usr/local

.PHONY: install clean

$(LIB_NAME): $(SRC_NAME)
	$(CXX) $(CXXFLAGS)

install:
	rm -f $(PREFIX)/lib/$(LIB)*
	install $(LIB_NAME) $(PREFIX)/lib
	ln -s $(PREFIX)/lib/$(LIB_NAME) $(PREFIX)/lib/$(SO_NAME)
	ln -s $(PREFIX)/lib/$(LIB_NAME) $(PREFIX)/lib/$(LIB_PREFIX_NAME)
	ldconfig $(PREFIX)/lib
	install $(INC_NAME) $(PREFIX)/include

clean:
	rm $(LIB_NAME)