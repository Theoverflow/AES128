library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity addroundkey_tb is
end addroundkey_tb;


architecture addroundkey_tb_arch of addroundkey_tb is

	component addroundkey
		port(
			state_i, roundkey_i : in type_state;
			state_o : out type_state);
	end component;
	
	signal state_i_s : type_state :=  ((x"79", x"47", x"8b", x"65"),
					(x"1b", x"8e", x"81", x"aa"),
					(x"66", x"b7", x"7c", x"6f"),
					(x"62", x"c8", x"e4", x"03"));
					
	signal roundkey_i_s : type_state :=((x"2b",x"28",x"ab", x"09"), -- key statement
					   (x"7e", x"ae", x"f7", x"cf"),
					   (x"15", x"d2", x"15", x"4f"), 
					   (x"16", x"a6", x"88", x"3c"));
					   
	signal state_o_s : type_state;
	
	begin
		dut : addroundkey
			port map(
				state_i => state_i_s,
				roundkey_i => roundkey_i_s,
				state_o => state_o_s);
	

end addroundkey_tb_arch;



configuration  addroundkey_tb_conf  of  addroundkey_tb  is
	for  addroundkey_tb_arch
		for  dut : addroundkey
			use  entity  lib_rtl.addroundkey(addroundkey_arch);
		end  for;
	end  for;
end  addroundkey_tb_conf;