library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity subbytes_tb is
end subbytes_tb;

architecture subbytes_tb_arch of subbytes_tb is

	component subbytes
		port(
			subbytes_i : in type_state;
			subbytes_o : out type_state);
	end component;
	
	signal subbytes_i_s : type_state := ((x"79", x"47", x"8b", x"65"),
					(x"1b", x"8e", x"81", x"aa"),
					(x"66", x"b7", x"7c", x"6f"),
					(x"62", x"c8", x"e4", x"03"));
	signal subbytes_o_s : type_state;
	
	
	begin
		dut : subbytes
		
			port map(
				subbytes_i => subbytes_i_s,
				subbytes_o => subbytes_o_s);
end subbytes_tb_arch;


configuration subbytes_tb_conf of subbytes_tb is
	for subbytes_tb_arch
		for dut : subbytes
			use configuration lib_rtl.subbytes_conf;
		end for;
	end for;
end subbytes_tb_conf;


