# Jenkins Webhook Trigger

### Running Locally

Instructions for running the underlying python webhook token separate from the GitHub action. There is a prerequisite here that a Jenkins server is being used in which the user knows the relevant pipeline token to use.

If pipenv is not installed, install with below
```shell
python3 -m pip install --upgrade pipenv
```

Install dependencies
```shell
pipenv install --deploy
```

Run default webhook trigger
```shell
pipenv run python3 default_webhook_trigger.py \
  --jenkins_url=<JENKINS_URL> \
  --pipeline_token=<JENKINS_TOKEN> \
  --job_name=<JOB_NAME> \
  --job_param="GIT_REPO_URL=https://github.com/lewijacn/opensearch-migrations.git,GIT_BRANCH=main"
```
