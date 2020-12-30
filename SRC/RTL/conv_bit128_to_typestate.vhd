library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity conv_bit128_to_typestate is
    port(
        b128_i : in bit128;
        ts_o : out type_state);
end conv_bit128_to_typestate;


architecture conv_bit128_to_typestate_arch of conv_bit128_to_typestate is
    begin
		linee : for i in 0 to 3 generate
			column : for j in 0 to 3 generate
			ts_o(i)(j) <= b128_i(127-32*j-8*i downto 120-32*j-8*i);
			end generate;
		end generate;
 
end conv_bit128_to_typestate_arch;
