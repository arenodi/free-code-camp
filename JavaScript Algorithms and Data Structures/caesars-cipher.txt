function rot13(str) {
  const myAlphabet = [];
  let newStr = '';
  for (let i=65; i<=90; i++) {myAlphabet.push(String.fromCharCode(i))}
  //console.log(myAlphabet.indexOf('A'));
  for (let i = 0; i < str.length; i++) {
    
    if (str[i].charCodeAt(0) >= 65 && str[i].charCodeAt(0) <= 90) {

      if(myAlphabet.indexOf(str[i]) + 13 >= myAlphabet.length) {
        newStr += myAlphabet[
          (myAlphabet.indexOf(str[i]) + 13) - myAlphabet.length];
      } else {
        newStr += myAlphabet[myAlphabet.indexOf(str[i]) + 13]
      }

    } else {
      newStr += str[i];
    } 
  }
  return newStr;
}

console.log(rot13("SERR CVMMN!"));
console.log(' '.charCodeAt(0))