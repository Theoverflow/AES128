library ieee;
use ieee.std_logic_1164.all; -- attention faire la cnof !!
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;


entity mixcolumns is
	port(
		mixcol_i : in type_state;
		mixcol_o : out type_state);
end mixcolumns;


architecture mixcolumns_arch of mixcolumns is 

	component mix_one_column 
	port(
		col_i : in column_state;
		col_o : out column_state);
	end component;

	signal col0_in_s, col1_in_s, col2_in_s, col3_in_s : column_state;
	signal col0_out_s, col1_out_s, col2_out_s, col3_out_s : column_state;

	begin
		col0_in_s <= (mixcol_i(0)(0), mixcol_i(1)(0), mixcol_i(2)(0), mixcol_i(3)(0)); --le type_state se remplit colonne par colonne, inverser les indices 
		col1_in_s <= (mixcol_i(0)(1), mixcol_i(1)(1), mixcol_i(2)(1), mixcol_i(3)(1));
		col2_in_s <= (mixcol_i(0)(2), mixcol_i(1)(2), mixcol_i(2)(2), mixcol_i(3)(2));
		col3_in_s <= (mixcol_i(0)(3), mixcol_i(1)(3), mixcol_i(2)(3), mixcol_i(3)(3));


		Mixcol0 : mix_one_column
			port map(
				col_i => col0_in_s,
				col_o => col0_out_s);
			
		Mixcol1 : mix_one_column
			port map(
				col_i => col1_in_s,
				col_o => col1_out_s);

		Mixcol2 : mix_one_column
			port map(
				col_i => col2_in_s,
				col_o => col2_out_s);
		
		Mixcol3 : mix_one_column
			port map(
				col_i => col3_in_s,
				col_o => col3_out_s);
			
		mixcol_o <= (col0_out_s(0), col1_out_s(0), col2_out_s(0), col3_out_s(0)),
					(col0_out_s(1), col1_out_s(1), col2_out_s(1), col3_out_s(1)),
					(col0_out_s(2), col1_out_s(2), col2_out_s(2), col3_out_s(2)),
					(col0_out_s(3), col1_out_s(3), col2_out_s(3), col3_out_s(3));

end mixcolumns_arch;
		