![CI](https://github.com/teverett/antlr4-cpp-example/workflows/CI/badge.svg)

# Antlr4 C++ Example

A simple example of using [Antlr4](http://www.antlr.org/) to generate a C++ Parser / Lexer, for [Modelica](https://www.modelica.org/).  The Modelica grammar for Antlr4 is from [here](https://github.com/antlr/grammars-v4/tree/master/modelica).

To run the example, simply run `./run.sh` or `make`

The example presumes that the java executable is on your path.

The output includes

`modelicaLexer.*`: Antlr4 Lexer for Modelica

`modelicaParser.*`: Antlr4 Parser for Modelica

`modelicaListener.*`: Antlr4 Listener implementation for Modelica

Note that the Listener classes are optional: not every application of Antlr4 requires a listener.


