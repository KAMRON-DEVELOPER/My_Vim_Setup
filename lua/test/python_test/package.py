import datetime
import os
import re
import sys


class Person:
    def __init__(self, name: str, age: int) -> None:
        """Initialize a person with a name and age."""
        self.name: str = name
        self.age: int = age


def adder(x: int, y: int) -> int:
    return x + y


men = Person("Kamronbek", 21)

result: str = adder(3, 7)


print(f"date now: {datetime.datetime.now()}")


print(f"my name: {men.name}")


print(f"my name: {men.age}")
