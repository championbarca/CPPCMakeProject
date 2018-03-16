//#include "boost/thread.hpp"
#include <mutex>
//#include "sum.hpp"
#include "version.hpp"
#include <iostream>

/*void once_printer_boost(int i) {
  static boost::once_flag flag = BOOST_ONCE_INIT;
  boost::call_once(flag, [](int v) {
    std::cout << "Print Once " << v << std::endl;
  }, i);
}

void once_printer(int i) {
  std::once_flag flag;
  std::call_once(flag, [](int v) {
    std::cout << "Print Once " << v << std::endl;
  }, i);
}*/

int main() {

  //for (int i = 0; i < 10; i++)
  //  once_printer(i);

  double a = 10.000;
  double b = 10.0876;

  if (abs(b - a) == 0) {
    std::cout << "In if" << std::endl;
    return 1;
  }

  return 0;
}
