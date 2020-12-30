library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

entity keyexpander is
    port(
        key_i : in type_state; --evite une conversion
        rcon_i : in bit8;
        expansion_key_o : out type_state);
end keyexpander;


architecture keyexpander_arch of keyexpander is

    component sbox
    port( 
		sbox_in_i : in bit8;
		sbox_out_o : out bit8);
    end component;
    
    signal rcon_s : column_state;
    signal col0_in_s, col1_in_s, col2_in_s, col3_in_s : column_state;
    signal col0_out_s, col1_out_s, col2_out_s, col3_out_s : column_state;
    signal output_rw_s, output_sb_s : column_state;

    begin

        rcon_s <= (rcon_i, x"00", x"00", x"00");
        
        col0_in_s <=(key_i(0)(0),key_i(1)(0), key_i(2)(0), key_i(3)(0));
        col1_in_s <=(key_i(0)(1),key_i(1)(1), key_i(2)(1), key_i(3)(1));
        col2_in_s <=(key_i(0)(2),key_i(1)(2), key_i(2)(2), key_i(3)(2));
        col3_in_s <=(key_i(0)(3),key_i(1)(3), key_i(2)(3), key_i(3)(3));

        output_rw_s <= (col3_in_s(1), col3_in_s(2), col3_in_s(3), col3_in_s(0));

        sb : for i in 0 to 3 generate
            sb0 : sbox
                port map(
                    sbox_in_i => output_rw_s(i),
                    sbox_out_o => output_sb_s(i));
        end generate;

        col0_out_s <= col0_in_s XOR output_sb_s XOR rcon_s;
        col1_out_s <= col0_out_s XOR col1_in_s;
        col2_out_s <= col1_out_s XOR col2_in_s;
        col3_out_s <= col2_out_s XOR col3_in_s;

        expansion_key_o <=((col0_out_s(0), col1_out_s(0), col2_out_s(0), col3_out_s(0)), --evite une conv b128 -> ts
                            (col0_out_s(1), col1_out_s(1), col2_out_s(1), col3_out_s(1)),
                            (col0_out_s(2), col1_out_s(2), col2_out_s(2), col3_out_s(2)),
                            (col0_out_s(3), col1_out_s(3), col2_out_s(3), col3_out_s(3)));
        
                                 
end keyexpander_arch;

