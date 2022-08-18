set -eo pipefail

rm -rf sam-app
sam init --runtime python3.8 --dependency-manager pip --name sam-app --app-template hello-world

# copy the app.py
cp app-flat.py sam-app/hello_world/app.py

cd sam-app
echo "Current working directory"
pwd

tree -L 5 -I 'tests'

sam local start-api
