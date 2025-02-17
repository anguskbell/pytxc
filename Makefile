SHELL:=/usr/bin/env bash


.PHONY: lint
lint:
	poetry run mypy pytxc tests/*.py
	poetry run flake8 pytxc tests

.PHONY: unit
unit:
	poetry run pytest tests/

.PHONY: package
package:
	poetry check
	poetry run pip check
	poetry run safety check --full-report

.PHONY: test
test: lint package unit
