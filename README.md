# Jenkins Trigger

A Github Action to trigger Jenkins jobs and monitor for completion

## Usage

```yml
name: "Trigger Jenkins Job"
on:
  push:
  pull_request_target:
    types: [opened, synchronize, reopened]

jobs:
  trigger-jenkins:
    runs-on: ubuntu-latest
    steps:
      - uses: lewijacn/trigger-jenkins@v1.0
        with:
          jenkins_url: 'https://test-jenkins-url'
          job_name: 'test-job'
          api_token: "${{ secrets.WEBHOOK_TOKEN }}"
          job_param: "STAGE=dev,BRANCH=main"
          job_timeout_minutes: '2'
```

# Changelog

## v1.0
- Initial Release
