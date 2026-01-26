# Python Project

## Overview
[Project description - update this after initialization]

## Tech Stack
- Runtime: Python 3.10+
- Package Manager: pip / poetry / uv
- Framework: [FastAPI / Django / Flask / None]
- Testing: pytest
- Linting: ruff / black + isort + flake8

## Commands

### Setup Virtual Environment
```bash
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
# or
.venv\Scripts\activate  # Windows
```

### Install Dependencies
```bash
pip install -r requirements.txt
# or with poetry
poetry install
# or with uv
uv pip install -r requirements.txt
```

### Development
```bash
python -m src.main
# or for web frameworks
uvicorn src.main:app --reload
```

### Test
```bash
pytest
# With coverage
pytest --cov=src
# Verbose
pytest -v
# Specific file
pytest tests/test_feature.py
```

### Lint & Format
```bash
# With ruff (recommended)
ruff check .
ruff format .

# Or traditional
black .
isort .
flake8
```

### Type Check
```bash
mypy src/
# or
pyright src/
```

## Project Structure
```
src/
├── __init__.py
├── main.py              # Entry point
├── config.py            # Configuration
├── models/              # Data models
│   └── __init__.py
├── services/            # Business logic
│   └── __init__.py
├── api/                 # API routes (if applicable)
│   └── __init__.py
└── utils/               # Utilities
    └── __init__.py

tests/
├── __init__.py
├── conftest.py          # Pytest fixtures
├── test_main.py
└── test_services/

pyproject.toml           # Project config
requirements.txt         # Dependencies
.env.example             # Environment template
```

## Code Conventions

### Style
- Follow PEP 8
- Use type hints everywhere
- Docstrings for public functions (Google style)
- Max line length: 88 (black default)

### Imports
```python
# Standard library
import os
from typing import Optional

# Third party
import requests
from fastapi import FastAPI

# Local
from src.models import User
from src.utils import helpers
```

### Type Hints
```python
def process_user(
    user_id: int,
    options: dict[str, Any] | None = None
) -> User:
    """Process a user by ID.

    Args:
        user_id: The user's unique identifier.
        options: Optional processing options.

    Returns:
        The processed User object.

    Raises:
        UserNotFoundError: If user doesn't exist.
    """
    ...
```

### Error Handling
```python
# Define custom exceptions
class UserNotFoundError(Exception):
    pass

# Use specific exceptions
try:
    user = get_user(user_id)
except UserNotFoundError:
    logger.warning(f"User {user_id} not found")
    raise
```

## Important Files
- Entry: `src/main.py`
- Config: `pyproject.toml`, `setup.py`, `setup.cfg`
- Dependencies: `requirements.txt`, `pyproject.toml`
- Tests: `tests/conftest.py`

## Environment
- Python version: See `.python-version` or `pyproject.toml`
- Virtual environment: `.venv/`
- Environment variables: See `.env.example`

## Patterns to Follow
- [Add project-specific patterns here]

## Notes
- [Add learnings and context here]

---
*Template from awesome-claude-code. Customize for your project.*
