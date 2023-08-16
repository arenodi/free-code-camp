function addTogether() {
  const myArgs = Array.prototype.slice.call(arguments);
  console.log(myArgs);
  if (myArgs.length > 1 &&
      myArgs.every(item => typeof item === 'number')) {
    return myArgs.reduce((sum, item) => sum + item);
  } else if (myArgs.length == 1 && typeof myArgs[0] === 'number') {
    return x => typeof x === 'number' ? arguments[0] + x : undefined;
  } else {
    return undefined;
  }
}

const test = addTogether(2)([3]);
console.log(test);