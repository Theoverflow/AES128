----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2020 22:34:23
-- Design Name: 
-- Module Name: TOPAES_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOPAES_tb is
--  Port ( );
end TOPAES_tb;

architecture Behavioral of TOPAES_tb is
component AES
    port(
       clock_i	: in  std_logic;
       reset_i	: in  std_logic;
       start_i	: in  std_logic;
       key_i	: in  bit128;
       data_i	: in  bit128;
       data_o	: out bit128;
       aes_on_o : out std_logic);
end component;

signal clock_s : std_logic;
signal reset_s : std_logic;
signal start_s : std_logic;
signal key_s : bit128 := x"2b7e151628aed2a6abf7158809cf4f3c";
signal data_i_s : bit128 := x"45732d747520636f6e66696ee865203f";
signal data_o_s : bit128;
signal aes_on_s : std_logic;
begin

DUT0:AES
port map(
    clock_i	=> clock_s,
    reset_i	=> reset_s,
    start_i	=> start_s,
    key_i	=> key_s,
    data_i	=> data_i_s,
    data_o	=> data_o_s,
    aes_on_o => aes_on_s);

 P1 : process
  begin
    reset_s <= '1';
    wait for 10 ns;
    reset_s <= '0';
    wait;
  end process P1;

  P2 : process
  begin
    start_s <= '0';
    wait for 100 ns;
    start_s <= '1';
    wait for 120 ns;
    start_s <= '0';
    wait for 3000 ns;
    start_s <= '1';
    wait for 120 ns;
    start_s <= '0';
    wait;
  end process P2;

  Pclk : process
  begin
    clock_s <= '0';
    wait for 50 ns;
    clock_s <= '1';
    wait for 50 ns;
  end process Pclk;

end Behavioral;
