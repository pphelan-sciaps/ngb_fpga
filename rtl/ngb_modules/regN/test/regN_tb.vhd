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
entity regN_tb is
generic (
    runner_cfg : string;
    stim_din : integer
);
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
        variable test_idx : integer := 0;

        procedure write_check (constant wr_val : in integer) is
        begin
            -- set values
            wr_en <= '1';
            din <= std_logic_vector(to_unsigned(wr_val, C_REG_WIDTH));

            -- wait
            wait until rising_edge(clk);
            wait for 10 ps;

            -- check
            check_equal(dout, din, "write check");

            -- clean up
            wr_en <= '0';

        end procedure write_check;
    begin
        -- test setup
        test_runner_setup(runner, runner_cfg);
        report runner_cfg;
        -- report integer'image(stim_din);
        wait until rising_edge(rst_n);
        wait until rising_edge(clk);

        -- test lopp
        while test_suite loop
            if run ("write_test") then
                write_check(stim_din);
            -- elsif run("no_write_test") then
            --     report "no write";
            end if;

            -- end if;
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
    u_dut : entity ngb_lib.regN
    port map (
        i_sys_clk   => clk,
        i_sys_rst_n => rst_n,
        i_wr_en     => wr_en,
        i_din       => din,
        o_dout      => dout
    );
    

end architecture;