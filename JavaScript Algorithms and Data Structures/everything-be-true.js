function truthCheck(collection, pre) {

  return collection
          .filter(item => item.hasOwnProperty(pre) ?
                                  !!item[pre] ?
                                  item :
                                  '' :
                                  '')
                                  .length < collection.length ?
                                  false : true;
}

console.log(truthCheck([{name: "Pikachu", number: 25, caught: 3}, {name: "Togepi", number: 175, caught: 1}, {name: "MissingNo", number: NaN, caught: 0}], "number"));