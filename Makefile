CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -fprofile-arcs -ftest-coverage
LDFLAGS = -lgcov -lcheck -lsubunit -lm
SRC = src/main.c src/funciones.c
TEST = test/test_funciones.c

all: main

main: $(SRC)
	mkdir -p bin	
	$(CC) $(CFLAGS) -o bin/main $(SRC)

test: $(TEST) src/funciones.c
	$(CC) $(CFLAGS) -Iinclude -o bin/test_funciones $(TEST) src/funciones.c $(LDFLAGS)
	./bin/test_funciones

coverage:
	make test
	lcov --capture --directory . --output-file coverage.info
	genhtml coverage.info --output-directory coverage_html

gcovr-html:
	gcovr -r . --html --html-details -o coverage_html/index.html

gcovr-json:
	gcovr -r . --json-pretty -o coverage.json

gcovr-xml:
	gcovr -r . --xml-pretty -o coverage.xml

clean:
	rm -f bin/* *.gcno *.gcda *.gcov *.info coverage.* *.txt *.json *.xml
	rm -rf coverage_html

.PHONY: all main test coverage coverage-only gcovr-html gcovr-json gcovr-xml clean
