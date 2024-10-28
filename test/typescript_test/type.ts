class Person {
	name: string;
	age: number;

	constructor(name: string, age: number) {
		this.name = name;
		this.age = age;
	}

	greet(): string {
		return `Salom, mening ismim ${this.name} va men ${this.age} yoshdaman.`;
	}
}

const person1 = new Person("Ali", 25);
const person2 = new Person("Oya", 30);

console.log(person1.greet());
console.log(person2.greet());
