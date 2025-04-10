# Proyecto C con CI/CD, Docker y Cobertura

[![Coverage](https://img.shields.io/badge/coverage-manual-brightgreen)](./coverage_html/index.html)

Este proyecto en lenguaje C está preparado con:
- Pruebas unitarias con `Check`
- Cobertura de código con `lcov` y `gcovr`
- CI/CD con GitHub Actions
- Entorno reproducible con Docker / DevContainer

## Comandos útiles

```bash
make test         # Ejecuta pruebas
make coverage     # Genera cobertura con lcov
make gcovr-html   # Genera reporte HTML con gcovr
```

## Estructura

- `src/`: Código fuente
- `include/`: Headers
- `test/`: Pruebas unitarias
- `.github/`: CI GitHub Actions
- `.devcontainer/`: Configuración VS Code + Docker
