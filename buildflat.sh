set -eo pipefail

rm -rf sam-app  # remove any existing instances
sam init --runtime python3.8 --dependency-manager pip --name sam-app --app-template hello-world # build the base app

cd sam-app
echo -e "Current working directory: \c "
pwd

# Scenario py script
cp --verbose ../app-flat.py hello_world/app.py

tree -L 5 -I 'tests'

sam local start-api
