// import { fizzBuzz } from '../src/fizz-buzz';

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
PROBLEM REQUIREMENTS:
- For multiples of three print “Fizz” instead of the number
- For the multiples of five print “Buzz”. 
- For numbers which are multiples of both three and five print “FizzBuzz“.
**Upper bound**: 15
**Example output**: ['1', '2', 'Fizz', '4', 'Buzz', '6', '7', '8', '9', '10', '11', '12', '13', '14', 'FizzBuzz']
*/

describe('Test Fizz Buzz', () => {
  it('does run Jest', () => {
    expect(true).toBe(true); // pass
    // expect(true).toBe(false); // fail
  });

  it('should work with zero', () => {
    // arrange
    // let expected = [];
    //
    // act
    // let result = fizzBuzz(0);
    //
    // asssert
    // expect(expected).toEqual(result);
  });
});
