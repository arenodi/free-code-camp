function palindrome(str) {
  const myStr = str.match(/[^\s\_\-\*\#$&:,.\?@\\\/\|\(\)]/gi).join('').toLowerCase();
  const myRevStr = str.match(/[^\s\_\-\*\#$&:,.\?@\\\/\|\(\)]/gi)
                  .reverse().join('').toLowerCase();
  console.log(myRevStr, myStr);
  return myRevStr === myStr;
}

console.log(palindrome("0_0 (: /-\ :) 0-0"));