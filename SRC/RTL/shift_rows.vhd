library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;


entity shift_rows is 
	port(
		sr_i : in type_state;
		sr_o : out type_state);
		
end shift_rows;

architecture shift_rows_arch of shift_rows is
	
	begin
		L0 : for j in 0 to 3 generate
			sr_o(0)(j) <= sr_i(0)(j);
			
		end generate;
		
		linee : for i in 1 to 3 generate
			column : for j in 0 to 3 generate
				sr_o(i)(j) <= sr_i(i)((i+j) mod 4); --modulo pour traiter les effets de bors, 4 colonnes 
			end generate;
		end generate;

end shift_rows_arch;

		
		
	
		


