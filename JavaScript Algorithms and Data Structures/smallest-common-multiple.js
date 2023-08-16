function smallestCommons(arr) {
  const myRng = [];
  for (
    let i = (arr.sort((a,b) => a-b)[0]);
    i <= arr.sort((a,b) => a-b)[1];
    i++) {
    myRng.push(i);
  }
  const myGcd = (a = 0,b = 1) => a == 0 ? b : b == 0 ? a : myGcd (b, a % b);
  const myLcm = (a = 1, b = 1) => a * b / myGcd(a, b);

  return myRng.reduce((a,b) => myLcm(a,b), myRng[0]);
}

console.log(smallestCommons([1,13]));