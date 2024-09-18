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
          job_params: "STAGE=dev,BRANCH=main"
          job_timeout_minutes: '10'
```

## Inputs
| Name                | Required | Example                                                                                | Description                                                                                                                  |
|---------------------|----------|----------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| jenkins_url         | `true`   | `"https://my-jenkins-server.com"`                                                      | Jenkins URL including http/https protocol                                                                                    |
| job_name            | `true`   | `"test-job"`                                                                           | The job name to trigger in Jenkins                                                                                           |
| api_token           | `true`   | `"jenkins-token"`                                                                      | The token for authenticating with the Jenkins generic webhook                                                                |
| job_params          | false    | `"GIT_REPO_URL=https://github.com/lewijacn/opensearch-migrations.git,GIT_BRANCH=main"` | Job parameters, separated by a comma, to provide to a Jenkins workflow. Job name will automatically be added as a parameter. |
| job_timeout_minutes | false    | 10                                                                                     | Max time (minutes) this Github Action will wait for completion. Default is 60 minutes                                        |

# Changelog

## v1.0
- Initial Release
