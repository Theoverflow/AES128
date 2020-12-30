----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2020 20:03:24
-- Design Name: 
-- Module Name: mixcolumns_tb - Behavioral
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

library lib_aes;
use lib_aes.crypt_pack.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mixcolumns_tb is
--  Port ( );
end mixcolumns_tb;

architecture Behavioral of mixcolumns_tb is

component mixcolumns
    port(
        mixcol_i : in type_state;
		mixcol_o : out type_state);
end component;

component conv_bit128_to_typestate is
    port(
        b128_i : in bit128;
        ts_o : out type_state);
end component;

signal b128_i_s : bit128 := x"9f19107b4c81a8aaa6ac07ddf8d7c88e";
signal ts_o_s : type_state;
signal mc_o_s : type_state;

begin

DUT0:conv_bit128_to_typestate
    port map(b128_i => b128_i_s, ts_o => ts_o_s);
    
DUT1:mixcolumns
    port map(mixcol_i => ts_o_s, mixcol_o => mc_o_s);

end Behavioral;
