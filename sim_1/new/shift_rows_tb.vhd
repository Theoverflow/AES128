----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.12.2020 18:15:40
-- Design Name: 
-- Module Name: shift_rows_tb - Behavioral
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

entity shift_rows_tb is
--  Port ( );
end shift_rows_tb;

architecture Behavioral of shift_rows_tb is

component shift_rows
    port(
		sr_i : in type_state;
		sr_o : out type_state);
end component;

component conv_bit128_to_typestate is
    port(
        b128_i : in bit128;
        ts_o : out type_state);
end component;

component conv_typestate_to_bit128
    port(
        ts_i : in type_state;
        b128_o : out bit128);
	end component;

signal sr_o_s : type_state;
signal b128_i_s : bit128 := x"526573746f20656e2076696c6c65203f";
signal b128_o_s : type_state;
signal ts_o_s : bit128;

begin

    DUT0:conv_bit128_to_typestate
        port map(
         b128_i => b128_i_s,
         ts_o => b128_o_s
        );
    
    DUT1:shift_rows
        port map(
         sr_i => b128_o_s,
         sr_o => sr_o_s
        );
        
    DUT2:conv_typestate_to_bit128
        port map(
         ts_i => sr_o_s,
         b128_o => ts_o_s
        );

end Behavioral;
