import os
import pytest
import sys

sys.path.append(os.path.abspath('src'))

from service.app import a_true_function


def test_a_true_function():
	assert a_true_function() == True

