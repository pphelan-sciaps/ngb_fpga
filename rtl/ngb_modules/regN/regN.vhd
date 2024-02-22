-- Copyright (C) 2022- SciAps Inc.
-- Proprietary
-- --
-- Project    - ngb
-- Purpose    - register of N-bit width  
-- Author     -

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regN is
generic (
    G_IS_SIM    : boolean := false;
    G_WIDTH     : natural := 16;
    G_INIT      : std_logic_vector(G_WIDTH-1 downto 0) := (others => '0');
    G_INIT_SIM  : std_logic_vector(G_WIDTH-1 downto 0) := (others => '0'));
port (
    i_sys_clk   : in  std_logic;
    i_sys_rst_n : in  std_logic;
    i_wr_en : in  std_logic;
    i_din   : in  std_logic_vector(G_WIDTH-1 downto 0);
    o_dout  : out std_logic_vector(G_WIDTH-1 downto 0));
end regN;

architecture Behavioral of regN is

    signal reg: std_logic_vector(G_WIDTH-1 downto 0);

begin

    process
    begin
        wait until rising_edge(i_sys_clk);
        if not i_sys_rst_n then
            reg <= G_INIT_SIM when G_IS_SIM else G_INIT;  --(others => '0');
        elsif i_wr_en then
            reg <= i_din;
        end if;
    end process;

    o_dout <= reg;

end Behavioral;
