-- Copyright (C) 2022 SciAps Inc.
-- Proprietary
-- --
-- Project      Next Gen Blinky
-- Purpose      Test bench for certus nx eval top level module
-- Author       Peter Phelan

-------- imports --------
---- standard library ----
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.numeric_std_unsigned.all;
use IEEE.std_logic_textio.all;

---- system ----
use std.env.all;

---- vunit ----
library vunit_lib;
context vunit_lib.vunit_context;

---- project libraries ----
library ngb_lib;

-------- regN_tb --------
entity ngb_top_certus_nx_versa_eval_tb is
generic (
    runner_cfg : string;
    G_BLINK_COUNT : integer := 10
);
end ngb_top_certus_nx_versa_eval_tb;

architecture tb of ngb_top_certus_nx_versa_eval_tb is
    ---- system ----
    CONSTANT CLK_100M_PER : time := 10 ns;
    signal clk : std_logic := '0';
    signal rst_n : std_logic := '0';
    
    ---- dut ----

    -- io
    signal led_n : std_logic;

begin

    ---- stimulus ----
    proc_stim : process

    begin
        -- test setup
        test_runner_setup(runner, runner_cfg);
        report runner_cfg;
        -- report integer'image(stim_din);

        -- bfm setup
        wait until rising_edge(rst_n);
        wait until rising_edge(clk);

        -- test lopp
        while test_suite loop
            if run ("blinky_test") then
                for i in 0 to 9 loop
                    wait until rising_edge(led_n);
                end loop;
            end if;
        end loop;

        -- end of test
        wait for CLK_100M_PER;
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
    u_dut : entity ngb_lib.ngb_top_certus_nx_versa_eval
    generic map(
        G_BLINK_COUNT   => G_BLINK_COUNT
    )
    port map (
        ipin_clk_100M   => clk,
        ipin_rst_n      => rst_n,
        opin_led_n      => led_n
    );
    
end architecture;