function convertToRoman(num) {
  const romanTbl = [{roman:'I', arab:1}, {roman:'IV', arab:4},
  {roman:'V', arab:5}, {roman:'IX', arab:9}, {roman:'X', arab:10},
  {roman:'XL', arab:40},{roman:'L', arab:50},{roman:'XC', arab:90},
  {roman:'C', arab:100},{roman:'CD', arab:400},{roman:'D', arab:500},
  {roman:'CM', arab:900},{roman:'M', arab:1000}];
  
  const toRoman = (num) => {
    let romanNum = '';
    const baseNumber = romanTbl.reduce((acc = 0, item) =>
              acc < item.arab && item.arab <= num ?
              acc = item.arab : acc, [])
    console.log(baseNumber);
    if (num > 0) {
      console.log();
      romanNum = romanTbl
                .filter(item => item.arab === baseNumber)[0].roman
                .repeat(Math.floor(num / baseNumber));
      if(num % baseNumber != 0) {
        romanNum += toRoman(num % baseNumber);
        return romanNum;
      } else {
        return romanNum;
      }
    }
    
  };
  return toRoman(num);
}

console.log(convertToRoman(3));