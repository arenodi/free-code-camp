const Person = function(firstAndLast) {
  let firstName = firstAndLast.split(' ')[0];
  let lastName = firstAndLast.split(' ')[1];

  this.getFirstName = () => firstName;
  this.setFirstName = (newFirstName) => firstName = newFirstName;
  this.getLastName = () => lastName;
  this.setLastName = (newLastName) => lastName = newLastName;
  this.getFullName = () => firstName.concat(' ', lastName);
  this.setFullName = (newFullName) => {
          firstName = newFullName.split(' ')[0];
          lastName = newFullName.split(' ')[1];};
};

const bob = new Person('Bob Ross');
bob.setFullName('Will Test');
console.log(bob.getFullName());
console.log(Object.keys(bob).length);