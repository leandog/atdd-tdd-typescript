# ATDD-TDD-TypeScript: ATDD - 06 Calculated

Calculated scenarioes with Puppies site

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)
- **Chrome** browser installed
- [Docker](https://www.docker.com/)

# Setup

#### Run Puppies site in Docker

```bash
~ cd ../ATDD/puppies
~ docker-compose up
```

#### Start and run webdriver

```bash
~ yarn install
~ yarn webdriver-update
~ yarn webdriver-start
```

#### Build and watch

```bash
~ yarn build-watch
```

#### Run test

```bash
~ yarn test
```

# VSCode Runtime Configuration

```json
# $NODE = which node
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Puppies Features",
      "program": "${workspaceFolder}/node_modules/protractor/bin/protractor",
      "args": ["${workspaceFolder}/typeScript/config/config.js"],
      "runtimeExecutable": "$NODE"
    }
  ]
}
```

---

![](/assets/dev3l-solutions-logo-lean-dog.png)
