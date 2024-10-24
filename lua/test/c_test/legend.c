#include <math.h>
#include <stdio.h>

int main() {
  // 1
  printf("Hello, C language!\n");

  // 2
  int a = 10;
  int b = 20;
  int sum = a + b;

  printf("Sum of %d and %d is: %d\n", a, b, sum);

  // 3
  double number = 16.0;
  double result = sqrt(number);

  printf("Square root of %.2f is: %.2f\n", number, result);

  return 0;
}
