# ATDD-TDD-TypeScript: TDD - 03 Roman Calculator

Roman Calculator in TypeScript.

# Prerequisites

- [Git](https://github.com/)
- [NodeJS](https://nodejs.org/en/download/) installed globally in the system.
- [TypeScript](https://www.typescriptlang.org/)
- [VS Code](https://code.visualstudio.com/)
  - [LiveShare](https://code.visualstudio.com/learn/collaboration/live-share)

# Kata Roman Calculator

[Kata Roman Calculator: Coding Dojo](https://codingdojo.org/kata/RomanCalculator/)

## Problem Description

“As a Roman Bookkeeper I want to add Roman numbers because doing it manually is too tedious.” Given the Roman numerals, (IVXLCDM which means one, five, ten, fifty, hundred, fivehundred and a thousand respectively), create two numbers and add them. As we are in Rome there is no such thing as decimals or int, we need to do this with the strings. An example would be “XIV” + “LX” = “LXXIV”

**There are some rules to a Roman number:**

- Numerals can be concatenated to form a larger numeral (“XX” + “II” = “XXII”)
- If a lesser numeral is put before a bigger it means subtraction of the lesser from the bigger (“IV” means four, “CM” means nine hundred)
- If the numeral is I, X or C you can’t have more than three (“II” + “II” = “IV”)
- If the numeral is V, L or D you can’t have more than one (“D” + “D” = “M”)

**Clues**

String grouping and concatenation is key to solving this kata. But, remember the rule that lesser numerals can precede bigger ones.

# Setup

## In the termal

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
