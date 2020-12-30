library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;


entity subbytes is
	port(
		subbytes_i : in type_state;
		subbytes_o : out type_state);
end subbytes;


architecture subbytes_arch of subbytes is
	
	component sbox
		port(
			sbox_in_i : in bit8;
			sbox_out_o : out bit8);
	end component;
	
	begin
		linee : for i in 0 to 3 generate 
			column : for j in 0 to 3 generate
				s_box : sbox
					 port map(
					 	sbox_in_i => subbytes_i(i)(j),
					 	sbox_out_o => subbytes_o(i)(j));
			end generate;
		end generate;

end subbytes_arch;
