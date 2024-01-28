// Copyright 2023 Flavien Solt, ETH Zurich.
// Licensed under the General Public License, Version 3.0, see LICENSE for details.
// SPDX-License-Identifier: GPL-3.0-only

#include "Vtop.h"
#include "verilated.h"

#include <iostream>
#include <stdlib.h>

typedef Vtop Module;

int main(int argc, char **argv, char **env) {

  Verilated::commandArgs(argc, argv);

  Module *my_module = new Module;

  my_module->clkin_data[0] = 0;
  my_module->clkin_data[1] = 0;
  my_module->clkin_data[2] = 0;
  my_module->clkin_data[3] = 0;
  my_module->clkin_data[4] = 0;

  my_module->in_data[0] = 0;
  my_module->in_data[1] = 0;
  my_module->in_data[2] = 0;

  my_module->eval();

  // clkin_data[128]
  my_module->clkin_data[4] = 0xffffffff;

  my_module->eval();

  my_module->in_data[1] = 0xffffffff;

  my_module->eval();

  // clkin_data[0]
  my_module->clkin_data[0] = 0xffffffff;

  my_module->eval();

  uint32_t out_0 = my_module->out_data;
  std::cout << "out_0: " << out_0 << std::endl;

  delete my_module;
  exit(0);
}
