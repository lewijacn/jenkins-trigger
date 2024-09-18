#!/bin/bash

printenv

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
  branch_name="${{ github.event.pull_request.head.ref }}"
  #pr_repo_url="https://github.com/${{ github.event.pull_request.head.repo.full_name }}.git"
else
  branch_name="${GITHUB_REF_NAME}"
  #pr_repo_url="https://github.com/${{ github.repository }}.git"
fi
pr_repo_url="https://github.com/${GITHUB_REPOSITORY}.git"



echo "Running jenkins test on repo: $pr_repo_url and branch: $branch_name"
pipenv run python3 default_webhook_trigger.py \
  --jenkins_url="${INPUT_JENKINS_URL}" \
  --pipeline_token="${INPUT_API_TOKEN}" \
  --job_name="${INPUT_JOB_NAME}" \
  --job_params="${INPUT_JOB_PARAMS}" \
  --job_timeout_minutes="${INPUT_JOB_TIMEOUT_MINUTES}"
