struct Person {
    name: String,
    age: u32,
}

impl Person {
    fn new(name: &str, age: u32) -> Person {
        Person {
            name: String::from(name),
            age,
        }
    }

    fn greet(&self) -> String {
        format!(
            "Salom, mening ismim {} va men {} yoshdaman.",
            self.name, self.age
        )
    }
}

fn main() {
    let person1 = Person::new("Ali", 25);
    let person2 = Person::new("Oya", 30);

    println!("{}", person1.greet());
    println!("{}", person2.greet()
}
