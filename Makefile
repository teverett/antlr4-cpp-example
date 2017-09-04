
JAVA=/usr/bin/java
OUTPUT=output
GENERATED=generated
GRAMMAR=modelica.g4
CC=c++
CCARGS=-I runtime/antlr4-runtime/

all: hello

hello: dirs antlr4 hello.cpp
	$(CC) -o $(OUTPUT)/hello.o hello.cpp 
	$(CC) $(CCARGS) -o $(OUTPUT)/modelicaBaseListener.o $(GENERATED)/modelicaBaseListener.cpp 
	$(CC) $(CCARGS) -o $(OUTPUT)/modelicaLexer.o $(GENERATED)/modelicaLexer.cpp
	$(CC) $(CCARGS) -o $(OUTPUT)/modelicaListener.o $(GENERATED)/modelicaListener.cpp
	$(CC) $(CCARGS) -o $(OUTPUT)/modelicaParser.o $(GENERATED)/modelicaParser.cpp

antlr4: $(GRAMMAR)
	$(JAVA) -jar antlr-4.7-complete.jar -Dlanguage=Cpp -o $(GENERATED) $(GRAMMAR)

dirs:
	mkdir -p $(OUTPUT) 
	mkdir -p $(GENERATED) 

clean:
	rm -rf $(OUTPUT)
	rm -rf $(GENERATED)


