# Makefile for Django project (digifarm) using uv

# Variables
MANAGE = uv run manage.py

.PHONY: help install test run shell migrate makemigrations createsuperuser \
        isort black flake8 clean

help:
	@echo "Digifarm Django Makefile Commands:"
	@echo "  install       Install dependencies (uv pip install -r requirements.txt)"
	@echo "  run           Run Django development server"
	@echo "  shell         Open Django shell"
	@echo "  migrate       Apply database migrations"
	@echo "  makemigrations Create new migrations"
	@echo "  createsuperuser Create a superuser"
	@echo "  test          Run tests"
	@echo "  isort         Sort imports with isort"
	@echo "  black         Format code with black"
	@echo "  flake8        Lint code with flake8"
	@echo "  clean         Remove temporary files"

install:
	uv pip install -r requirements.txt

run:
	$(MANAGE) runserver

shell:
	$(MANAGE) shell

migrate:
	$(MANAGE) migrate

makemigrations:
	$(MANAGE) makemigrations

createsuperuser:
	$(MANAGE) createsuperuser

test:
	$(MANAGE) test

isort:
	uv run isort .

black:
	uv run black .

flake8:
	uv run flake8

clean:
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	rm -f .coverage