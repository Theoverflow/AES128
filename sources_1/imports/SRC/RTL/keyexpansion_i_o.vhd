library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
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
        key_i : in type_state;
        rcon_i : in bit8;
        expansion_key_o : out type_state);
	end component;
	
	component reg
	port(
	   clock_i : in std_logic;
        resetb_i : in std_logic;
        q_o : out type_state;
        d_i : in type_state);
	end component;
	
	component keyexpander_fsm
	port(
	    start_i : in std_logic;
        clock_i : in std_logic;
        resetb_i : in std_logic;
        counter_i : in bit4;
        enable_o : out std_logic;
        reset_o : out std_logic);
	end component;
	
	component Counter
	port(
	   resetb_i  : in  std_logic;
       enable_i : in  std_logic;
       clock_i  : in  std_logic;
       counter_o  : out bit4);
	end component;
	
	signal key_i_ts_s : type_state;
	signal key_state_s : type_state;
	signal keyexp_o_ts_s : type_state;
	signal keyreg_o_ts_s : type_state; 
	signal counter_s : bit4;
	signal enable_s : std_logic;
	signal reset_s : std_logic;
	signal rcon_s : bit8;

	begin
	rcon_s <= Rcon(conv_integer(counter_s));
	key_state_s <= key_i_ts_s when counter_s = x"0" else keyreg_o_ts_s;
	    conv_key_i0: conv_bit128_to_typestate
            port map(
                b128_i => key_i,
                ts_o => key_i_ts_s);
        
        fsm0:keyexpander_fsm
            port map(
            start_i => start_i,
            clock_i => clock_i,
            resetb_i => resetb_i,
            counter_i => counter_s,
            enable_o => enable_s,
            reset_o => reset_s);
            
        cnt0:Counter
            port map(
            resetb_i => reset_s,
            enable_i => enable_s,
            clock_i => clock_i,
            counter_o => counter_s);
            
        keyexp0:keyexpander
        port map(
            key_i => key_state_s,
            rcon_i => rcon_s,
            expansion_key_o => keyexp_o_ts_s);
        
        reg0:reg
        port map(
            clock_i => clock_i,
            resetb_i => resetb_i,
            q_o => keyreg_o_ts_s,
            d_i => keyexp_o_ts_s);
            
        conv_key_o0:conv_typestate_to_bit128
        port map(
            ts_i => key_state_s,
            b128_o => expansionkey_o);
              
end keyexpansion_i_o_arch;