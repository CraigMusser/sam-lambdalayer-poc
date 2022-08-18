set -eo pipefail

rm -rf sam-app
sam init --runtime python3.8 --dependency-manager pip --name sam-app --app-template hello-world

# copy the app.py
cp app-flat.py sam-app/hello_world/app.py

cd sam-app
echo "Current working directory"
pwd

#   Build the dependencies
echo "Build Dependencies"
mkdir --verbose dependencies
mkdir --verbose dependencies/python
mkdir --verbose dependencies/python/lib
mkdir --verbose dependencies/python/lib/python3.8
mkdir --verbose dependencies/python/lib/python3.8/site-packages
cp --verbose ../requirements.txt dependencies
python3 -m pip install --requirement dependencies/requirements.txt --target dependencies/python/lib/python3.8/site-packages

# Deployment Setup
cp --verbose ../template-depend2.yaml template.yaml

tree -L 5 -I 'tests'

sam local start-api
