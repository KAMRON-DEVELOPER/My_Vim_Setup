#include <iostream>
#include <math.h>

using namespace std;

int main() {
  double number = 25.0;
  double sqrt_result = sqrt(number);
  double pow_result = pow(number, 2);

  cout << "Square root of " << number << " is: " << sqrt_result << endl;
  cout << number << " squared is: " << pow_result << endl;

  return 0;
}
