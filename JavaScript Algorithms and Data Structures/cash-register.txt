function checkCashRegister(price, cash, cid) {
  const reference = [
    
    {name:'PENNY', value: 0.01},{name:'NICKEL', value: 0.05},
    {name:'DIME', value: 0.1},{name:'QUARTER', value: 0.25},
    {name:'ONE', value: 1},{name:'FIVE', value: 5},
    {name:'TEN', value: 10},{name:'TWENTY', value: 20},
    {name:'ONE HUNDRED', value: 100}    
  ]
  /*func 'times100' is used to transform decimals
    into whole numbers and then at the end 'divBy100'
    is used to turn the values back to decimals.
    This is a way to avoid the problem with math
    accuracy when working with decimals*/

  //Function to multiply num by 100
  const times100 = num => num * 100;
  //Function to divide num by 100
  const divBy100 = num => num / 100;

  const moneyToReturn = (aChange) => {
    let remaining = times100(aChange);
    const fromCid = [];
    //Return an array containing the 
    const moneyValue = reference
      .filter(item => item.value <= aChange)
      .map((item, index) => 
        [item.name, times100(item.value), times100(cid[index][1])]);
    
    for (let i = moneyValue.length - 1; i >= 0; i--) {
      let numOfBills = Math.floor(remaining / moneyValue[i][1]);

      if(remaining > 0 && numOfBills > 0) {
        if (moneyValue[i][2] >= (moneyValue[i][1] * numOfBills)) {
          remaining -= (moneyValue[i][1] * numOfBills);
          fromCid.push([moneyValue[i][0],
                        divBy100(moneyValue[i][1]*numOfBills)]);
        } else if (moneyValue[i][2] > 0 &&
                 moneyValue[i][2] < (moneyValue[i][1] * numOfBills)) {
          remaining -= moneyValue[i][2];
          fromCid.push([moneyValue[i][0], divBy100(moneyValue[i][2])])
        }
      }
    }
    return [remaining, fromCid];
  };

  let change = divBy100(times100(cash) - times100(price));
  let funds = cid
            .map(item => item[1])
            .reduce((sum, item) =>
                  divBy100(times100(sum) + times100(item)));
  console.log(funds)
  if (change == funds) {
    return {status: "CLOSED", change: [...cid]}
  } else if (change > funds || moneyToReturn(change)[0] > 0) {
    return {status: "INSUFFICIENT_FUNDS", change: []};
  } else {
    return {status: "OPEN", change: moneyToReturn(change)[1]}
  }
}

console.log(checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]]));