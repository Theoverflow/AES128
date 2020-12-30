library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

entity keyexpansion_i_o is
	port(
		clock_i : in std_logic;
		key_i : in bit128;
		resetb_i : in std_logic;
		start_i : in std_logic;
		expansionkey_o : out bit128);
end keyexpansion_i_o;


architecture keyexpansion_i_o_arch of keyexpansion_i_o is
	component conv_bit128_to_typestate
    port(
        b128_i : in bit128;
        ts_o : out type_state);
    end component;

    component conv_typestate_to_bit128
    port(
        ts_i : in type_state;
        b128_o : out bit128);
	end component;
	
	component keyexpander
	port(
	);
	end component
	
	component keyexpander_fsm
	port(
	);
	end component;
	
	signal key_ts_s : type_state;

	begin
		conv_key : conv_bit128_to_typestate
            port map(
                b128_i => key_i,
                ts_o => key_ts_s);
end keyexpansion_i_o_arch;