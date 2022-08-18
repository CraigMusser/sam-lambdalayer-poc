set -eo pipefail

rm -rf sam-app
sam init --runtime python3.8 --dependency-manager pip --name sam-app --app-template hello-world

cd sam-app
echo "Current working directory"
pwd

#   Build the dependencies
echo "Build Dependencies"
mkdir --verbose dependencies
mkdir --verbose dependencies/python
# mkdir --verbose dependencies/python/lib
# mkdir --verbose dependencies/python/lib/python3.9
# mkdir --verbose dependencies/python/lib/python3.9/site-packages
cp --verbose ../requirements.txt dependencies
# python3 -m pip install --requirement dependencies/requirements.txt --target dependencies/python/lib/python3.9/site-packages
python3 -m pip install --requirement dependencies/requirements.txt --target dependencies/python

# Deployment Setup
cp --verbose ../template-depend3.yaml template.yaml
# copy the app.py
cp --verbose ../app-depend3.py hello_world/app.py

tree -L 3 -I 'tests'

sam local start-api
