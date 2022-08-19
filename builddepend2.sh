set -eo pipefail

rm -rf sam-app  # remove any existing instances
sam init --runtime python3.8 --dependency-manager pip --name sam-app --app-template hello-world # build the base app

cd sam-app
echo -e "Current working directory: \c "
pwd

#   Build the dependencies
echo "Build Dependencies"
mkdir --verbose dependencies
mkdir --verbose dependencies/python
cp --verbose ../requirements.txt dependencies       # copy the pip requirements.txt into place
python3 -m pip install --requirement dependencies/requirements.txt --target dependencies/python/lib/python3.8/site-packages     # pip install whats needed

# Scenario Deployment Setup
cp --verbose ../template-depend2.yaml template.yaml
# Scenario py script
cp --verbose ../app-flat.py hello_world/app.py

tree -L 5 -I 'tests'

sam local start-api
