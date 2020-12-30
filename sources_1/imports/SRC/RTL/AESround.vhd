library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

entity aesround is
	port(
		enablemixcolumns_i : in std_logic;
		currentkey_i : in bit128;
		enableroundcomputing_i : in std_logic;
		clock_i : in std_logic;
		resetb_i : in std_logic;
		text_i : in bit128;
		data_o : out bit128);

end aesround;

architecture aesround_arch of aesround is
	component subbytes
	port(
		subbytes_i : in type_state;
		subbytes_o : out type_state);
	end component;
	
	component shift_rows
	port(
		sr_i : in type_state;
		sr_o : out type_state);
	end component;
	
	component mixcolumns
	port(
		mixcol_i : in type_state;
		mixcol_o : out type_state);
	end component;
	
	component addroundkey
	port(
		state_i, roundkey_i : in type_state;
		state_o : out type_state);
	end component;

	component reg
		port(
			clock_i, resetb_i : in std_logic;
			d_i : in type_state;
			q_o : out type_state);
	end component;

	component conv_bit128_to_typestate is
		port(
			b128_i : in bit128;
        	ts_o : out type_state);
	end component;

	component conv_typestate_to_bit128 is
		port(
			ts_i : in type_state;
			b128_o : out bit128);
	end component;
	
	signal output_register_s : type_state;
	signal output_subbytes_s : type_state;
	signal output_shiftrows_s : type_state;
	signal output_mixcolumns_s : type_state;
	signal output_mux_mc_s : type_state;
	signal input_addroundkey_s : type_state;
	signal output_addroundkey_s : type_state;
	signal currentkey_s : type_state;
	signal text_s : type_state;
	
	begin
		conv_b128_to_typestate_text : conv_bit128_to_typestate
			port map(
				b128_i => text_i,
				ts_o => text_s);

		conv_b128_to_typestate_key : conv_bit128_to_typestate
			port map(
				b128_i => currentkey_i,
				ts_o => currentkey_s);
		
		input_addroundkey_s <= text_s when enableroundcomputing_i = '0' else output_mux_mc_s;--MUX avant le bloc AddRoundKey permettant de distinguer le premier tour

		addroundkey0 : addroundkey
		port map(
			state_i => input_addroundkey_s,
			roundkey_i => currentkey_s,
			state_o => output_addroundkey_s);

		reg_state : reg
		port map(
			resetb_i => resetb_i,
			clock_i => clock_i,
			d_i => output_addroundkey_s,
			q_o => output_register_s);

		conv_typestate_to_b128_output : conv_typestate_to_bit128
		port map(
			ts_i => output_register_s,
			b128_o => data_o);
		
		subbytes0 : subbytes
		port map(
			subbytes_i => output_register_s,
			subbytes_o => output_subbytes_s);
		
		shiftrows : shift_rows
		port map(
			sr_i => output_subbytes_s,
			sr_o => output_shiftrows_s);
		
		mixcolumns0 : mixcolumns
		port map(
			mixcol_i => output_shiftrows_s,
			mixcol_o => output_mixcolumns_s);
		
		output_mux_mc_s <= output_shiftrows_s when enablemixcolumns_i = '0' else output_mixcolumns_s;

end aesround_arch;