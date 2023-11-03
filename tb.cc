// Copyright 2023 Flavien Solt, ETH Zurich.
// Licensed under the General Public License, Version 3.0, see LICENSE for details.
// SPDX-License-Identifier: GPL-3.0-only

#include "Vtop.h"
#include "verilated.h"

#include <iostream>

typedef Vtop Module;

int main(int argc, char **argv, char **env) {

  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(0);

  Module *my_module = new Module;
  my_module->eval();

  std::cout << "Testbench complete!" << std::endl;
  delete my_module;
  exit(0);
}
