verilator --cc --exe --Wno-MULTIDRIVEN --Wno-WIDTHTRUNC --build tb_base.cc top.sv -CFLAGS '-Iinclude -I. -g' --Mdir obj_dir_opt_notrace --build-jobs 4

verilator --cc --exe -fno-subst -fno-subst-const --Wno-MULTIDRIVEN --Wno-WIDTHTRUNC --build tb_base.cc top.sv -CFLAGS '-Iinclude -I. -g' --Mdir obj_dir_opt_notrace_fno --build-jobs 4

echo "Without -fno*"
obj_dir_opt_notrace/Vtop
echo "With -fno*"
obj_dir_opt_notrace_fno/Vtop
