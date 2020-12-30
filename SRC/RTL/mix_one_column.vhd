library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

entity mix_one_column is --pour facilier mixcolumns.vhd, d'abord mixe d'une colonne
	port(
		col_i : in column_state;
		col_o : out column_state);
end mix_one_column;


architecture mix_one_column_arch of mix_one_column is

	begin
		col_o(0) <= (col_i(0)(6 downto 0) & '0') xor "00011011" when col_i(0)(7) = '1' else col_i(0)(6 downto 0) & '0'; --XOR (((col_i(1)(6 downto 0) & '0') xor "00011011" when col_i(1)(7) = '1' else col_i(1)(6 downto 0) & '0') xor col_i(1)) XOR col_i(2) XOR col_i(3);
		
		col_o(1) <= col_i(0) XOR ((col_i(1)(6 downto 0) & '0') xor "00011011" when col_i(1)(7) = '1' else col_i(1)(6 downto 0) & '0') XOR (((col_i(2)(6 downto 0) & '0') xor "00011011" when col_i(2)(7) = '1' else col_i(2)(6 downto 0) & '0') xor col_i(2)) XOR col_i(3);
		
		col_o(2) <= col_i(0) XOR col_i(1) XOR ((col_i(2)(6 downto 0) & '0') xor "00011011" when col_i(2)(7) = '1' else col_i(2)(6 downto 0) & '0') XOR (((col_i(3)(6 downto 0) & '0') xor "00011011" when col_i(3)(7) = '1' else col_i(3)(6 downto 0) & '0') xor col_i(3));
		
		col_o(3) <= (((col_i(0)(6 downto 0) & '0') xor "00011011" when col_i(0)(7) = '1' else col_i(0)(6 downto 0) & '0') xor col_i(0)) XOR col_i(1) XOR col_i(2) XOR ((col_i(3)(6 downto 0) & '0') xor "00011011" when col_i(3)(7) = '1' else col_i(3)(6 downto 0) & '0');
		
end mix_one_column_arch;
				