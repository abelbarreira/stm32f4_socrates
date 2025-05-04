/**
 * \file module_c.cpp
 *
 * \brief ...
 */
#include <iostream>

#include "module_c.hpp"

namespace module_c {
/**
 * \brief Module C function
 *
 * \details This function does something in module C
 *
 * \param mod_a_len Length of module A
 */
void module_c_funct(module_a::u16 mod_a_len) {
  std::cout << "Module C Function " << mod_a_len << std::endl;
  return;
}
} // namespace module_c
