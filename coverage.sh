#!/bin/bash
set -e
make clean || true
make test
make gcovr-html
echo "Reporte generado en ./coverage_html/index.html"
