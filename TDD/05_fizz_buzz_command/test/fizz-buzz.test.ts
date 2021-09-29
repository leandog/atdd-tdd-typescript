import { FizzBuzz } from '../src/fizz-buzz';

/*
# Three Laws of Test Driven Development
- You are not allowed to write any production code unless it is to make a failing unit test pass.
- You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
- You are not allowed to write any more production code than is sufficient to pass the one failing unit test.
*/

/*
Fake it till you make it
*/

/*
# ZOMBIES
Z - Zero                          
O - One                           
M - Many
B - Boundary Behavior
I - Interface Definition          
E - Exercise Exception Behavior
S - Simple
*/

/*
S - Single Responsibility Principle
O - Open / Closed => Open for extension, closed for modification
L - Liskov Substitution => shape.area :: rectangle.area : square.area : circle.area
I - Interface Segregation
D - Dependency Inversion
*/

/*
D - Don't
R - Repeat
Y - Yourself
*/

/*
Y - You
A - Ain't
G - Gonna
N - Need
I - It
*/

/*
Boy Scout Rule - leave the code better than you found it
*/

/*
PROBLEM REQUIREMENTS:
- For the multiples of seven print “Pop”, unless it is a multiple of three or five. 

- For multiples of three set “Fizz” instead of the number
- For the multiples of five set “Buzz”. 
- For numbers which are multiples of both three and five set “FizzBuzz“.
- Otherwise set the ordinal number
**Upper bound**: 15
**Example output**: [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz']
*/

describe('Test Fizz Buzz', () => {
  it('should work with zero', () => {
    let expected = [];
    let result = new FizzBuzz().execute(0);
    expect(result).toEqual(expected);
  });

  it('should work with one', () => {
    let expected = [1];
    let result = new FizzBuzz().execute(1);
    expect(result).toEqual(expected);
  });

  it('should work with many', () => {
    let expected = [1, 2];
    let result = new FizzBuzz().execute(2);
    expect(result).toEqual(expected);
  });

  it('should work with Fizz', () => {
    let expected = [1, 2, 'Fizz'];
    let result = new FizzBuzz().execute(3);
    expect(result).toEqual(expected);
  });

  it('should work with Buzz', () => {
    let expected = [1, 2, 'Fizz', 4, 'Buzz'];
    let result = new FizzBuzz().execute(5);
    expect(result).toEqual(expected);
  });

  it('should work with FizzBuzz', () => {
    let expected = [1, 2, 'Fizz', 4, 'Buzz', 'Fizz', 7, 8, 'Fizz', 'Buzz', 11, 'Fizz', 13, 14, 'FizzBuzz'];
    let result = new FizzBuzz().execute(15);
    expect(result).toEqual(expected);
  });
});
