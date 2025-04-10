# 📘 Repaso Completo del Proyecto C con CI/CD y Cobertura

## 1. 🎯 Objetivo

Desarrollar un proyecto en lenguaje C que tenga:

- ✅ Compilación con Makefile moderno  
- ✅ Pruebas unitarias con Check  
- ✅ Cobertura de código con lcov/gcovr  
- ✅ Automatización CI/CD con GitHub Actions  
- ✅ Entorno reproducible con Docker/DevContainer  

---

## 2. 🗂️ Estructura del Proyecto

BullSala-proyecto-c/ ├── include/ # Headers .h ├── src/ # Código fuente ├── test/ # Unit tests ├── bin/ # Binarios compilados ├── Makefile # Automatiza build, test, cobertura ├── coverage_html/ # Reportes HTML ├── .github/workflows/ # CI GitHub Actions ├── .devcontainer/ # Docker para entorno reproducible

makefile
Copiar
Editar

---

## 3. 🛠️ Makefile Explicado

```make
CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -fprofile-arcs -ftest-coverage
LDFLAGS = -lgcov -lcheck -lsubunit -lm
SRC = src/main.c src/funciones.c
TEST = test/test_funciones.c

all: main
main:
	mkdir -p bin
	$(CC) $(CFLAGS) -o bin/main $(SRC)

test: $(TEST) src/funciones.c
	$(CC) $(CFLAGS) -o bin/test_funciones $(TEST) src/funciones.c $(LDFLAGS)
	./bin/test_funciones

coverage:
	make test
	lcov --capture --directory . --output-file coverage.info
	genhtml coverage.info --output-directory coverage_html

gcovr-html:
	gcovr -r . --html --html-details -o coverage_html/index.html

clean:
	rm -f bin/* *.gcno *.gcda *.gcov *.info coverage.* *.json *.xml
	rm -rf coverage_html

.PHONY: all main test coverage gcovr-html clean
4. ✅ Testing con Check
Usamos la librería Check

Linkeo con -lcheck -lsubunit -lm

Usamos assert_* en pruebas de funciones

5. 📊 Cobertura
Flags: -fprofile-arcs -ftest-coverage

lcov genera coverage.info

genhtml genera HTML visual

gcovr permite HTML, JSON, XML

6. 🔁 GitHub Actions (CI)
.github/workflows/ci.yml

yaml
Copiar
Editar
name: CI C Coverage
on: [push, pull_request]
jobs:
  build-test:
    runs-on: ubuntu-latest
    container:
      image: ubuntu:22.04
    steps:
      - uses: actions/checkout@v3
      - name: Install dependencies
        run: |
          export DEBIAN_FRONTEND=noninteractive
          ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime
          apt update
          apt install -y tzdata
          dpkg-reconfigure -f noninteractive tzdata
          apt install -y build-essential check lcov gcovr make git curl
      - name: Compile project
        run: make
      - name: Run unit tests
        run: make test
      - name: Generate coverage
        run: |
          make coverage
          make gcovr-html
7. 🧯 Problemas Solucionados
Problema	Causa	Solución
apt se cuelga	tzdata pide input	DEBIAN_FRONTEND=noninteractive
undefined reference to floor	falta -lm	Agregamos -lm a LDFLAGS
subunit_test_* missing	falta -lsubunit	Agregado a LDFLAGS
cannot open *.gcno	falta dir bin/	mkdir -p bin en Makefile
Push bloqueado	token sin workflow scope	Regeneramos el token correcto
8. 🐳 Docker y DevContainer
Creamos .devcontainer/devcontainer.json

Dockerfile con Ubuntu, GCC, Check, lcov, gcovr

VS Code puede abrir el contenedor listo para trabajar

9. 🏷️ README.md con Badges
markdown
Copiar
Editar
![Build Status](https://github.com/BullSala/BullSala-proyecto-c/actions/workflows/ci.yml/badge.svg)
[![Coverage](https://img.shields.io/badge/coverage-manual-brightgreen)](./coverage_html/index.html)
10. 🚀 Mejoras Futuras
Mejora	Propósito
Integrar Codecov	Mostrar cobertura real como badge
+ tests	Mejorar cobertura real
+ Doxygen	Documentación automática de funciones
Releases automáticos	Crear ZIPs al taguear
