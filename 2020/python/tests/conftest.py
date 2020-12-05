from pathlib import Path

import pytest


@pytest.fixture
def fixtures():
    return Path(__file__).with_name("fixtures")
