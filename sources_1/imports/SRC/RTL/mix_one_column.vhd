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
    signal col0_s, col1_s, col2_s,col3_s : bit8;
    
	begin
	    col0_s <= (col_i(0)(6 downto 0) & '0') xor "00011011" when col_i(0)(7) = '1'  else col_i(0)(6 downto 0) & '0';
	    col1_s <= (col_i(1)(6 downto 0) & '0') xor "00011011" when col_i(1)(7) = '1'  else col_i(1)(6 downto 0) & '0';
	    col2_s <= (col_i(2)(6 downto 0) & '0') xor "00011011" when col_i(2)(7) = '1'  else col_i(2)(6 downto 0) & '0';
	    col3_s <= (col_i(3)(6 downto 0) & '0') xor "00011011" when col_i(3)(7) = '1'  else col_i(3)(6 downto 0) & '0';
	    
	    col_o(0) <= col0_s XOR (col1_s xor col_i(1)) XOR col_i(2) XOR col_i(3);
	    col_o(1) <= col_i(0) XOR col1_s XOR (col2_s xor col_i(2)) XOR col_i(3);
	    col_o(2) <= col_i(0) XOR col_i(1) XOR col2_s XOR (col3_s xor col_i(3));
	    col_o(3) <= (col0_s xor col_i(0)) XOR col_i(1) XOR col_i(2) XOR col3_s;
--		col_o(0) <= (col_i(0)(6 downto 0) & '0') xor "00011011" when col_i(0)(7) = '1' else col_i(0)(6 downto 0) & '0'; --XOR (((col_i(1)(6 downto 0) & '0') xor "00011011" when col_i(1)(7) = '1' else col_i(1)(6 downto 0) & '0') xor col_i(1)) XOR col_i(2) XOR col_i(3);
		
--		col_o(1) <= col_i(0) XOR ((col_i(1)(6 downto 0) & '0') xor "00011011" when col_i(1)(7) = '1' else col_i(1)(6 downto 0) & '0' -- XOR (((col_i(2)(6 downto 0) & '0') xor "00011011" when col_i(2)(7) = '1' else col_i(2)(6 downto 0) & '0') xor col_i(2)) XOR col_i(3);
		
--		col_o(2) <= col_i(0) XOR col_i(1) XOR ((col_i(2)(6 downto 0) & '0') xor "00011011" when col_i(2)(7) = '1' else col_i(2)(6 downto 0) & '0') XOR (((col_i(3)(6 downto 0) & '0') xor "00011011" when col_i(3)(7) = '1' else col_i(3)(6 downto 0) & '0') xor col_i(3));
		
--		col_o(3) <= (((col_i(0)(6 downto 0) & '0') xor "00011011" when col_i(0)(7) = '1' else col_i(0)(6 downto 0) & '0') xor col_i(0)) XOR col_i(1) XOR col_i(2) XOR ((col_i(3)(6 downto 0) & '0') xor "00011011" when col_i(3)(7) = '1' else col_i(3)(6 downto 0) & '0');
		
end mix_one_column_arch;
				