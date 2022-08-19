# sam-lambdalayer-poc

This is just a proof of concept repo for me to learn to work with various scenarios building Lambda functions in AWS Severless via the AWS SAM CLI. 

This was an iterative process to help me understand why I couldn't get the layer to work correctly, initially. These scripts are the final result.

* buildflat.sh: builds a base SAM application and replaces the app.py with a similar script that just adds some logging to show the lambda_handler was invoked.
* builddepend1.sh: Same as buildflat.sh but adds dependency directories and replaces the template.yaml
* builddepend2.sh: Same as builddepend1.sh but adds the layer in the template
* builddepend3.sh: Same as builddepend2.sh but actually invokes the module provided by the lambda layer.
