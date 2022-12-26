GSOAP_ROOT = ./
##### Change the following for your environment:
CROSS_COMPILE?=         arm-gcc6.3-linux-uclibceabi-
COMPILE_OPTS =          $(INCLUDES) -I ./cross_compile/include -L ./cross_compile/lib64 -I ./ -lm
#COMPILE_OPTS +=         -L /home/ubuntu/work/cross_compiling/lib/libssl.a
#COMPILE_OPTS +=         -L /home/ubuntu/work/cross_compiling/lib/libcrypto.a
C =                     
C_COMPILER =            $(CROSS_COMPILE)gcc
C_FLAGS =               $(COMPILE_OPTS)
CPP =                   cpp
CPLUSPLUS_COMPILER =    $(CROSS_COMPILE)g++
CPLUSPLUS_FLAGS =       $(COMPILE_OPTS) -Wall -std=c++11 -no-pie -DPOSIX -DDEBUG_
OBJ =                   o
LINK =                  $(CROSS_COMPILE)g++ -o
LINK_OPTS =
CONSOLE_LINK_OPTS =     $(LINK_OPTS)
LIBRARY_LINK =          $(CROSS_COMPILE)ar cr
LIBRARY_LINK_OPTS =     $(LINK_OPTS)
LIB_SUFFIX =                    a
LIBS_FOR_CONSOLE_APPLICATION = -lssl -lcrypto -lpthread -ldl
LIBS_FOR_GUI_APPLICATION =
EXE =
##### End of variables to change

CC = $(C_COMPILER) $(COMPILE_OPTS) -DWITH_OPENSSL -DWITH_DOM -DSOAP_DEBUG -DDEBUG -lm -DWITH_NO_C_LOCALE
INCLUDE = -I$(GSOAP_ROOT)
SERVER_OBJS = dom.o soapC.o stdsoap2.o  wsaapi.o wsseapi.o smdevp.o mecevp.o threads.o onvif_server_interface.o soapClient.o soapServer.o onvif_server.o

all: server 
server: $(SERVER_OBJS)
	$(CC) $(INCLUDE) -o deviceserver $(SERVER_OBJS) -lpthread -lcrypto -lssl

clean: 
	rm -f *.o deviceprobe  deviceserver onvif
