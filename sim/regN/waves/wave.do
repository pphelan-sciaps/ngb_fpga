onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /regn_tb/clk
add wave -noupdate /regn_tb/rst_n
add wave -noupdate -expand -group DUT /regn_tb/u_dut/i_sys_clk
add wave -noupdate -expand -group DUT /regn_tb/u_dut/i_sys_rst_n
add wave -noupdate -expand -group DUT /regn_tb/u_dut/i_wr_en
add wave -noupdate -expand -group DUT /regn_tb/u_dut/i_din
add wave -noupdate -expand -group DUT /regn_tb/u_dut/o_dout
add wave -noupdate -expand -group DUT /regn_tb/u_dut/reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 231
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {972 ps}
