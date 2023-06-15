#!/bin/bash
# shellcheck disable=SC1091

echo "create requirements environment"
python3 -m venv requirements-env
source requirements-env/bin/activate
pip install -r requirements.txt
deactivate

echo "create pip-licenses environment"
python3 -m venv pip-licenses-env
source pip-licenses-env/bin/activate
pip install pip-licenses

echo "see if firetail shows up"
pip list -v |
  grep site-packages

echo "run as-is"
pip-licenses
echo "run with python from requirements env"
pip-licenses \
  --python=./requirements-env/bin/python3