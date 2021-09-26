# ATDD-TDD-TypeScript: TDD - 02 Fizz Buzz

Fizz Buzz in TypeScript.

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)

# Fizz Buzz

[Fizz Buzz: Coding Dojo](http://codingdojo.org/kata/FizzBuzz)

## Problem Description

Write a program that returns a list of number strings from 1 to n, where n is the upper bound.

- For multiples of three print “Fizz” instead of the number
- For the multiples of five print “Buzz”.
- For numbers which are multiples of both three and five print “FizzBuzz“.

**Upper bound**: 15 <br/>
**Example output**: ['1', '2', 'Fizz', '4', 'Buzz', '6', '7', '8', '9', '10', '11', '12', '13', '14', 'FizzBuzz']

# Setup

#### In the termal

```bash
~ yarn install
~ yarn test
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
      "args": ["-i"],
      "console": "integratedTerminal",
      "outFiles": ["${workspaceRoot}/dist/**/*"],
      "envFile": "${workspaceRoot}/.env"
    }
  ]
```

---

![](/assets/dev3l-solutions-logo-lean-dog.png)
