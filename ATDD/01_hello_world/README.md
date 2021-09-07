# ATDD-TDD-TypeScript: ATDD - 01 Hello World

"'Hello, World!' to demostrate protractor cucumber tests in TypeScript.

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)
- **Chrome** browser installed

# Setup

#### In one termal start and run webdriver

```bash
~ yarn install
~ yarn webdriver-update
~ yarn webdriver-start
```

#### In a second termal build and watch

```bash
~ yarn build-watch
```

#### In a third termal run test

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
      "name": "Protractor Features",
      "program": "${workspaceFolder}/node_modules/protractor/bin/protractor",
      "args": ["${workspaceFolder}/typeScript/config/config.js"],
      "runtimeExecutable": "$NODE"
    }
  ]
}
```

---

![](/assets/dev3l-solutions-logo-lean-dog.png)
