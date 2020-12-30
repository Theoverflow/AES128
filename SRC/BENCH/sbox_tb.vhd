library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity sbox_tb is
end sbox_tb;

architecture sbox_tb_arch of sbox_tb is
	component sbox
		port (
			sbox_in_i : in bit8;
			sbox_out_o : out bit8);
	end component;
	
	signal sbox_in_s : bit8;
	signal sbox_out_s : bit8;
	
	begin
		dut : sbox
		port map (
			sbox_in_i => sbox_in_s,
			sbox_out_o => sbox_out_s);
			
		sbox_in_s <= x"00", x"0f" after 100 ns;
		
end sbox_tb_arch;
			
configuration sbox_tb_conf of sbox_tb is
	for sbox_tb_arch
		for dut : sbox
			use entity lib_rtl.sbox(sbox_arch);
		end for;
	end for;
end sbox_tb_conf;	

