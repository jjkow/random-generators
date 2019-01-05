create_project project_1 ./project_1 -part xc7z010clg400-1 -force
set proj_dir [get_property directory [current_project]]
set obj [current_project]
set_property -name "board_part" -value "digilentinc.com:zybo:part0:1.0" -objects $obj
set_property -name "dsa.board_id" -value "zybo" -objects $obj
set_property "ip_repo_paths" "../ip_repo" [get_filesets sources_1]
set_property target_language VHDL [current_project]
source ../src/bd/design_1_bd.tcl
set_property synth_checkpoint_mode Hierarchical [get_files ./project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]
make_wrapper -files [get_files ./project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd] -top -import
generate_target {synthesis implementation} [get_files ./project_1/project_1.srcs/sources_1/bd/design_1/design_1.bd]

launch_runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
