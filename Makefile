CC = g++ 
SHELL = /bin/sh
FLAGS = 

CFLAGS = 
DEBUGFLAGS = -O0 -g -D _DEBUG
RELEASEFLAGS = -O2 -D NDEBUG
LDFLAGS = ./lib/HOG.o -lopencv_core -lopencv_imgproc -lopencv_highgui

SRCS = $(shell echo src/*)
OBJS = $(addprefix lib/,$(notdir $(SRCS:.cpp=.o)))

TARGET = fenriz

all: $(TARGET)
.PHONY: clean
$(TARGET) : $(OBJS) $(HEADERS)
	$(CC) $(FLAGS) $(CFLAGS) $(DEBUGFLAGS) $(LDFLAGS) -o ./bin/$(TARGET) $(SRCS)

lib/%.o : ./src/%.cpp $(COMMON)
	$(CC) $(FLAGS) $(CFLAGS) $(DEBUGFLAGS) -c -o $@ $<
