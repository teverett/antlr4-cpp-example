
JAVA=/usr/bin/java
OUTPUT=output
GENERATED=generated
GRAMMAR=modelica.g4

# here is where you plug in the runtime for your OS
RUNTIME=runtime-osx
CC=g++
CCARGS=-c -I $(RUNTIME)/antlr4-runtime/ -I $(GENERATED) -std=c++11	
LDARGS=-g
LIBS=$(RUNTIME)/lib/libantlr4-runtime.a

all: hello

hello: dirs antlr4 hello.cpp
	$(CC) $(CCARGS) hello.cpp  -o $(OUTPUT)/hello.o 
	$(CC) $(CCARGS) $(GENERATED)/modelicaBaseListener.cpp -o $(OUTPUT)/modelicaBaseListener.o 
	$(CC) $(CCARGS) $(GENERATED)/modelicaLexer.cpp -o $(OUTPUT)/modelicaLexer.o 
	$(CC) $(CCARGS) $(GENERATED)/modelicaListener.cpp -o $(OUTPUT)/modelicaListener.o 
	$(CC) $(CCARGS) $(GENERATED)/modelicaParser.cpp -o $(OUTPUT)/modelicaParser.o 
	$(CC) $(LDARGS) $(OUTPUT)/hello.o $(OUTPUT)/modelicaBaseListener.o $(OUTPUT)/modelicaLexer.o $(OUTPUT)/modelicaListener.o $(OUTPUT)/modelicaParser.o $(LIBS) -o hello

antlr4: $(GRAMMAR)
	$(JAVA) -jar antlr-4.7-complete.jar -Dlanguage=Cpp -o $(GENERATED) $(GRAMMAR)

dirs:
	mkdir -p $(OUTPUT) 
	mkdir -p $(GENERATED) 

clean:
	rm -rf $(OUTPUT)
	rm -rf $(GENERATED)
