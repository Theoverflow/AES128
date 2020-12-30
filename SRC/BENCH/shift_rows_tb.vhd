library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity shift_rows_tb is
end shift_rows_tb;

architecture shift_rows_tb_arch of shift_rows_tb is

	component shift_rows
		port(
			sr_i : in type_state;
			sr_o : out type_state);
	end component;
	
	signal sr_i_s : type_state :=  ((x"79", x"47", x"8b", x"65"),
					(x"1b", x"8e", x"81", x"aa"),
					(x"66", x"b7", x"7c", x"6f"),
					(x"62", x"c8", x"e4", x"03"));
	signal sr_o_s : type_state;
	
	begin
		dut : shift_rows
			port map(
				sr_i => sr_i_s,
				sr_o => sr_o_s);

end shift_rows_tb_arch;




configuration shift_rows_tb_conf of shift_rows_tb is
	for shift_rows_tb_arch
		for dut : shift_rows
			use entity lib_rtl.shift_rows(shift_rows_arch);
		end for;
	end for;
end shift_rows_tb_conf;