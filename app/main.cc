#include <iostream>

#include "module_a.hpp"
#include "module_b.hpp"
#include "module_c.hpp"

int main() {
  std::cout << "Hello World!" << std::endl;

  // Use module_a
  module_a::u16 mod_a_len = 16;
  std::cout << "Module A " << mod_a_len << std::endl;

  // Use module_b
  module_b::module_b_funct();

  // Use module_c
  module_c::module_c_funct(mod_a_len);

  return 0;
}
