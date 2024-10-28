// Foydalanuvchi ma'lumotlarini yaratish uchun funktsiya
function createUser(name, age) {
  return {
    name: name,
    age: age,
    greet: function () {
      return (
        "Salom, mening ismim " +
        this.name +
        " va men " +
        this.age +
        " yoshdaman."
      );
    },
  };
}

// Foydalanuvchi ma'lumotlarini o'zgartirish uchun funktsiya
function updateUser(user, newName, newAge) {
  user.name = newName;
  user.age = newAge;
}

// Foydalanuvchi ma'lumotlarini ko'rsatish uchun funktsiya
function displayUser(user) {
  console.log(user.greet());
}

// Bosh funktsiya
function main() {
  var user1 = createUser("Ali", 25);
  displayUser(user1);
  updateUser(user1, "Vali", 30);
  displayUser(user1);
}


/*
block
comment
*/


main();
