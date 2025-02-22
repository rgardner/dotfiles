setup:
    uv sync --group lint
    uv run --only-group lint pre-commit install
    ./git-hooks/install-hooks.sh

format:
    uv run --only-group lint ruff format .

lint:
    uv run --only-group lint ruff format --check .
    uv run --only-group lint ruff check .
    uv run --only-group lint mypy .
