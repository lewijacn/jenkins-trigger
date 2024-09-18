#!/bin/bash

printenv

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
  branch_name="${PR_BRANCH}"
  pr_repo_url="${PR_REPO}"
else
  branch_name="${PUSH_BRANCH}"
  pr_repo_url="${PUSH_REPO}"
fi
echo "Running jenkins test on repo: $pr_repo_url and branch: $branch_name"
pipenv run python3 default_webhook_trigger.py \
  --jenkins_url="${INPUT_JENKINS_URL}" \
  --pipeline_token="${INPUT_API_TOKEN}" \
  --job_name="${INPUT_JOB_NAME }" \
  --job_params="${INPUT_JOB_PARAMS}" \
  --job_timeout_minutes="${INPUT_JOB_TIMEOUT_MINUTES}"
