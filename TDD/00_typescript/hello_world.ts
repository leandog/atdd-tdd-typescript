// Comment

/* 
  Multiline Comment
*/

/* Basic types
any
void

boolean
number
string

null
undefined

string[]          // or Array<string>
[string, number]  // tuple

string | null | undefined   // union

never  // unreachable
enum Color {Red, Green, Blue = 4}
let c: Color = Color.Green
*/

/* Declarations */

let isDone: boolean;
var isReady: boolean = false;
function add(a: number, b: number): number {
  return a + b;
}

// Return type is optional
function subtract(a: number, b: number) {
  return a - b;
}

/* Variable Assignment */

// Hoisted
x = 5;
var x: number = 0;

// Function Scoped
let z = 0;
z = 5;

// Immutable
const q = 'hello';

// String Interpolation
let interpolatedValue = `z is ${z}`;

/* Function Calls */

helloWorld();
function helloWorld(): string {
  return 'Hello, world!';
}

let helloWorldAnonymous = (): string => {
  return 'Hello, world!';
};
helloWorldAnonymous();

/* Type assertions */

let numberString = '3';
let numberLength: number = (numberString as string).length;

/* Interfaces */

// Inline
function printLabel(configuration: { label: string }) {
  console.log(configuration.label);
}
printLabel({ label: 'This workshop will be in TypeScript' });

// Explicit
interface LabelOptions {
  label: string;
}

// Optional properties
interface User {
  name: string;
  age?: number;
}

// Read only
interface UserReadOnly {
  readonly name: string;
}

/* Type aliases */

type Name = string | string[];
let aName: Name = 'aName';

/* Function types */

interface FunctionalUser {
  name: string;
}

let functionalUser = { name: 'atdd-tdd-typescript' };
let printUserCallback = (user: FunctionalUser) => console.log(user.name);

function getFunctionalUser(callback: (user: FunctionalUser) => any) {
  callback(functionalUser);
}
getFunctionalUser(printUserCallback);

/* Classes */

class Point {
  x: number;
  y: number;
  static instances = 0;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}
let point = new Point(3, 4);

// Inheritance
class PointArea extends Point {
  area(): number {
    return this.x * this.y;
  }
}

interface Colored {
  paint();
}

class Pixel extends Point implements Colored {
  paint() {
    console.log(`painting ${this.x} to ${this.y}`);
  }
}

// Short fields initialization
class PointInitialization {
  constructor(public x: number, public y: number) {}
}
let initializedPoint = new PointInitialization(1, 2);

/*  Generics */

class Greeter<T> {
  greeting: T;
  constructor(message: T) {
    this.greeting = message;
  }
}

let greeter = new Greeter<string>('Hello ATDD/TDD, world!');
greeter.greeting;

/* Conditionals (if) */

let value = 0;
let message = '';

if (value == 5) {
  message = 'Success';
} else if (value == 6) {
  message = 'Acceptable';
} else {
  message = 'FAILURE';
}

/* Arrays */

let fruits: string[] = ['Apple', 'Orange', 'Strawberry'];

fruits.push('Banana');
fruits.unshift('Mango');

let mango = fruits[0];
let banana = fruits[fruits.length - 1];

let vegetables = new Array<string>();

let multiArray: (number | string)[] = [1, 'Apple'];

// Functional - filter, map, reduce

let sum = ['1', '2', '3', 'NaN'] // sum = 6
  .filter((stringNumber) => {
    return !Number.isNaN(Number(stringNumber));
  })
  .map((stringNumber) => {
    return Number(stringNumber);
  })
  .reduce((sum, number) => {
    return sum + number;
  });

/* Iteration */

for (var i = 0; i < 10; i++) {}

var whileIndex = 10;
while (whileIndex > 0) {
  whileIndex--;
}

let cards = ['ace', 'jack', 'queen'];
for (let card in cards) {
}

cards.forEach((card) => {});

/* Equality */

// Strict

'hello' === 'hello'; // true

// Loose

5 == 5; // true

/* Dictionaries / Objects */

let dictionaryObject = { key: 3, value: 5, weight: 'lb' };
dictionaryObject['key'];
dictionaryObject.value;
dictionaryObject.weight = 'kg';

console.log(greeter.greeting);
