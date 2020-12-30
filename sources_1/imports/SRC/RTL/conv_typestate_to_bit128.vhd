library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl; 

entity conv_typestate_to_bit128 is
    port(
        ts_i : in type_state;
        b128_o : out bit128);
end conv_typestate_to_bit128;


architecture conv_typestate_to_bit128_arch of conv_typestate_to_bit128 is
    begin
		linee : for i in 0 to 3 generate
			column : for j in 0 to 3 generate
				b128_o(127-32*j-8*i downto 120-32*j-8*i) <= ts_i(i)(j);
			end generate;
		end generate;
 		
end conv_typestate_to_bit128_arch;
