# ATDD-TDD-TypeScript: ATDD - 00 Hello World TypeScript

'Hello, World!' to demostrate TypeScript language features.

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)

# Setup

#### In the termal build and run TypeScript file

```bash
~ yarn install
~ tsc hello_world.ts
~ node hello_world.js
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
