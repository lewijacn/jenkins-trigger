# Jenkins Trigger

A Github Action to trigger Jenkins jobs and monitor for completion

```yaml
```

## Usage

```yml
name: "Trigger Jenkins Job"
on:
  push:
  pull_request_target:
    types: [opened, synchronize, reopened]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: lewijacn/trigger-jenkins@v1.0
        with:
          checklist-items: |
            Added unit test(s)
```

# Changelog

## v1.0
- Initial Release
