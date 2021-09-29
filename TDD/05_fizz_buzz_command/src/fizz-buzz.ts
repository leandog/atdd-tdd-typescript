export class FizzBuzz {
  public execute(upperBound: number): (number | string)[] {
    var result: Array<number | string> = [];

    for (let i = 1; i <= upperBound; i++) {
      var value: number | string = '';

      if (i % 3 == 0) {
        value = 'Fizz';
      }
      if (i % 5 == 0) {
        value += 'Buzz';
      }

      value = value ? value : i;
      result.push(value);
    }

    return result;
  }
}
