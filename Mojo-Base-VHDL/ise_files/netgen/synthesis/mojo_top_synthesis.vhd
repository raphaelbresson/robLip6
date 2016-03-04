--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: mojo_top_synthesis.vhd
-- /___/   /\     Timestamp: Tue Mar  1 23:45:21 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -filter /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/iseconfig/filter.filter -intstyle ise -ar Structure -tm mojo_top -w -dir netgen/synthesis -ofmt vhdl -sim mojo_top.ngc mojo_top_synthesis.vhd 
-- Device	: xc6slx9-2-tqg144
-- Input file	: mojo_top.ngc
-- Output file	: /home/raphael/Desktop/Mojo-Base-VHDL/ise_files/netgen/synthesis/mojo_top_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: mojo_top
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity mojo_top is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst_n : in STD_LOGIC := 'X'; 
    cclk : in STD_LOGIC := 'X'; 
    spi_sck : in STD_LOGIC := 'X'; 
    spi_ss : in STD_LOGIC := 'X'; 
    spi_mosi : in STD_LOGIC := 'X'; 
    avr_tx : in STD_LOGIC := 'X'; 
    avr_rx_busy : in STD_LOGIC := 'X'; 
    spi_miso : out STD_LOGIC; 
    avr_rx : out STD_LOGIC; 
    pwm : out STD_LOGIC; 
    led : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    spi_channel : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end mojo_top;

architecture Structure of mojo_top is
  signal clk_BUFGP_0 : STD_LOGIC; 
  signal cclk_IBUF_1 : STD_LOGIC; 
  signal spi_sck_IBUF_2 : STD_LOGIC; 
  signal spi_ss_IBUF_3 : STD_LOGIC; 
  signal spi_mosi_IBUF_4 : STD_LOGIC; 
  signal avr_tx_IBUF_5 : STD_LOGIC; 
  signal avr_rx_busy_IBUF_6 : STD_LOGIC; 
  signal pwm_output_pwm_q_7 : STD_LOGIC; 
  signal avr_interface_new_sample_q_30 : STD_LOGIC; 
  signal avr_interface_serial_rx_new_data_q_31 : STD_LOGIC; 
  signal led_7_32 : STD_LOGIC; 
  signal led_6_33 : STD_LOGIC; 
  signal led_5_34 : STD_LOGIC; 
  signal led_4_35 : STD_LOGIC; 
  signal led_3_36 : STD_LOGIC; 
  signal led_2_37 : STD_LOGIC; 
  signal led_1_38 : STD_LOGIC; 
  signal led_0_39 : STD_LOGIC; 
  signal new_tx_data_40 : STD_LOGIC; 
  signal data_to_send_65 : STD_LOGIC; 
  signal rst : STD_LOGIC; 
  signal data_to_send_tx_busy_AND_10_o : STD_LOGIC; 
  signal spi_channel_3_OBUFT_68 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q12 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q11 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q10 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q9 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q8 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q7 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q6 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q5 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q4 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q3 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q2 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q1 : STD_LOGIC; 
  signal avr_interface_cclk_detector_Mcount_ctr_q : STD_LOGIC; 
  signal avr_interface_cclk_detector_n0018_inv : STD_LOGIC; 
  signal avr_interface_cclk_detector_ready_d : STD_LOGIC; 
  signal avr_interface_ready_spi_miso_en_m_AND_7_o_inv : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_2_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_3_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_4_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_5_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_6_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_7_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_8_Q : STD_LOGIC; 
  signal avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_9_Q : STD_LOGIC; 
  signal avr_interface_new_sample_d : STD_LOGIC; 
  signal avr_interface_n_rdy : STD_LOGIC; 
  signal avr_interface_byte_ct_q_133 : STD_LOGIC; 
  signal avr_interface_spi_slave_done_q_134 : STD_LOGIC; 
  signal avr_interface_spi_slave_miso_q_135 : STD_LOGIC; 
  signal avr_interface_cclk_detector_ready_q_144 : STD_LOGIC; 
  signal avr_interface_serial_tx_tx_q_145 : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_bdd0 : STD_LOGIC; 
  signal pwm_output_cmp_q_7_CMP_7_LessThan_2_o : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_7_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_0_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_1_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_2_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_4_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_5_Q : STD_LOGIC; 
  signal pwm_output_cmp_q_7_GND_5_o_add_0_OUT_6_Q : STD_LOGIC; 
  signal pwm_output_cmp_d_7_164 : STD_LOGIC; 
  signal pwm_output_pwm_d_165 : STD_LOGIC; 
  signal pwm_output_cmp_d_0_166 : STD_LOGIC; 
  signal pwm_output_cmp_d_1_167 : STD_LOGIC; 
  signal pwm_output_cmp_d_2_168 : STD_LOGIC; 
  signal pwm_output_cmp_d_3_169 : STD_LOGIC; 
  signal pwm_output_cmp_d_4_170 : STD_LOGIC; 
  signal pwm_output_cmp_d_5_171 : STD_LOGIC; 
  signal pwm_output_cmp_d_6_172 : STD_LOGIC; 
  signal avr_interface_serial_tx_Mmux_ctr_d411_173 : STD_LOGIC; 
  signal avr_interface_serial_tx_state_q_FSM_FFd1_181 : STD_LOGIC; 
  signal avr_interface_serial_tx_state_q_FSM_FFd2_182 : STD_LOGIC; 
  signal avr_interface_serial_tx_state_q_FSM_FFd1_In : STD_LOGIC; 
  signal avr_interface_serial_tx_state_q_FSM_FFd2_In_184 : STD_LOGIC; 
  signal avr_interface_serial_tx_n0098_inv : STD_LOGIC; 
  signal avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o : STD_LOGIC; 
  signal avr_interface_serial_tx_tx_d : STD_LOGIC; 
  signal avr_interface_serial_tx_block_q_206 : STD_LOGIC; 
  signal avr_interface_spi_slave_Mcount_bit_ct_q2 : STD_LOGIC; 
  signal avr_interface_spi_slave_Mcount_bit_ct_q1 : STD_LOGIC; 
  signal avr_interface_spi_slave_Mcount_bit_ct_q : STD_LOGIC; 
  signal avr_interface_spi_slave_n0072_inv : STD_LOGIC; 
  signal avr_interface_spi_slave_n0088_inv : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_0_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_1_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_2_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_3_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_4_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_5_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_6_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_7_Q : STD_LOGIC; 
  signal avr_interface_spi_slave_done_d : STD_LOGIC; 
  signal avr_interface_spi_slave_n0063 : STD_LOGIC; 
  signal avr_interface_spi_slave_sck_old_q_230 : STD_LOGIC; 
  signal avr_interface_spi_slave_ss_q_231 : STD_LOGIC; 
  signal avr_interface_spi_slave_mosi_q_232 : STD_LOGIC; 
  signal avr_interface_spi_slave_sck_q_233 : STD_LOGIC; 
  signal avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1 : STD_LOGIC; 
  signal avr_interface_serial_rx_Madd_ctr_q_6_GND_26_o_add_6_OUT_cy_4_Q : STD_LOGIC; 
  signal avr_interface_serial_rx_state_q_FSM_FFd1_246 : STD_LOGIC; 
  signal avr_interface_serial_rx_state_q_FSM_FFd2_247 : STD_LOGIC; 
  signal avr_interface_serial_rx_state_q_FSM_FFd1_In_248 : STD_LOGIC; 
  signal avr_interface_serial_rx_state_q_FSM_FFd2_In_249 : STD_LOGIC; 
  signal avr_interface_serial_rx_n0087_inv : STD_LOGIC; 
  signal avr_interface_serial_rx_rst_inv_BUFG_251 : STD_LOGIC; 
  signal avr_interface_serial_rx_new_data_d : STD_LOGIC; 
  signal avr_interface_serial_rx_rx_q_260 : STD_LOGIC; 
  signal avr_interface_cclk_detector_ready_d1_264 : STD_LOGIC; 
  signal avr_interface_cclk_detector_ready_d2_265 : STD_LOGIC; 
  signal avr_interface_cclk_detector_n0018_inv1_266 : STD_LOGIC; 
  signal avr_interface_cclk_detector_n0018_inv2_267 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal data_to_send_rstpot_288 : STD_LOGIC; 
  signal avr_interface_byte_ct_q_rstpot_289 : STD_LOGIC; 
  signal avr_interface_spi_slave_miso_q_rstpot_290 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal avr_interface_serial_rx_bit_ctr_q_0_rstpot_298 : STD_LOGIC; 
  signal avr_interface_serial_tx_bit_ctr_q_2_rstpot_299 : STD_LOGIC; 
  signal avr_interface_serial_tx_bit_ctr_q_1_rstpot_300 : STD_LOGIC; 
  signal avr_interface_serial_tx_bit_ctr_q_0_rstpot_301 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_7_rstpot_302 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_6_rstpot_303 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_5_rstpot_304 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_4_rstpot_305 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_3_rstpot_306 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_2_rstpot_307 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_1_rstpot_308 : STD_LOGIC; 
  signal avr_interface_serial_tx_data_q_0_rstpot_309 : STD_LOGIC; 
  signal avr_interface_serial_rx_bit_ctr_q_2_rstpot_310 : STD_LOGIC; 
  signal avr_interface_serial_rx_bit_ctr_q_1_rstpot_311 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_7_rstpot_312 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_6_rstpot_313 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_5_rstpot_314 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_4_rstpot_315 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_3_rstpot_316 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_2_rstpot_317 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_1_rstpot_318 : STD_LOGIC; 
  signal avr_interface_serial_rx_data_q_0_rstpot_319 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N31 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N60 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N86 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N98 : STD_LOGIC; 
  signal N104 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N107 : STD_LOGIC; 
  signal avr_interface_serial_rx_rst_inv : STD_LOGIC; 
  signal avr_interface_serial_rx_rst_inv_BUFG_LUT1 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N113 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal avr_interface_sample_q : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal avr_interface_serial_rx_data_q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal uart_data : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal tx_data : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal last_sample : STD_LOGIC_VECTOR ( 9 downto 2 ); 
  signal avr_interface_cclk_detector_Mcount_ctr_q_lut : STD_LOGIC_VECTOR ( 12 downto 0 ); 
  signal avr_interface_cclk_detector_Mcount_ctr_q_cy : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal avr_interface_cclk_detector_ctr_q : STD_LOGIC_VECTOR ( 12 downto 0 ); 
  signal avr_interface_spi_slave_dout_q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal pwm_output_cmp_q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal avr_interface_serial_tx_ctr_q : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal avr_interface_serial_tx_ctr_d : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal avr_interface_serial_tx_bit_ctr_q : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal avr_interface_serial_tx_data_q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal avr_interface_spi_slave_data_q : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal avr_interface_spi_slave_bit_ct_q : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal avr_interface_serial_rx_ctr_q : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal avr_interface_serial_rx_ctr_d : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal avr_interface_serial_rx_bit_ctr_q : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => spi_channel_3_OBUFT_68
    );
  new_tx_data : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => data_to_send_tx_busy_AND_10_o,
      Q => new_tx_data_40
    );
  uart_data_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(0),
      Q => uart_data(0)
    );
  uart_data_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(1),
      Q => uart_data(1)
    );
  uart_data_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(2),
      Q => uart_data(2)
    );
  uart_data_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(3),
      Q => uart_data(3)
    );
  uart_data_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(4),
      Q => uart_data(4)
    );
  uart_data_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(5),
      Q => uart_data(5)
    );
  uart_data_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(6),
      Q => uart_data(6)
    );
  uart_data_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_new_data_q_31,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_data_q(7),
      Q => uart_data(7)
    );
  tx_data_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(0),
      Q => tx_data(0)
    );
  tx_data_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(1),
      Q => tx_data(1)
    );
  tx_data_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(2),
      Q => tx_data(2)
    );
  tx_data_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(3),
      Q => tx_data(3)
    );
  tx_data_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(4),
      Q => tx_data(4)
    );
  tx_data_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(5),
      Q => tx_data(5)
    );
  tx_data_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(6),
      Q => tx_data(6)
    );
  tx_data_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => data_to_send_tx_busy_AND_10_o,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => uart_data(7),
      Q => tx_data(7)
    );
  last_sample_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(2),
      Q => last_sample(2)
    );
  last_sample_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(3),
      Q => last_sample(3)
    );
  last_sample_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(4),
      Q => last_sample(4)
    );
  last_sample_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(5),
      Q => last_sample(5)
    );
  last_sample_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(6),
      Q => last_sample(6)
    );
  last_sample_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(7),
      Q => last_sample(7)
    );
  last_sample_8 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(8),
      Q => last_sample(8)
    );
  last_sample_9 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_new_sample_q_30,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_sample_q(9),
      Q => last_sample(9)
    );
  led_0 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(2),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_0_39
    );
  led_1 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(3),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_1_38
    );
  led_2 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(4),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_2_37
    );
  led_3 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(5),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_3_36
    );
  led_4 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(6),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_4_35
    );
  led_5 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(7),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_5_34
    );
  led_6 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(8),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_6_33
    );
  led_7 : FDP
    port map (
      C => clk_BUFGP_0,
      D => last_sample(9),
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => led_7_32
    );
  avr_interface_cclk_detector_ctr_q_12 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q12,
      Q => avr_interface_cclk_detector_ctr_q(12)
    );
  avr_interface_cclk_detector_ctr_q_11 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q11,
      Q => avr_interface_cclk_detector_ctr_q(11)
    );
  avr_interface_cclk_detector_ctr_q_10 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q10,
      Q => avr_interface_cclk_detector_ctr_q(10)
    );
  avr_interface_cclk_detector_ctr_q_9 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q9,
      Q => avr_interface_cclk_detector_ctr_q(9)
    );
  avr_interface_cclk_detector_ctr_q_8 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q8,
      Q => avr_interface_cclk_detector_ctr_q(8)
    );
  avr_interface_cclk_detector_ctr_q_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q7,
      Q => avr_interface_cclk_detector_ctr_q(7)
    );
  avr_interface_cclk_detector_ctr_q_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q6,
      Q => avr_interface_cclk_detector_ctr_q(6)
    );
  avr_interface_cclk_detector_ctr_q_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q5,
      Q => avr_interface_cclk_detector_ctr_q(5)
    );
  avr_interface_cclk_detector_ctr_q_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q4,
      Q => avr_interface_cclk_detector_ctr_q(4)
    );
  avr_interface_cclk_detector_ctr_q_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q3,
      Q => avr_interface_cclk_detector_ctr_q(3)
    );
  avr_interface_cclk_detector_ctr_q_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q2,
      Q => avr_interface_cclk_detector_ctr_q(2)
    );
  avr_interface_cclk_detector_ctr_q_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q1,
      Q => avr_interface_cclk_detector_ctr_q(1)
    );
  avr_interface_cclk_detector_ctr_q_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_n0018_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_Mcount_ctr_q,
      Q => avr_interface_cclk_detector_ctr_q(0)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_12_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(11),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(12),
      O => avr_interface_cclk_detector_Mcount_ctr_q12
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_11_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(10),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(11),
      O => avr_interface_cclk_detector_Mcount_ctr_q11
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_11_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(10),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(11),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(11)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_10_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(9),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(10),
      O => avr_interface_cclk_detector_Mcount_ctr_q10
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_10_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(9),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(10),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(10)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_9_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(8),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(9),
      O => avr_interface_cclk_detector_Mcount_ctr_q9
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_9_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(8),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(9),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(9)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_8_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(7),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(8),
      O => avr_interface_cclk_detector_Mcount_ctr_q8
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_8_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(7),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(8),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(8)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_7_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(6),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(7),
      O => avr_interface_cclk_detector_Mcount_ctr_q7
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_7_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(6),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(7),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(7)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_6_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(5),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(6),
      O => avr_interface_cclk_detector_Mcount_ctr_q6
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_6_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(5),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(6),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(6)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_5_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(4),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(5),
      O => avr_interface_cclk_detector_Mcount_ctr_q5
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_5_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(4),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(5),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(5)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_4_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(3),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(4),
      O => avr_interface_cclk_detector_Mcount_ctr_q4
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_4_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(3),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(4),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(4)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_3_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(2),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(3),
      O => avr_interface_cclk_detector_Mcount_ctr_q3
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_3_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(2),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(3),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(3)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_2_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(1),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(2),
      O => avr_interface_cclk_detector_Mcount_ctr_q2
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_2_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(1),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(2),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(2)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_1_Q : XORCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(0),
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(1),
      O => avr_interface_cclk_detector_Mcount_ctr_q1
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_1_Q : MUXCY
    port map (
      CI => avr_interface_cclk_detector_Mcount_ctr_q_cy(0),
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(1),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(1)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_xor_0_Q : XORCY
    port map (
      CI => cclk_IBUF_1,
      LI => avr_interface_cclk_detector_Mcount_ctr_q_lut(0),
      O => avr_interface_cclk_detector_Mcount_ctr_q
    );
  avr_interface_cclk_detector_Mcount_ctr_q_cy_0_Q : MUXCY
    port map (
      CI => cclk_IBUF_1,
      DI => spi_channel_3_OBUFT_68,
      S => avr_interface_cclk_detector_Mcount_ctr_q_lut(0),
      O => avr_interface_cclk_detector_Mcount_ctr_q_cy(0)
    );
  avr_interface_cclk_detector_ready_q : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_cclk_detector_ready_d,
      Q => avr_interface_cclk_detector_ready_q_144
    );
  avr_interface_sample_q_9 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_9_Q,
      Q => avr_interface_sample_q(9)
    );
  avr_interface_sample_q_8 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_8_Q,
      Q => avr_interface_sample_q(8)
    );
  avr_interface_sample_q_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_7_Q,
      Q => avr_interface_sample_q(7)
    );
  avr_interface_sample_q_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_6_Q,
      Q => avr_interface_sample_q(6)
    );
  avr_interface_sample_q_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_5_Q,
      Q => avr_interface_sample_q(5)
    );
  avr_interface_sample_q_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_4_Q,
      Q => avr_interface_sample_q(4)
    );
  avr_interface_sample_q_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_3_Q,
      Q => avr_interface_sample_q(3)
    );
  avr_interface_sample_q_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_q_134,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_2_Q,
      Q => avr_interface_sample_q(2)
    );
  avr_interface_new_sample_q : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_n_rdy,
      D => avr_interface_new_sample_d,
      Q => avr_interface_new_sample_q_30
    );
  pwm_output_pwm_q : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_pwm_d_165,
      Q => pwm_output_pwm_q_7
    );
  pwm_output_pwm_d : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_CMP_7_LessThan_2_o,
      G => rst,
      Q => pwm_output_pwm_d_165
    );
  pwm_output_cmp_q_7 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_7_164,
      Q => pwm_output_cmp_q(7)
    );
  pwm_output_cmp_q_6 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_6_172,
      Q => pwm_output_cmp_q(6)
    );
  pwm_output_cmp_q_5 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_5_171,
      Q => pwm_output_cmp_q(5)
    );
  pwm_output_cmp_q_4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_4_170,
      Q => pwm_output_cmp_q(4)
    );
  pwm_output_cmp_q_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_3_169,
      Q => pwm_output_cmp_q(3)
    );
  pwm_output_cmp_q_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_2_168,
      Q => pwm_output_cmp_q(2)
    );
  pwm_output_cmp_q_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_1_167,
      Q => pwm_output_cmp_q(1)
    );
  pwm_output_cmp_q_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => pwm_output_cmp_d_0_166,
      Q => pwm_output_cmp_q(0)
    );
  pwm_output_cmp_d_7 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_7_Q,
      G => rst,
      Q => pwm_output_cmp_d_7_164
    );
  pwm_output_cmp_d_0 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_0_Q,
      G => rst,
      Q => pwm_output_cmp_d_0_166
    );
  pwm_output_cmp_d_1 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_1_Q,
      G => rst,
      Q => pwm_output_cmp_d_1_167
    );
  pwm_output_cmp_d_3 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_Q,
      G => rst,
      Q => pwm_output_cmp_d_3_169
    );
  pwm_output_cmp_d_4 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_4_Q,
      G => rst,
      Q => pwm_output_cmp_d_4_170
    );
  pwm_output_cmp_d_2 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_2_Q,
      G => rst,
      Q => pwm_output_cmp_d_2_168
    );
  pwm_output_cmp_d_5 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_5_Q,
      G => rst,
      Q => pwm_output_cmp_d_5_171
    );
  pwm_output_cmp_d_6 : LD_1
    generic map(
      INIT => '0'
    )
    port map (
      D => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_6_Q,
      G => rst,
      Q => pwm_output_cmp_d_6_172
    );
  avr_interface_serial_tx_state_q_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_tx_state_q_FSM_FFd1_In,
      Q => avr_interface_serial_tx_state_q_FSM_FFd1_181
    );
  avr_interface_serial_tx_state_q_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_tx_state_q_FSM_FFd2_In_184,
      Q => avr_interface_serial_tx_state_q_FSM_FFd2_182
    );
  avr_interface_serial_tx_ctr_q_6 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(6),
      Q => avr_interface_serial_tx_ctr_q(6)
    );
  avr_interface_serial_tx_ctr_q_5 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(5),
      Q => avr_interface_serial_tx_ctr_q(5)
    );
  avr_interface_serial_tx_ctr_q_4 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(4),
      Q => avr_interface_serial_tx_ctr_q(4)
    );
  avr_interface_serial_tx_ctr_q_3 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(3),
      Q => avr_interface_serial_tx_ctr_q(3)
    );
  avr_interface_serial_tx_ctr_q_2 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(2),
      Q => avr_interface_serial_tx_ctr_q(2)
    );
  avr_interface_serial_tx_ctr_q_1 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(1),
      Q => avr_interface_serial_tx_ctr_q(1)
    );
  avr_interface_serial_tx_ctr_q_0 : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_interface_serial_tx_ctr_d(0),
      Q => avr_interface_serial_tx_ctr_q(0)
    );
  avr_interface_serial_tx_block_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_rx_busy_IBUF_6,
      Q => avr_interface_serial_tx_block_q_206
    );
  avr_interface_serial_tx_tx_q : FDP
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_tx_d,
      PRE => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      Q => avr_interface_serial_tx_tx_q_145
    );
  avr_interface_spi_slave_bit_ct_q_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0072_inv,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_Mcount_bit_ct_q2,
      Q => avr_interface_spi_slave_bit_ct_q(2)
    );
  avr_interface_spi_slave_bit_ct_q_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0072_inv,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_Mcount_bit_ct_q1,
      Q => avr_interface_spi_slave_bit_ct_q(1)
    );
  avr_interface_spi_slave_bit_ct_q_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0072_inv,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_Mcount_bit_ct_q,
      Q => avr_interface_spi_slave_bit_ct_q(0)
    );
  avr_interface_spi_slave_dout_q_7 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(6),
      Q => avr_interface_spi_slave_dout_q(7)
    );
  avr_interface_spi_slave_dout_q_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(5),
      Q => avr_interface_spi_slave_dout_q(6)
    );
  avr_interface_spi_slave_dout_q_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(4),
      Q => avr_interface_spi_slave_dout_q(5)
    );
  avr_interface_spi_slave_dout_q_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(3),
      Q => avr_interface_spi_slave_dout_q(4)
    );
  avr_interface_spi_slave_dout_q_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(2),
      Q => avr_interface_spi_slave_dout_q(3)
    );
  avr_interface_spi_slave_dout_q_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(1),
      Q => avr_interface_spi_slave_dout_q(2)
    );
  avr_interface_spi_slave_dout_q_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_data_q(0),
      Q => avr_interface_spi_slave_dout_q(1)
    );
  avr_interface_spi_slave_dout_q_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_done_d,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_mosi_q_232,
      Q => avr_interface_spi_slave_dout_q(0)
    );
  avr_interface_spi_slave_data_q_7 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_7_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(7)
    );
  avr_interface_spi_slave_data_q_6 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_6_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(6)
    );
  avr_interface_spi_slave_data_q_5 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_5_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(5)
    );
  avr_interface_spi_slave_data_q_4 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_4_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(4)
    );
  avr_interface_spi_slave_data_q_3 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_3_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(3)
    );
  avr_interface_spi_slave_data_q_2 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_2_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(2)
    );
  avr_interface_spi_slave_data_q_1 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_1_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(1)
    );
  avr_interface_spi_slave_data_q_0 : FDSE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_spi_slave_n0088_inv,
      D => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_0_Q,
      S => avr_interface_spi_slave_n0063,
      Q => avr_interface_spi_slave_data_q(0)
    );
  avr_interface_spi_slave_done_q : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_n_rdy,
      D => avr_interface_spi_slave_done_d,
      Q => avr_interface_spi_slave_done_q_134
    );
  avr_interface_spi_slave_sck_old_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_ready_q_144,
      D => avr_interface_spi_slave_sck_q_233,
      Q => avr_interface_spi_slave_sck_old_q_230
    );
  avr_interface_spi_slave_mosi_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_ready_q_144,
      D => spi_mosi_IBUF_4,
      Q => avr_interface_spi_slave_mosi_q_232
    );
  avr_interface_spi_slave_sck_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_ready_q_144,
      D => spi_sck_IBUF_2,
      Q => avr_interface_spi_slave_sck_q_233
    );
  avr_interface_spi_slave_ss_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_cclk_detector_ready_q_144,
      D => spi_ss_IBUF_3,
      Q => avr_interface_spi_slave_ss_q_231
    );
  avr_interface_serial_rx_state_q_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_state_q_FSM_FFd1_In_248,
      Q => avr_interface_serial_rx_state_q_FSM_FFd1_246
    );
  avr_interface_serial_rx_state_q_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_state_q_FSM_FFd2_In_249,
      Q => avr_interface_serial_rx_state_q_FSM_FFd2_247
    );
  avr_interface_serial_rx_ctr_q_6 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(6),
      Q => avr_interface_serial_rx_ctr_q(6)
    );
  avr_interface_serial_rx_ctr_q_5 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(5),
      Q => avr_interface_serial_rx_ctr_q(5)
    );
  avr_interface_serial_rx_ctr_q_4 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(4),
      Q => avr_interface_serial_rx_ctr_q(4)
    );
  avr_interface_serial_rx_ctr_q_3 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(3),
      Q => avr_interface_serial_rx_ctr_q(3)
    );
  avr_interface_serial_rx_ctr_q_2 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(2),
      Q => avr_interface_serial_rx_ctr_q(2)
    );
  avr_interface_serial_rx_ctr_q_1 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(1),
      Q => avr_interface_serial_rx_ctr_q(1)
    );
  avr_interface_serial_rx_ctr_q_0 : FDCE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_n0087_inv,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_ctr_d(0),
      Q => avr_interface_serial_rx_ctr_q(0)
    );
  avr_interface_serial_rx_new_data_q : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_new_data_d,
      Q => avr_interface_serial_rx_new_data_q_31
    );
  avr_interface_serial_rx_rx_q : FDE
    port map (
      C => clk_BUFGP_0,
      CE => avr_interface_serial_rx_rst_inv,
      D => avr_tx_IBUF_5,
      Q => avr_interface_serial_rx_rx_q_260
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(2),
      I2 => avr_interface_sample_q(2),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_2_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(3),
      I2 => avr_interface_sample_q(3),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_3_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(4),
      I2 => avr_interface_sample_q(4),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_4_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(5),
      I2 => avr_interface_sample_q(5),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_5_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT71 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(6),
      I2 => avr_interface_sample_q(6),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_6_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_spi_slave_dout_q(7),
      I2 => avr_interface_sample_q(7),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_7_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT91 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_sample_q(8),
      I2 => avr_interface_spi_slave_dout_q(0),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_8_Q
    );
  avr_interface_Mmux_spi_dout_1_sample_q_9_mux_3_OUT101 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => avr_interface_byte_ct_q_133,
      I1 => avr_interface_sample_q(9),
      I2 => avr_interface_spi_slave_dout_q(1),
      O => avr_interface_spi_dout_1_sample_q_9_mux_3_OUT_9_Q
    );
  avr_interface_ready_spi_miso_en_m_AND_7_o_inv1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => spi_ss_IBUF_3,
      I1 => avr_interface_cclk_detector_ready_q_144,
      O => avr_interface_ready_spi_miso_en_m_AND_7_o_inv
    );
  avr_interface_Mmux_new_sample_d11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => avr_interface_spi_slave_done_q_134,
      I1 => avr_interface_byte_ct_q_133,
      O => avr_interface_new_sample_d
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_11 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => pwm_output_cmp_q(0),
      I1 => pwm_output_cmp_q(1),
      I2 => pwm_output_cmp_q(2),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_bdd0
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_7_1 : LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
    port map (
      I0 => pwm_output_cmp_q(7),
      I1 => pwm_output_cmp_q(3),
      I2 => pwm_output_cmp_q(6),
      I3 => pwm_output_cmp_q(5),
      I4 => pwm_output_cmp_q(4),
      I5 => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_bdd0,
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_7_Q
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_6_1 : LUT5
    generic map(
      INIT => X"CCCC6CCC"
    )
    port map (
      I0 => pwm_output_cmp_q(3),
      I1 => pwm_output_cmp_q(6),
      I2 => pwm_output_cmp_q(5),
      I3 => pwm_output_cmp_q(4),
      I4 => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_bdd0,
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_6_Q
    );
  pwm_output_Madd_cmp_q_7_GND_5_o_add_0_OUT_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => pwm_output_cmp_q(2),
      I1 => pwm_output_cmp_q(0),
      I2 => pwm_output_cmp_q(1),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_2_Q
    );
  pwm_output_cmp_q_7_CMP_7_LessThan_2_o1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => pwm_output_cmp_q(7),
      I1 => pwm_output_cmp_q(6),
      O => pwm_output_cmp_q_7_CMP_7_LessThan_2_o
    );
  pwm_output_Madd_cmp_q_7_GND_5_o_add_0_OUT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => pwm_output_cmp_q(1),
      I1 => pwm_output_cmp_q(0),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_1_Q
    );
  avr_interface_serial_tx_Mmux_ctr_d411 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(0),
      I1 => avr_interface_serial_tx_ctr_q(1),
      I2 => avr_interface_serial_tx_ctr_q(2),
      O => avr_interface_serial_tx_Mmux_ctr_d411_173
    );
  avr_interface_serial_tx_tx_d1 : LUT3
    generic map(
      INIT => X"D5"
    )
    port map (
      I0 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I1 => avr_interface_serial_tx_data_q(0),
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => avr_interface_serial_tx_tx_d
    );
  avr_interface_spi_slave_Mcount_bit_ct_q_xor_1_11 : LUT3
    generic map(
      INIT => X"14"
    )
    port map (
      I0 => avr_interface_spi_slave_ss_q_231,
      I1 => avr_interface_spi_slave_bit_ct_q(0),
      I2 => avr_interface_spi_slave_bit_ct_q(1),
      O => avr_interface_spi_slave_Mcount_bit_ct_q1
    );
  avr_interface_spi_slave_Mcount_bit_ct_q_xor_2_11 : LUT4
    generic map(
      INIT => X"1444"
    )
    port map (
      I0 => avr_interface_spi_slave_ss_q_231,
      I1 => avr_interface_spi_slave_bit_ct_q(2),
      I2 => avr_interface_spi_slave_bit_ct_q(0),
      I3 => avr_interface_spi_slave_bit_ct_q(1),
      O => avr_interface_spi_slave_Mcount_bit_ct_q2
    );
  avr_interface_spi_slave_n0072_inv1 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => avr_interface_spi_slave_ss_q_231,
      I1 => avr_interface_spi_slave_sck_q_233,
      I2 => avr_interface_spi_slave_sck_old_q_230,
      O => avr_interface_spi_slave_n0072_inv
    );
  avr_interface_spi_slave_n0088_inv1 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => avr_interface_cclk_detector_ready_q_144,
      I1 => avr_interface_spi_slave_sck_old_q_230,
      I2 => avr_interface_spi_slave_sck_q_233,
      O => avr_interface_spi_slave_n0088_inv
    );
  avr_interface_spi_slave_Mcount_bit_ct_q_xor_0_11 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => avr_interface_spi_slave_ss_q_231,
      I1 => avr_interface_spi_slave_bit_ct_q(0),
      O => avr_interface_spi_slave_Mcount_bit_ct_q
    );
  avr_interface_spi_slave_n00631 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => avr_interface_cclk_detector_ready_q_144,
      I1 => avr_interface_spi_slave_ss_q_231,
      O => avr_interface_spi_slave_n0063
    );
  avr_interface_serial_rx_Madd_ctr_q_6_GND_26_o_add_6_OUT_cy_4_11 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(4),
      O => avr_interface_serial_rx_Madd_ctr_q_6_GND_26_o_add_6_OUT_cy_4_Q
    );
  avr_interface_serial_rx_Mmux_ctr_d11 : LUT6
    generic map(
      INIT => X"5545444455554444"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(0),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      I4 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_ctr_d(0)
    );
  avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_11 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(5),
      I1 => avr_interface_serial_rx_ctr_q(3),
      I2 => avr_interface_serial_rx_ctr_q(2),
      I3 => avr_interface_serial_rx_ctr_q(1),
      O => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1
    );
  avr_interface_serial_rx_n0087_inv1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      O => avr_interface_serial_rx_n0087_inv
    );
  avr_interface_cclk_detector_ready_d1 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => avr_interface_cclk_detector_ctr_q(8),
      I1 => avr_interface_cclk_detector_ctr_q(7),
      I2 => avr_interface_cclk_detector_ctr_q(10),
      I3 => avr_interface_cclk_detector_ctr_q(9),
      I4 => avr_interface_cclk_detector_ctr_q(12),
      I5 => avr_interface_cclk_detector_ctr_q(11),
      O => avr_interface_cclk_detector_ready_d1_264
    );
  avr_interface_cclk_detector_ready_d2 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => avr_interface_cclk_detector_ctr_q(2),
      I1 => avr_interface_cclk_detector_ctr_q(1),
      I2 => avr_interface_cclk_detector_ctr_q(4),
      I3 => avr_interface_cclk_detector_ctr_q(3),
      I4 => avr_interface_cclk_detector_ctr_q(6),
      I5 => avr_interface_cclk_detector_ctr_q(5),
      O => avr_interface_cclk_detector_ready_d2_265
    );
  avr_interface_cclk_detector_ready_d3 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => avr_interface_cclk_detector_ready_d1_264,
      I1 => avr_interface_cclk_detector_ctr_q(0),
      I2 => cclk_IBUF_1,
      I3 => avr_interface_cclk_detector_ready_d2_265,
      O => avr_interface_cclk_detector_ready_d
    );
  avr_interface_cclk_detector_n0018_inv1 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(2),
      I2 => avr_interface_cclk_detector_ctr_q(1),
      I3 => avr_interface_cclk_detector_ctr_q(0),
      I4 => avr_interface_cclk_detector_ctr_q(12),
      I5 => avr_interface_cclk_detector_ctr_q(11),
      O => avr_interface_cclk_detector_n0018_inv1_266
    );
  avr_interface_cclk_detector_n0018_inv2 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => avr_interface_cclk_detector_ctr_q(4),
      I1 => avr_interface_cclk_detector_ctr_q(3),
      I2 => avr_interface_cclk_detector_ctr_q(5),
      I3 => avr_interface_cclk_detector_ctr_q(6),
      I4 => avr_interface_cclk_detector_ctr_q(7),
      I5 => avr_interface_cclk_detector_ctr_q(8),
      O => avr_interface_cclk_detector_n0018_inv2_267
    );
  avr_interface_cclk_detector_n0018_inv3 : LUT4
    generic map(
      INIT => X"FFF7"
    )
    port map (
      I0 => avr_interface_cclk_detector_ctr_q(9),
      I1 => avr_interface_cclk_detector_ctr_q(10),
      I2 => avr_interface_cclk_detector_n0018_inv1_266,
      I3 => avr_interface_cclk_detector_n0018_inv2_267,
      O => avr_interface_cclk_detector_n0018_inv
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(3),
      I1 => avr_interface_serial_tx_ctr_q(2),
      O => N01
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_Q : LUT6
    generic map(
      INIT => X"0000000000008000"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => avr_interface_serial_tx_ctr_q(5),
      I2 => avr_interface_serial_tx_ctr_q(1),
      I3 => avr_interface_serial_tx_ctr_q(0),
      I4 => avr_interface_serial_tx_ctr_q(4),
      I5 => N01,
      O => avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o
    );
  avr_interface_serial_rx_state_q_FSM_FFd2_In_SW0 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(2),
      I1 => avr_interface_serial_rx_bit_ctr_q(1),
      I2 => avr_interface_serial_rx_bit_ctr_q(0),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(6),
      O => N6
    );
  avr_interface_serial_rx_state_q_FSM_FFd2_In : LUT6
    generic map(
      INIT => X"CF05FF05FF05FF05"
    )
    port map (
      I0 => avr_interface_serial_rx_rx_q_260,
      I1 => avr_interface_serial_rx_ctr_q(4),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I3 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I4 => N6,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_state_q_FSM_FFd2_In_249
    );
  avr_interface_serial_rx_state_q_FSM_FFd1_In_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(6),
      I1 => avr_interface_serial_rx_ctr_q(0),
      O => N8
    );
  avr_interface_serial_rx_state_q_FSM_FFd1_In : LUT6
    generic map(
      INIT => X"F500F5C0F500F500"
    )
    port map (
      I0 => avr_interface_serial_rx_rx_q_260,
      I1 => avr_interface_serial_rx_ctr_q(4),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I4 => N8,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_state_q_FSM_FFd1_In_248
    );
  rst_n_IBUF : IBUF
    port map (
      I => rst_n,
      O => avr_interface_serial_rx_rst_inv
    );
  cclk_IBUF : IBUF
    port map (
      I => cclk,
      O => cclk_IBUF_1
    );
  spi_sck_IBUF : IBUF
    port map (
      I => spi_sck,
      O => spi_sck_IBUF_2
    );
  spi_ss_IBUF : IBUF
    port map (
      I => spi_ss,
      O => spi_ss_IBUF_3
    );
  spi_mosi_IBUF : IBUF
    port map (
      I => spi_mosi,
      O => spi_mosi_IBUF_4
    );
  avr_tx_IBUF : IBUF
    port map (
      I => avr_tx,
      O => avr_tx_IBUF_5
    );
  avr_rx_busy_IBUF : IBUF
    port map (
      I => avr_rx_busy,
      O => avr_rx_busy_IBUF_6
    );
  led_7_OBUF : OBUF
    port map (
      I => led_7_32,
      O => led(7)
    );
  led_6_OBUF : OBUF
    port map (
      I => led_6_33,
      O => led(6)
    );
  led_5_OBUF : OBUF
    port map (
      I => led_5_34,
      O => led(5)
    );
  led_4_OBUF : OBUF
    port map (
      I => led_4_35,
      O => led(4)
    );
  led_3_OBUF : OBUF
    port map (
      I => led_3_36,
      O => led(3)
    );
  led_2_OBUF : OBUF
    port map (
      I => led_2_37,
      O => led(2)
    );
  led_1_OBUF : OBUF
    port map (
      I => led_1_38,
      O => led(1)
    );
  led_0_OBUF : OBUF
    port map (
      I => led_0_39,
      O => led(0)
    );
  spi_channel_3_OBUFT : OBUFT
    port map (
      I => spi_channel_3_OBUFT_68,
      T => avr_interface_n_rdy,
      O => spi_channel(3)
    );
  spi_channel_2_OBUFT : OBUFT
    port map (
      I => spi_channel_3_OBUFT_68,
      T => avr_interface_n_rdy,
      O => spi_channel(2)
    );
  spi_channel_1_OBUFT : OBUFT
    port map (
      I => spi_channel_3_OBUFT_68,
      T => avr_interface_n_rdy,
      O => spi_channel(1)
    );
  spi_channel_0_OBUFT : OBUFT
    port map (
      I => spi_channel_3_OBUFT_68,
      T => avr_interface_n_rdy,
      O => spi_channel(0)
    );
  spi_miso_OBUFT : OBUFT
    port map (
      I => avr_interface_spi_slave_miso_q_135,
      T => avr_interface_ready_spi_miso_en_m_AND_7_o_inv,
      O => spi_miso
    );
  avr_rx_OBUFT : OBUFT
    port map (
      I => avr_interface_serial_tx_tx_q_145,
      T => avr_interface_n_rdy,
      O => avr_rx
    );
  pwm_OBUF : OBUF
    port map (
      I => pwm_output_pwm_q_7,
      O => pwm
    );
  data_to_send : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => data_to_send_rstpot_288,
      Q => data_to_send_65
    );
  avr_interface_byte_ct_q : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_n_rdy,
      D => avr_interface_byte_ct_q_rstpot_289,
      Q => avr_interface_byte_ct_q_133
    );
  avr_interface_spi_slave_miso_q : FDP
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_spi_slave_miso_q_rstpot_290,
      PRE => avr_interface_n_rdy,
      Q => avr_interface_spi_slave_miso_q_135
    );
  avr_interface_serial_tx_Mmux_ctr_d611_SW2 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(1),
      I1 => avr_interface_serial_tx_ctr_q(0),
      O => N16
    );
  avr_interface_serial_tx_Mmux_ctr_d611_SW3 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(3),
      I1 => avr_interface_serial_tx_ctr_q(2),
      I2 => avr_interface_serial_tx_ctr_q(4),
      I3 => avr_interface_serial_tx_ctr_q(1),
      I4 => avr_interface_serial_tx_ctr_q(0),
      I5 => avr_interface_serial_tx_ctr_q(5),
      O => N18
    );
  avr_interface_serial_tx_Mmux_ctr_d611_SW0 : LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(3),
      I1 => avr_interface_serial_tx_ctr_q(2),
      I2 => avr_interface_serial_tx_ctr_q(4),
      I3 => avr_interface_serial_tx_ctr_q(1),
      I4 => avr_interface_serial_tx_ctr_q(0),
      O => N12
    );
  avr_interface_serial_rx_n0078_inv11_SW0 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_rx_ctr_q(0),
      O => N20
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW1 : LUT5
    generic map(
      INIT => X"DFFFFFFF"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => avr_interface_serial_tx_ctr_q(4),
      I2 => avr_interface_serial_tx_ctr_q(5),
      I3 => avr_interface_serial_tx_ctr_q(1),
      I4 => avr_interface_serial_tx_ctr_q(0),
      O => N22
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW2 : LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_tx_ctr_q(6),
      I2 => avr_interface_serial_tx_ctr_q(4),
      I3 => avr_interface_serial_tx_ctr_q(5),
      I4 => avr_interface_serial_tx_ctr_q(1),
      I5 => avr_interface_serial_tx_ctr_q(0),
      O => N24
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW3 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_tx_block_q_206,
      O => N25
    );
  avr_interface_serial_tx_n0098_inv1 : LUT6
    generic map(
      INIT => X"000200020002C0C2"
    )
    port map (
      I0 => new_tx_data_40,
      I1 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I3 => N25,
      I4 => N01,
      I5 => N24,
      O => avr_interface_serial_tx_n0098_inv
    );
  avr_interface_serial_rx_bit_ctr_q_0 : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_bit_ctr_q_0_rstpot_298,
      Q => avr_interface_serial_rx_bit_ctr_q(0)
    );
  avr_interface_serial_tx_bit_ctr_q_2 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_bit_ctr_q_2_rstpot_299,
      Q => avr_interface_serial_tx_bit_ctr_q(2)
    );
  avr_interface_serial_tx_bit_ctr_q_1 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_bit_ctr_q_1_rstpot_300,
      Q => avr_interface_serial_tx_bit_ctr_q(1)
    );
  avr_interface_serial_tx_bit_ctr_q_0 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_bit_ctr_q_0_rstpot_301,
      Q => avr_interface_serial_tx_bit_ctr_q(0)
    );
  avr_interface_serial_tx_data_q_7 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_7_rstpot_302,
      Q => avr_interface_serial_tx_data_q(7)
    );
  avr_interface_serial_tx_data_q_6 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_6_rstpot_303,
      Q => avr_interface_serial_tx_data_q(6)
    );
  avr_interface_serial_tx_data_q_5 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_5_rstpot_304,
      Q => avr_interface_serial_tx_data_q(5)
    );
  avr_interface_serial_tx_data_q_4 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_4_rstpot_305,
      Q => avr_interface_serial_tx_data_q(4)
    );
  avr_interface_serial_tx_data_q_3 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_3_rstpot_306,
      Q => avr_interface_serial_tx_data_q(3)
    );
  avr_interface_serial_tx_data_q_2 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_2_rstpot_307,
      Q => avr_interface_serial_tx_data_q(2)
    );
  avr_interface_serial_tx_data_q_1 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_1_rstpot_308,
      Q => avr_interface_serial_tx_data_q(1)
    );
  avr_interface_serial_tx_data_q_0 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_tx_data_q_0_rstpot_309,
      Q => avr_interface_serial_tx_data_q(0)
    );
  avr_interface_serial_rx_bit_ctr_q_2 : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_bit_ctr_q_2_rstpot_310,
      Q => avr_interface_serial_rx_bit_ctr_q(2)
    );
  avr_interface_serial_rx_bit_ctr_q_1 : FDC
    port map (
      C => clk_BUFGP_0,
      CLR => avr_interface_serial_rx_rst_inv_BUFG_LUT1,
      D => avr_interface_serial_rx_bit_ctr_q_1_rstpot_311,
      Q => avr_interface_serial_rx_bit_ctr_q(1)
    );
  avr_interface_serial_rx_data_q_7 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_7_rstpot_312,
      Q => avr_interface_serial_rx_data_q(7)
    );
  avr_interface_serial_rx_data_q_6 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_6_rstpot_313,
      Q => avr_interface_serial_rx_data_q(6)
    );
  avr_interface_serial_rx_data_q_5 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_5_rstpot_314,
      Q => avr_interface_serial_rx_data_q(5)
    );
  avr_interface_serial_rx_data_q_4 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_4_rstpot_315,
      Q => avr_interface_serial_rx_data_q(4)
    );
  avr_interface_serial_rx_data_q_3 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_3_rstpot_316,
      Q => avr_interface_serial_rx_data_q(3)
    );
  avr_interface_serial_rx_data_q_2 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_2_rstpot_317,
      Q => avr_interface_serial_rx_data_q(2)
    );
  avr_interface_serial_rx_data_q_1 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_1_rstpot_318,
      Q => avr_interface_serial_rx_data_q(1)
    );
  avr_interface_serial_rx_data_q_0 : FD
    port map (
      C => clk_BUFGP_0,
      D => avr_interface_serial_rx_data_q_0_rstpot_319,
      Q => avr_interface_serial_rx_data_q(0)
    );
  avr_interface_serial_tx_Mmux_ctr_d42 : LUT6
    generic map(
      INIT => X"0A080508AAA85558"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(3),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_Mmux_ctr_d411_173,
      I5 => avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o,
      O => avr_interface_serial_tx_ctr_d(3)
    );
  avr_interface_serial_tx_Mmux_ctr_d31 : LUT6
    generic map(
      INIT => X"05080A085558AAA8"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(2),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => N16,
      I5 => avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o,
      O => avr_interface_serial_tx_ctr_d(2)
    );
  avr_interface_serial_tx_data_q_7_rstpot : LUT4
    generic map(
      INIT => X"0ACC"
    )
    port map (
      I0 => tx_data(7),
      I1 => avr_interface_serial_tx_data_q(7),
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I3 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_7_rstpot_302
    );
  avr_interface_serial_tx_data_q_6_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(6),
      I1 => avr_interface_serial_tx_data_q(6),
      I2 => avr_interface_serial_tx_data_q(7),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_6_rstpot_303
    );
  avr_interface_serial_tx_data_q_5_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(5),
      I1 => avr_interface_serial_tx_data_q(5),
      I2 => avr_interface_serial_tx_data_q(6),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_5_rstpot_304
    );
  avr_interface_serial_tx_data_q_4_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(4),
      I1 => avr_interface_serial_tx_data_q(4),
      I2 => avr_interface_serial_tx_data_q(5),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_4_rstpot_305
    );
  avr_interface_serial_tx_data_q_3_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(3),
      I1 => avr_interface_serial_tx_data_q(3),
      I2 => avr_interface_serial_tx_data_q(4),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_3_rstpot_306
    );
  avr_interface_serial_tx_data_q_2_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(2),
      I1 => avr_interface_serial_tx_data_q(2),
      I2 => avr_interface_serial_tx_data_q(3),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_2_rstpot_307
    );
  avr_interface_serial_tx_data_q_1_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(1),
      I1 => avr_interface_serial_tx_data_q(1),
      I2 => avr_interface_serial_tx_data_q(2),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_1_rstpot_308
    );
  avr_interface_serial_tx_data_q_0_rstpot : LUT5
    generic map(
      INIT => X"F0AACCCC"
    )
    port map (
      I0 => tx_data(0),
      I1 => avr_interface_serial_tx_data_q(0),
      I2 => avr_interface_serial_tx_data_q(1),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I4 => avr_interface_serial_tx_n0098_inv,
      O => avr_interface_serial_tx_data_q_0_rstpot_309
    );
  avr_interface_serial_rx_n0078_inv11_SW1 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(2),
      I1 => avr_interface_serial_rx_bit_ctr_q(1),
      I2 => avr_interface_serial_rx_bit_ctr_q(0),
      I3 => avr_interface_serial_rx_ctr_q(4),
      O => N27
    );
  avr_interface_serial_rx_Mmux_new_data_d11 : LUT6
    generic map(
      INIT => X"0080000000000000"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I1 => avr_interface_serial_rx_ctr_q(0),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N27,
      I4 => avr_interface_serial_rx_ctr_q(6),
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_new_data_d
    );
  avr_interface_serial_rx_n0095_inv1_SW0 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_rx_q_260,
      I1 => avr_interface_serial_rx_data_q(7),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N29
    );
  avr_interface_serial_rx_data_q_7_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(7),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N29,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_7_rstpot_312
    );
  avr_interface_serial_rx_n0095_inv1_SW1 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(7),
      I1 => avr_interface_serial_rx_data_q(6),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N31
    );
  avr_interface_serial_rx_data_q_6_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(6),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N31,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_6_rstpot_313
    );
  avr_interface_serial_rx_n0095_inv1_SW2 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(6),
      I1 => avr_interface_serial_rx_data_q(5),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N33
    );
  avr_interface_serial_rx_data_q_5_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(5),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N33,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_5_rstpot_314
    );
  avr_interface_serial_rx_n0095_inv1_SW3 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(5),
      I1 => avr_interface_serial_rx_data_q(4),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N35
    );
  avr_interface_serial_rx_data_q_4_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(4),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N35,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_4_rstpot_315
    );
  avr_interface_serial_rx_n0095_inv1_SW4 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(4),
      I1 => avr_interface_serial_rx_data_q(3),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N37
    );
  avr_interface_serial_rx_data_q_3_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(3),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N37,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_3_rstpot_316
    );
  avr_interface_serial_rx_n0095_inv1_SW5 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(3),
      I1 => avr_interface_serial_rx_data_q(2),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N39
    );
  avr_interface_serial_rx_data_q_2_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(2),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N39,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_2_rstpot_317
    );
  avr_interface_serial_rx_n0095_inv1_SW6 : LUT4
    generic map(
      INIT => X"CACC"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(2),
      I1 => avr_interface_serial_rx_data_q(1),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N41
    );
  avr_interface_serial_rx_data_q_1_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(1),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N41,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_1_rstpot_318
    );
  avr_interface_serial_rx_n0095_inv1_SW7 : LUT4
    generic map(
      INIT => X"ACAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(0),
      I1 => avr_interface_serial_rx_data_q(1),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_ctr_q(6),
      O => N43
    );
  avr_interface_serial_rx_data_q_0_rstpot : LUT6
    generic map(
      INIT => X"AAAAEA2AAAAAAAAA"
    )
    port map (
      I0 => avr_interface_serial_rx_data_q(0),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => N43,
      I4 => N20,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_data_q_0_rstpot_319
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW4 : LUT4
    generic map(
      INIT => X"F780"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(1),
      I1 => avr_interface_serial_tx_ctr_q(0),
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N45
    );
  avr_interface_serial_tx_state_q_FSM_FFd1_In1 : LUT6
    generic map(
      INIT => X"AAAABAAAAAAA8AAA"
    )
    port map (
      I0 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I1 => N01,
      I2 => avr_interface_serial_tx_ctr_q(6),
      I3 => avr_interface_serial_tx_ctr_q(5),
      I4 => avr_interface_serial_tx_ctr_q(4),
      I5 => N45,
      O => avr_interface_serial_tx_state_q_FSM_FFd1_In
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW6 : LUT6
    generic map(
      INIT => X"DFFFFFFFFFFFFFFF"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => avr_interface_serial_tx_ctr_q(4),
      I2 => avr_interface_serial_tx_ctr_q(5),
      I3 => avr_interface_serial_tx_ctr_q(1),
      I4 => avr_interface_serial_tx_ctr_q(0),
      I5 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N48
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW9 : LUT4
    generic map(
      INIT => X"5558"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(5),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N53
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW10 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(5),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N54
    );
  avr_interface_serial_tx_Mmux_ctr_d62 : LUT6
    generic map(
      INIT => X"FF2FDF0FF020D000"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => N01,
      I2 => N12,
      I3 => N54,
      I4 => N55,
      I5 => N53,
      O => avr_interface_serial_tx_ctr_d(5)
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW14 : LUT4
    generic map(
      INIT => X"5558"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N60
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW15 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(6),
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N61
    );
  avr_interface_serial_tx_Mmux_ctr_d7 : LUT6
    generic map(
      INIT => X"FF2FDF0FF020D000"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(5),
      I1 => N01,
      I2 => N18,
      I3 => N61,
      I4 => N62,
      I5 => N60,
      O => avr_interface_serial_tx_ctr_d(6)
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW0 : LUT5
    generic map(
      INIT => X"80007FFF"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(4),
      O => N64
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW1 : LUT6
    generic map(
      INIT => X"80008000FFFF7FFF"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(6),
      I5 => avr_interface_serial_rx_ctr_q(4),
      O => N65
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW2 : LUT6
    generic map(
      INIT => X"800080FF7FFF7FFF"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(6),
      I5 => avr_interface_serial_rx_ctr_q(4),
      O => N66
    );
  avr_interface_serial_rx_Mmux_ctr_d51 : LUT6
    generic map(
      INIT => X"0022CCEE0E0E0E0E"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => N64,
      I3 => N66,
      I4 => N65,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_ctr_d(4)
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW3 : LUT4
    generic map(
      INIT => X"9555"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      O => N68
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW4 : LUT6
    generic map(
      INIT => X"9555FF5595559555"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(4),
      I5 => avr_interface_serial_rx_ctr_q(6),
      O => N69
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW5 : LUT6
    generic map(
      INIT => X"9555955595FF9555"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(3),
      I1 => avr_interface_serial_rx_ctr_q(2),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      I4 => avr_interface_serial_rx_ctr_q(4),
      I5 => avr_interface_serial_rx_ctr_q(6),
      O => N70
    );
  avr_interface_serial_rx_Mmux_ctr_d41 : LUT6
    generic map(
      INIT => X"0022CCEE0E0E0E0E"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => N68,
      I3 => N70,
      I4 => N69,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_ctr_d(3)
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW6 : LUT3
    generic map(
      INIT => X"95"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(2),
      I1 => avr_interface_serial_rx_ctr_q(1),
      I2 => avr_interface_serial_rx_ctr_q(0),
      O => N72
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW7 : LUT5
    generic map(
      INIT => X"9595F595"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(2),
      I1 => avr_interface_serial_rx_ctr_q(1),
      I2 => avr_interface_serial_rx_ctr_q(0),
      I3 => avr_interface_serial_rx_ctr_q(6),
      I4 => avr_interface_serial_rx_ctr_q(4),
      O => N73
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW8 : LUT5
    generic map(
      INIT => X"95B79595"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(2),
      I1 => avr_interface_serial_rx_ctr_q(0),
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(6),
      I4 => avr_interface_serial_rx_ctr_q(4),
      O => N74
    );
  avr_interface_serial_rx_Mmux_ctr_d31 : LUT6
    generic map(
      INIT => X"00CC22EE0E0E0E0E"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => N72,
      I3 => N73,
      I4 => N74,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_ctr_d(2)
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW13 : LUT5
    generic map(
      INIT => X"FF5FC8CC"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(0),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I2 => avr_interface_serial_rx_ctr_q(6),
      I3 => avr_interface_serial_rx_ctr_q(4),
      I4 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      O => N81
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW14 : LUT3
    generic map(
      INIT => X"1F"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I2 => avr_interface_serial_rx_ctr_q(6),
      O => N83
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW15 : LUT4
    generic map(
      INIT => X"999F"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(5),
      I1 => avr_interface_serial_rx_ctr_q(6),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I3 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      O => N84
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW16 : LUT5
    generic map(
      INIT => X"3B333BFF"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(0),
      I1 => avr_interface_serial_rx_ctr_q(6),
      I2 => avr_interface_serial_rx_ctr_q(4),
      I3 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I4 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      O => N85
    );
  avr_interface_serial_rx_Mmux_ctr_d211_SW17 : LUT6
    generic map(
      INIT => X"AAEA5755AFEF5F5F"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(5),
      I1 => avr_interface_serial_rx_ctr_q(0),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I3 => avr_interface_serial_rx_ctr_q(4),
      I4 => avr_interface_serial_rx_ctr_q(6),
      I5 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      O => N86
    );
  avr_interface_serial_rx_Mmux_ctr_d71 : LUT6
    generic map(
      INIT => X"0027AA275527FF27"
    )
    port map (
      I0 => avr_interface_serial_rx_Madd_ctr_q_6_GND_26_o_add_6_OUT_cy_4_Q,
      I1 => N84,
      I2 => N83,
      I3 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      I4 => N86,
      I5 => N85,
      O => avr_interface_serial_rx_ctr_d(6)
    );
  avr_interface_serial_rx_n0078_inv1_SW0 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(0),
      I1 => avr_interface_serial_rx_ctr_q(4),
      O => N88
    );
  avr_interface_serial_rx_bit_ctr_q_0_rstpot : LUT6
    generic map(
      INIT => X"6A88AA88AA88AA88"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(0),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I2 => avr_interface_serial_rx_ctr_q(6),
      I3 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I4 => N88,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_bit_ctr_q_0_rstpot_298
    );
  avr_interface_serial_rx_n0078_inv1_SW1 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(1),
      I1 => avr_interface_serial_rx_bit_ctr_q(0),
      I2 => avr_interface_serial_rx_ctr_q(0),
      I3 => avr_interface_serial_rx_ctr_q(4),
      O => N90
    );
  avr_interface_serial_rx_bit_ctr_q_2_rstpot : LUT6
    generic map(
      INIT => X"6A88AA88AA88AA88"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(2),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I2 => avr_interface_serial_rx_ctr_q(6),
      I3 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I4 => N90,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_bit_ctr_q_2_rstpot_310
    );
  avr_interface_serial_rx_n0078_inv1_SW2 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(0),
      I1 => avr_interface_serial_rx_ctr_q(4),
      I2 => avr_interface_serial_rx_bit_ctr_q(0),
      O => N92
    );
  avr_interface_serial_rx_bit_ctr_q_1_rstpot : LUT6
    generic map(
      INIT => X"6A88AA88AA88AA88"
    )
    port map (
      I0 => avr_interface_serial_rx_bit_ctr_q(1),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I2 => avr_interface_serial_rx_ctr_q(6),
      I3 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I4 => N92,
      I5 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_bit_ctr_q_1_rstpot_311
    );
  avr_interface_serial_tx_n0116_inv1_SW0 : LUT3
    generic map(
      INIT => X"FD"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_tx_block_q_206,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N94
    );
  avr_interface_serial_tx_n0116_inv1_SW1 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_tx_bit_ctr_q(1),
      I2 => avr_interface_serial_tx_bit_ctr_q(0),
      I3 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N95
    );
  avr_interface_serial_tx_bit_ctr_q_2_rstpot : LUT6
    generic map(
      INIT => X"AAAA8888AAA68884"
    )
    port map (
      I0 => avr_interface_serial_tx_bit_ctr_q(2),
      I1 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I2 => N01,
      I3 => N22,
      I4 => N94,
      I5 => N95,
      O => avr_interface_serial_tx_bit_ctr_q_2_rstpot_299
    );
  avr_interface_serial_tx_n0116_inv1_SW3 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => avr_interface_serial_rx_rst_inv,
      I1 => avr_interface_serial_tx_bit_ctr_q(0),
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N98
    );
  avr_interface_serial_tx_bit_ctr_q_1_rstpot : LUT6
    generic map(
      INIT => X"AAAAAAA688888884"
    )
    port map (
      I0 => avr_interface_serial_tx_bit_ctr_q(1),
      I1 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I2 => N01,
      I3 => N22,
      I4 => N98,
      I5 => N94,
      O => avr_interface_serial_tx_bit_ctr_q_1_rstpot_300
    );
  data_to_send_tx_busy_AND_10_o1 : LUT5
    generic map(
      INIT => X"00000002"
    )
    port map (
      I0 => data_to_send_65,
      I1 => new_tx_data_40,
      I2 => avr_interface_serial_tx_block_q_206,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => data_to_send_tx_busy_AND_10_o
    );
  avr_interface_spi_slave_done_d2 : LUT6
    generic map(
      INIT => X"0400000000000000"
    )
    port map (
      I0 => avr_interface_spi_slave_sck_old_q_230,
      I1 => avr_interface_spi_slave_sck_q_233,
      I2 => avr_interface_spi_slave_ss_q_231,
      I3 => avr_interface_spi_slave_bit_ct_q(2),
      I4 => avr_interface_spi_slave_bit_ct_q(1),
      I5 => avr_interface_spi_slave_bit_ct_q(0),
      O => avr_interface_spi_slave_done_d
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW11 : MUXF7
    port map (
      I0 => spi_channel_3_OBUFT_68,
      I1 => N104,
      S => avr_interface_serial_tx_ctr_q(5),
      O => N55
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW11_G : LUT6
    generic map(
      INIT => X"BFBFFFFFBFBFFF00"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(4),
      I1 => avr_interface_serial_tx_ctr_q(1),
      I2 => avr_interface_serial_tx_ctr_q(0),
      I3 => avr_interface_serial_tx_block_q_206,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I5 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N104
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW16 : MUXF7
    port map (
      I0 => spi_channel_3_OBUFT_68,
      I1 => N106,
      S => avr_interface_serial_tx_ctr_q(6),
      O => N62
    );
  avr_interface_serial_tx_ctr_q_6_PWR_19_o_equal_12_o_6_SW16_G : LUT6
    generic map(
      INIT => X"BFBFFFFFBFBFFF00"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(4),
      I1 => avr_interface_serial_tx_ctr_q(1),
      I2 => avr_interface_serial_tx_ctr_q(0),
      I3 => avr_interface_serial_tx_block_q_206,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I5 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      O => N106
    );
  avr_interface_serial_tx_Mmux_ctr_d21 : LUT5
    generic map(
      INIT => X"666A6660"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(1),
      I1 => avr_interface_serial_tx_ctr_q(0),
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I3 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I4 => avr_interface_serial_tx_block_q_206,
      O => avr_interface_serial_tx_ctr_d(1)
    );
  avr_interface_serial_tx_Mmux_ctr_d51_SW0 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(3),
      I1 => avr_interface_serial_tx_ctr_q(0),
      I2 => avr_interface_serial_tx_ctr_q(1),
      O => N107
    );
  avr_interface_serial_tx_Mmux_ctr_d51 : LUT6
    generic map(
      INIT => X"AA5AAA6AAA5A8848"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(4),
      I1 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I2 => avr_interface_serial_tx_ctr_q(2),
      I3 => N107,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I5 => avr_interface_serial_tx_block_q_206,
      O => avr_interface_serial_tx_ctr_d(4)
    );
  avr_interface_serial_tx_Mmux_ctr_d11 : LUT4
    generic map(
      INIT => X"5654"
    )
    port map (
      I0 => avr_interface_serial_tx_ctr_q(0),
      I1 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I3 => avr_interface_serial_tx_block_q_206,
      O => avr_interface_serial_tx_ctr_d(0)
    );
  avr_interface_byte_ct_q_rstpot : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => avr_interface_spi_slave_done_q_134,
      I1 => avr_interface_byte_ct_q_133,
      I2 => spi_ss_IBUF_3,
      O => avr_interface_byte_ct_q_rstpot_289
    );
  avr_interface_spi_slave_miso_q_rstpot : LUT5
    generic map(
      INIT => X"EFEE4044"
    )
    port map (
      I0 => avr_interface_spi_slave_ss_q_231,
      I1 => avr_interface_spi_slave_miso_q_135,
      I2 => avr_interface_spi_slave_sck_q_233,
      I3 => avr_interface_spi_slave_sck_old_q_230,
      I4 => avr_interface_spi_slave_data_q(7),
      O => avr_interface_spi_slave_miso_q_rstpot_290
    );
  data_to_send_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFAAAAAAA8"
    )
    port map (
      I0 => data_to_send_65,
      I1 => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      I2 => new_tx_data_40,
      I3 => avr_interface_serial_tx_block_q_206,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I5 => avr_interface_serial_rx_new_data_q_31,
      O => data_to_send_rstpot_288
    );
  avr_interface_serial_rx_Mmux_ctr_d61 : LUT6
    generic map(
      INIT => X"55AA54A8000054A8"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(5),
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => avr_interface_serial_rx_Madd_ctr_q_6_GND_26_o_add_6_OUT_cy_4_Q,
      I4 => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      I5 => N81,
      O => avr_interface_serial_rx_ctr_d(5)
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT11 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_mosi_q_232,
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_0_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT21 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(0),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_1_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT31 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(1),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_2_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT41 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(2),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_3_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT51 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(3),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_4_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT61 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(4),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_5_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT81 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(6),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_7_Q
    );
  avr_interface_spi_slave_Mmux_data_q_6_din_7_mux_4_OUT71 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => avr_interface_spi_slave_bit_ct_q(0),
      I1 => avr_interface_spi_slave_bit_ct_q(1),
      I2 => avr_interface_spi_slave_bit_ct_q(2),
      I3 => avr_interface_spi_slave_data_q(5),
      O => avr_interface_spi_slave_data_q_6_din_7_mux_4_OUT_6_Q
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_0_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(0),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(0)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_1_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(1),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(1)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_2_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(2),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(2)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_3_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(3),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(3)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_4_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(4),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(4)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_5_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(5),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(5)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_6_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(6),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(6)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_7_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(7),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(7)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_8_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(8),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(8)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_9_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(9),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(9)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_10_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(10),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(10)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_11_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(11),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(11)
    );
  avr_interface_cclk_detector_Mcount_ctr_q_lut_12_Q : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cclk_IBUF_1,
      I1 => avr_interface_cclk_detector_ctr_q(12),
      O => avr_interface_cclk_detector_Mcount_ctr_q_lut(12)
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_2 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => pwm_output_cmp_q(3),
      I1 => pwm_output_cmp_q(0),
      I2 => pwm_output_cmp_q(1),
      I3 => pwm_output_cmp_q(2),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_3_Q
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_4_1 : LUT5
    generic map(
      INIT => X"6CCCCCCC"
    )
    port map (
      I0 => pwm_output_cmp_q(3),
      I1 => pwm_output_cmp_q(4),
      I2 => pwm_output_cmp_q(0),
      I3 => pwm_output_cmp_q(1),
      I4 => pwm_output_cmp_q(2),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_4_Q
    );
  pwm_output_cmp_q_7_GND_5_o_add_0_OUT_5_1 : LUT6
    generic map(
      INIT => X"6CCCCCCCCCCCCCCC"
    )
    port map (
      I0 => pwm_output_cmp_q(3),
      I1 => pwm_output_cmp_q(5),
      I2 => pwm_output_cmp_q(4),
      I3 => pwm_output_cmp_q(0),
      I4 => pwm_output_cmp_q(1),
      I5 => pwm_output_cmp_q(2),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_5_Q
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_0
    );
  avr_interface_serial_rx_rst_inv_BUFG : BUFG
    port map (
      O => avr_interface_serial_rx_rst_inv_BUFG_251,
      I => avr_interface_serial_rx_rst_inv
    );
  rst1_INV_0 : INV
    port map (
      I => avr_interface_serial_rx_rst_inv_BUFG_251,
      O => rst
    );
  avr_interface_n_rdy1_INV_0 : INV
    port map (
      I => avr_interface_cclk_detector_ready_q_144,
      O => avr_interface_n_rdy
    );
  pwm_output_Madd_cmp_q_7_GND_5_o_add_0_OUT_xor_0_11_INV_0 : INV
    port map (
      I => pwm_output_cmp_q(0),
      O => pwm_output_cmp_q_7_GND_5_o_add_0_OUT_0_Q
    );
  avr_interface_serial_rx_rst_inv_BUFG_LUT1_INV_0 : INV
    port map (
      I => avr_interface_serial_rx_rst_inv,
      O => avr_interface_serial_rx_rst_inv_BUFG_LUT1
    );
  avr_interface_serial_rx_Mmux_ctr_d21 : MUXF7
    port map (
      I0 => N109,
      I1 => N110,
      S => avr_interface_serial_rx_ctr_q_6_GND_26_o_equal_4_o_6_1,
      O => avr_interface_serial_rx_ctr_d(1)
    );
  avr_interface_serial_rx_Mmux_ctr_d21_F : LUT4
    generic map(
      INIT => X"0EE0"
    )
    port map (
      I0 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I1 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      I2 => avr_interface_serial_rx_ctr_q(1),
      I3 => avr_interface_serial_rx_ctr_q(0),
      O => N109
    );
  avr_interface_serial_rx_Mmux_ctr_d21_G : LUT6
    generic map(
      INIT => X"6666226660406060"
    )
    port map (
      I0 => avr_interface_serial_rx_ctr_q(1),
      I1 => avr_interface_serial_rx_ctr_q(0),
      I2 => avr_interface_serial_rx_state_q_FSM_FFd2_247,
      I3 => avr_interface_serial_rx_ctr_q(6),
      I4 => avr_interface_serial_rx_ctr_q(4),
      I5 => avr_interface_serial_rx_state_q_FSM_FFd1_246,
      O => N110
    );
  avr_interface_serial_tx_bit_ctr_q_0_rstpot : MUXF7
    port map (
      I0 => N111,
      I1 => N112,
      S => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      O => avr_interface_serial_tx_bit_ctr_q_0_rstpot_301
    );
  avr_interface_serial_tx_bit_ctr_q_0_rstpot_F : LUT4
    generic map(
      INIT => X"AAA2"
    )
    port map (
      I0 => avr_interface_serial_tx_bit_ctr_q(0),
      I1 => avr_interface_serial_rx_rst_inv,
      I2 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I3 => avr_interface_serial_tx_block_q_206,
      O => N111
    );
  avr_interface_serial_tx_bit_ctr_q_0_rstpot_G : LUT6
    generic map(
      INIT => X"AAAAAAAAA9AAAAAA"
    )
    port map (
      I0 => avr_interface_serial_tx_bit_ctr_q(0),
      I1 => avr_interface_serial_tx_ctr_q(3),
      I2 => avr_interface_serial_tx_ctr_q(2),
      I3 => avr_interface_serial_rx_rst_inv,
      I4 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I5 => N22,
      O => N112
    );
  avr_interface_serial_tx_state_q_FSM_FFd2_In : MUXF7
    port map (
      I0 => N113,
      I1 => N114,
      S => avr_interface_serial_tx_state_q_FSM_FFd2_182,
      O => avr_interface_serial_tx_state_q_FSM_FFd2_In_184
    );
  avr_interface_serial_tx_state_q_FSM_FFd2_In_F : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => avr_interface_serial_tx_block_q_206,
      I1 => avr_interface_serial_tx_state_q_FSM_FFd1_181,
      I2 => new_tx_data_40,
      O => N113
    );
  avr_interface_serial_tx_state_q_FSM_FFd2_In_G : LUT5
    generic map(
      INIT => X"FFF7FFFF"
    )
    port map (
      I0 => avr_interface_serial_tx_bit_ctr_q(1),
      I1 => avr_interface_serial_tx_bit_ctr_q(0),
      I2 => N48,
      I3 => N01,
      I4 => avr_interface_serial_tx_bit_ctr_q(2),
      O => N114
    );

end Structure;

