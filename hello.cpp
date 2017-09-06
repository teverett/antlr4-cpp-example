
#include <iostream>
#include <fstream>
#include <string>
#include "antlr4-runtime.h"
#include "modelicaLexer.h"
#include "modelicaParser.h"

using namespace antlr4;
using namespace std;

int main(int argc, char *argv[]) {
	string line;
	ifstream modelicaFile ("example2.txt");
	if (modelicaFile.is_open()) {
		ANTLRInputStream input(modelicaFile);
		modelicaLexer lexer(&input);
		CommonTokenStream tokens(&lexer);

		tokens.fill();
		for (auto token : tokens.getTokens()) {
			std::cout << token->toString() << std::endl;
		}

		modelicaParser parser(&tokens);
		tree::ParseTree *tree = parser.stored_definition();

		std::cout << tree->toStringTree(&parser) << std::endl;
		modelicaFile.close();
	}
}