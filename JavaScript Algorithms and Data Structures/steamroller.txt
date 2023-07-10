function steamrollArray(arr) {
  const flattenArr = [];
  let myFun = (flatArr, item) => {
      if(Array.isArray(item) && item.length > 0) {
        for (let i = 0; i < item.length; i++) {
          if(typeof item[i] === 'number' || !Array.isArray(item[i])) {
            flatArr.push(item[i]);
          } else {
            myFun(flatArr, item[i]);
          }
        }
      } else {

      } 
    }

  myFun(flattenArr, arr);

  return flattenArr;


}

console.log(steamrollArray([1, {}, [3, [[4]]]]));
//console.log(typeof parseInt([1, 2].join('')));
//console.log(Array.isArray())