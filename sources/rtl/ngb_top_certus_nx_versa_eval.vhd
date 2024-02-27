-------- HEADER --------
-- Copyright (C) 2024- SciAps Inc.
-- Proprietary
-- Project      NGB_FPGA
-- Purpose      Top level module for blinky targeting the Lattice Certus-NX Versa eval board.
-- Author       Peter Phelan
--------

-------- IMPORTS --------
-- standard library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-------- DESIGN UNIT --------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity ngb_top_certus_nx_versa_eval is
  generic (
    G_BLINK_COUNT : integer := 100_000_000
  );
  port (
    ipin_clk_100M   : in  std_logic;
    ipin_rst_n      : in  std_logic;
    opin_led_n      : out std_logic
  );
end entity;

architecture rtl of ngb_top_certus_nx_versa_eval is
  -- output buffers
  signal led_n  : std_logic;
begin
  ---- input syncing ----
  --n/a
  
  ---- output buffers ----
  opin_led_n <= led_n;

  ---- blinky ----
  proc_led_n : process
    constant COUNT_MAX  : integer   := G_BLINK_COUNT-1;

    variable count : integer range 0 to COUNT_MAX := COUNT_MAX;
  begin
    wait until rising_edge(ipin_clk_100M);
    if (not ipin_rst_n) then
      count := COUNT_MAX;
      led_n <= '1';
    elsif (count = 0) then
      count := COUNT_MAX;
      led_n <= not led_n;
    else
      count := count-1;
    end if;
  end process;

end architecture;
