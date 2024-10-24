import datetime
import sd


class Person:
    def __init__(self, name: str, age: int) -> None:
        """Initialize a person with a name and age."""
        self.name: str = name
        self.age: int = age


men = Person("Kamronbek", 21)

print(f"date now: {datetime.now()}")

print(f"my name: {men.name}")
print(f"my name: {men.job}")


