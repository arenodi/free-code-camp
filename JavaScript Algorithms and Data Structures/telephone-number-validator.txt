function telephoneCheck(str) {
  const myNumArray = [];
  let myParenStatus = 'closed';

  if (str.length <= 16 && /\d|\(/.test(str[0]) && /\d/.test(str[str.length - 1]) && str.match(/(\d+)/g).length <= 4) {
    for (let i = 0; i < str.length; i++) {
      
      if(/\d/.test(str[i])) {
        myNumArray.push(str[i]);
      } else if (/\(/.test(str[i]) && myParenStatus == 'closed' && /\((?=.*\))/.test(str)) {
        myParenStatus = 'open';
      } else if (/\)/.test(str[i]) && myParenStatus == 'open') {
        myParenStatus = 'closed';
      } else if (!/\-|\s/.test(str[i])){
        console.log(str[i]);
        return false
      }
    }
    console.log(myNumArray);
    if (myNumArray.length >= 10 && myNumArray.length <= 11) {

      if (myNumArray.length == 11 && myNumArray[0] != 1) {
        return false;
      } else if (myNumArray.length == 10 && myNumArray[0] == 1) {
        return false;
      }
      
    } else {
      return false;
    }
  } else {
    return false;
  }


  return true;
}

console.log(telephoneCheck("(555)555-555"));
console.log(/\d|\(/.test('5'));
//console.log(/\((?=.*\))/.test('(555 666) '));