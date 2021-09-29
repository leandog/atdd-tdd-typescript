# ATDD-TDD-TypeScript: TDD - 07 Widget Mock

Widget Mock in TypeScript.

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)

# Widget Mock

## Problem Description

Users lover our new Widget service. The ability to get all the Widgets sorted by name was a fantastic success!
Recently, users have been asking to be able to get all their Widgets sorted by size.

It took a while for us to get here, but we are finally in a position where the sorted by size feature has
been added to the backlog for this sprint.

The team has been using TDD, but has ran into some slowness recently when running the tests...
When there was only one Widget available, the problem was not noticable, but now with the addition of the
last new Widget, the tests started failing. One of the dev's on the team noticed if the timeout
was extended that the tests started passing again.

The WidgetDb and WidgetDao are well covered with intergration tests, but team has decided that the WidgetService
can be switched to a pure unit test.

### Tasks

- Invert the WidgetDao dependency in the WidgetService test suite to run without the extension of the default timeout
- Add the sort by size feature to the WidgetService

# Setup

#### In the termal

```bash
~ yarn install
~ yarn test
```

## Coverage report

```bash
yarn test:coverage
```

# VSCode Runtime Configuration

```json
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Jest Tests",
      "program": "${workspaceRoot}/node_modules/jest/bin/jest.js",
      "args": ["--no-watchman"],
      "console": "integratedTerminal",
      "outFiles": ["${workspaceRoot}/dist/**/*"],
      "envFile": "${workspaceRoot}/.env"
    }
  ]
```

---

![](/assets/dev3l-solutions-logo-lean-dog.png)
