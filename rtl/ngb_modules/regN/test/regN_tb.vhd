-- Copyright (C) 2022 SciAps Inc.
-- Proprietary
-- --
-- Project      [prj_name]
-- Purpose      
-- Author

-------- imports --------
---- standard library ----
library IEEE;
use IEEE.std_logic_1164.all;
-- use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;

---- system ----
use std.env.all;

---- vunit ----
library vunit_lib;
context vunit_lib.vunit_context;

---- project libraries ----
library ngb_lib;

-------- regN_tb --------
entity regN_tb is
    generic (runner_cfg : string);
end regN_tb;

architecture tb of regN_tb is
    ---- system ----
    CONSTANT CLK_100M_PER : time := 10 ns;
    signal clk : std_logic := '0';
    signal rst_n : std_logic := '0';
    
    ---- dut ----
    constant C_REG_WIDTH : integer := 16;
    subtype slv16 is std_logic_vector(C_REG_WIDTH-1 downto 0);

    -- io
    signal wr_en : std_logic := '0';
    signal din : slv16 := (others => '0');
    signal dout : slv16;

begin

    ---- stimulus ----
    proc_stim : process
    begin
        -- test setup
        test_runner_setup(runner, runner_cfg);

        -- test lopp
        report "Hello World!";
        wait for 100 ns;
        report "end of test";

        -- end of test
        test_runner_cleanup(runner);

    end process;

    ---- checker ----

    ---- drivers ----
    -- clock and reset
    clk <= not clk after CLK_100M_PER/2;
    
    proc_rst : process
    begin
        wait for 5 * CLK_100M_PER;
        rst_n <= '1';
        wait;
    end process;

    ---- dut ----
    u_dut : entity ngb_lib.regN
    port map (
        i_sys_clk   => clk,
        i_sys_rst_n => rst_n,
        i_wr_en     => wr_en,
        i_din       => din,
        o_dout      => dout
    );
    

end architecture;