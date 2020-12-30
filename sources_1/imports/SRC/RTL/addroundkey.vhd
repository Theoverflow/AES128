library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;


entity addroundkey is
	port(
		state_i, roundkey_i : in type_state;
		state_o : out type_state);

end addroundkey;


architecture addroundkey_arch of addroundkey is

	begin
		linee : for i in 0 to 3 generate
			column : for j in 0 to 3 generate
				state_o(i)(j) <= state_i(i)(j) XOR roundkey_i(i)(j);
			end generate;
		end generate;
		
end addroundkey_arch;