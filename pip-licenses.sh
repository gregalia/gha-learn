!/bin/bash
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

license_file="${GITHUB_REPOSITORY}-pip-licenses.md"
# remove everything before the last slash
license_file="${license_file##*/}"

{
  echo -e "# ${GITHUB_REPOSITORY} Licenses\n"

  pip-licenses \
    --python=./requirements-env/bin/python3 \
    --from=mixed \
    --order=license \
    --format=markdown

  echo -e "\n## Summary\n"

  pip-licenses \
    --python=./requirements-env/bin/python3 \
    --from=mixed \
    --order=license \
    --format=markdown \
    --summary

} >>"${license_file}"

cat "${license_file}"
