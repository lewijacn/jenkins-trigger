#!/bin/bash

printenv

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]]; then
  branch_name="${{ github.event.pull_request.head.ref }}"
  pr_repo_url="https://github.com/${{ github.event.pull_request.head.repo.full_name }}.git"
else
  branch_name="${{ github.ref_name }}"
  pr_repo_url="https://github.com/${{ github.repository }}.git"
fi
echo "Running jenkins test on repo: $pr_repo_url and branch: $branch_name"
pipenv run python3 default_webhook_trigger.py \
  --jenkins_url="${{ inputs.jenkins_url }}" \
  --pipeline_token="${{ inputs.api_token }}" \
  --job_name="${{ inputs.job_name }}" \
  --job_params="${{ inputs.job_params }}" \
  --job_timeout_minutes="${{ inputs.job_timeout_minutes }}"
