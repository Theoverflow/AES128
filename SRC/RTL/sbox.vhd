library ieee;
use ieee.std_logic_1164.all;

library lib_aes;
use lib_aes.crypt_pack.all;

library lib_rtl;

entity sbox is
	
	port(
		sbox_in_i : in bit8;
		sbox_out_o : out bit8);
end sbox;



architecture sbox_arch of sbox is
	
	
	begin
		
		sbox_out_o <= x"63" when sbox_in_i = x"00" 
			else
				x"7c" when sbox_in_i = x"01" 
			else
				x"77" when sbox_in_i = x"02" 
			else
				x"7b" when sbox_in_i = x"03"
			else 
				x"f2" when sbox_in_i = x"04"
			else
				x"6b" when sbox_in_i = x"05"
			else
				x"6f" when sbox_in_i = x"06"
			else
				x"c5" when sbox_in_i = x"07"
			else 
				x"30" when sbox_in_i = x"08"
			else
				x"01" when sbox_in_i = x"09"
			else 
				x"67" when sbox_in_i = x"0a"
			else 
				x"2b" when sbox_in_i = x"0b"
			else
				x"fe" when sbox_in_i = x"0c"
			else 
				x"d7" when sbox_in_i = x"0d"
			else
				x"ab" when sbox_in_i = x"0e"
			else
				x"76" when sbox_in_i = x"0f"
				
				
			else
				x"ca" when sbox_in_i = x"10"
			else
				x"82" when sbox_in_i = x"11" 
			else
				x"c9" when sbox_in_i = x"12" 
			else
				x"7d" when sbox_in_i = x"13"
			else 
				x"fa" when sbox_in_i = x"14"
			else
				x"59" when sbox_in_i = x"15"
			else
				x"47" when sbox_in_i = x"16"
			else
				x"f0" when sbox_in_i = x"17"
			else 
				x"ad" when sbox_in_i = x"18"
			else
				x"d4" when sbox_in_i = x"19"
			else 
				x"a2" when sbox_in_i = x"1a"
			else 
				x"af" when sbox_in_i = x"1b"
			else
				x"9c" when sbox_in_i = x"1c"
			else 
				x"a4" when sbox_in_i = x"1d"
			else
				x"72" when sbox_in_i = x"1e"
			else
				x"c0" when sbox_in_i = x"1f"
			
			
			else
				x"b7" when sbox_in_i = x"20"
			else
				x"fd" when sbox_in_i = x"21" 
			else
				x"93" when sbox_in_i = x"22" 
			else
				x"26" when sbox_in_i = x"23"
			else 
				x"36" when sbox_in_i = x"24"
			else
				x"3f" when sbox_in_i = x"25"
			else
				x"f7" when sbox_in_i = x"26"
			else
				x"cc" when sbox_in_i = x"27"
			else 
				x"34" when sbox_in_i = x"28"
			else
				x"a5" when sbox_in_i = x"29"
			else 
				x"e5" when sbox_in_i = x"2a"
			else 
				x"f1" when sbox_in_i = x"2b"
			else
				x"71" when sbox_in_i = x"2c"
			else 
				x"d8" when sbox_in_i = x"2d"
			else
				x"31" when sbox_in_i = x"2e"
			else
				x"15" when sbox_in_i = x"2f"
				
				
			else
				x"04" when sbox_in_i = x"30"
			else
				x"c7" when sbox_in_i = x"31" 
			else
				x"23" when sbox_in_i = x"32" 
			else
				x"c3" when sbox_in_i = x"33"
			else 
				x"18" when sbox_in_i = x"34"
			else
				x"96" when sbox_in_i = x"35"
			else
				x"05" when sbox_in_i = x"36"
			else
				x"9a" when sbox_in_i = x"37"
			else 
				x"07" when sbox_in_i = x"38"
			else
				x"12" when sbox_in_i = x"39"
			else 
				x"80" when sbox_in_i = x"3a"
			else 
				x"e2" when sbox_in_i = x"3b"
			else
				x"eb" when sbox_in_i = x"3c"
			else 
				x"27" when sbox_in_i = x"3d"
			else
				x"b2" when sbox_in_i = x"3e"
			else
				x"75" when sbox_in_i = x"3f"
				
				
			else
				x"09" when sbox_in_i = x"40"
			else
				x"83" when sbox_in_i = x"41" 
			else
				x"2c" when sbox_in_i = x"42" 
			else
				x"1a" when sbox_in_i = x"43"
			else 
				x"1b" when sbox_in_i = x"44"
			else
				x"6e" when sbox_in_i = x"45"
			else
				x"5a" when sbox_in_i = x"46"
			else
				x"a0" when sbox_in_i = x"47"
			else 
				x"52" when sbox_in_i = x"48"
			else
				x"3b" when sbox_in_i = x"49"
			else 
				x"d6" when sbox_in_i = x"4a"
			else 
				x"b3" when sbox_in_i = x"4b"
			else
				x"29" when sbox_in_i = x"4c"
			else 
				x"e3" when sbox_in_i = x"4d"
			else
				x"2f" when sbox_in_i = x"4e"
			else
				x"84" when sbox_in_i = x"4f"
				
				
			else
				x"53" when sbox_in_i = x"50"
			else
				x"d1" when sbox_in_i = x"51" 
			else
				x"00" when sbox_in_i = x"52" 
			else
				x"ed" when sbox_in_i = x"53"
			else 
				x"20" when sbox_in_i = x"54"
			else
				x"fc" when sbox_in_i = x"55"
			else
				x"b1" when sbox_in_i = x"56"
			else
				x"5b" when sbox_in_i = x"57"
			else 
				x"6a" when sbox_in_i = x"58"
			else
				x"cb" when sbox_in_i = x"59"
			else 
				x"be" when sbox_in_i = x"5a"
			else 
				x"39" when sbox_in_i = x"5b"
			else
				x"4a" when sbox_in_i = x"5c"
			else 
				x"4c" when sbox_in_i = x"5d"
			else
				x"58" when sbox_in_i = x"5e"
			else
				x"cf" when sbox_in_i = x"5f"
				
				
			else
				x"d0" when sbox_in_i = x"60"
			else
				x"ef" when sbox_in_i = x"61" 
			else
				x"aa" when sbox_in_i = x"62" 
			else
				x"fb" when sbox_in_i = x"63"
			else 
				x"43" when sbox_in_i = x"64"
			else
				x"4d" when sbox_in_i = x"65"
			else
				x"33" when sbox_in_i = x"66"
			else
				x"85" when sbox_in_i = x"67"
			else 
				x"45" when sbox_in_i = x"68"
			else
				x"f9" when sbox_in_i = x"69"
			else 
				x"02" when sbox_in_i = x"6a"
			else 
				x"7f" when sbox_in_i = x"6b"
			else
				x"50" when sbox_in_i = x"6c"
			else 
				x"3c" when sbox_in_i = x"6d"
			else
				x"9f" when sbox_in_i = x"6e"
			else
				x"a8" when sbox_in_i = x"6f"
				
				
			else
				x"51" when sbox_in_i = x"70"
			else
				x"a3" when sbox_in_i = x"71" 
			else
				x"40" when sbox_in_i = x"72" 
			else
				x"8f" when sbox_in_i = x"73"
			else 
				x"92" when sbox_in_i = x"74"
			else
				x"9d" when sbox_in_i = x"75"
			else
				x"38" when sbox_in_i = x"76"
			else
				x"f5" when sbox_in_i = x"77"
			else 
				x"bc" when sbox_in_i = x"78"
			else
				x"b6" when sbox_in_i = x"79"
			else 
				x"da" when sbox_in_i = x"7a"
			else 
				x"21" when sbox_in_i = x"7b"
			else
				x"10" when sbox_in_i = x"7c"
			else 
				x"ff" when sbox_in_i = x"7d"
			else
				x"f3" when sbox_in_i = x"7e"
			else
				x"d2" when sbox_in_i = x"7f"
				
				
			else
				x"cd" when sbox_in_i = x"80"
			else
				x"0c" when sbox_in_i = x"81" 
			else
				x"13" when sbox_in_i = x"82" 
			else
				x"ec" when sbox_in_i = x"83"
			else 
				x"5f" when sbox_in_i = x"84"
			else
				x"97" when sbox_in_i = x"85"
			else
				x"44" when sbox_in_i = x"86"
			else
				x"17" when sbox_in_i = x"87"
			else 
				x"c4" when sbox_in_i = x"88"
			else
				x"a7" when sbox_in_i = x"89"
			else 
				x"7e" when sbox_in_i = x"8a"
			else 
				x"3d" when sbox_in_i = x"8b"
			else
				x"64" when sbox_in_i = x"8c"
			else 
				x"5d" when sbox_in_i = x"8d"
			else
				x"19" when sbox_in_i = x"8e"
			else
				x"73" when sbox_in_i = x"8f"
				
				
			else
				x"60" when sbox_in_i = x"90"
			else
				x"81" when sbox_in_i = x"91" 
			else
				x"4f" when sbox_in_i = x"92" 
			else
				x"dc" when sbox_in_i = x"93"
			else 
				x"22" when sbox_in_i = x"94"
			else
				x"2a" when sbox_in_i = x"95"
			else
				x"90" when sbox_in_i = x"96"
			else
				x"88" when sbox_in_i = x"97"
			else 
				x"46" when sbox_in_i = x"98"
			else
				x"ee" when sbox_in_i = x"99"
			else 
				x"b8" when sbox_in_i = x"9a"
			else 
				x"14" when sbox_in_i = x"9b"
			else
				x"de" when sbox_in_i = x"9c"
			else 
				x"5e" when sbox_in_i = x"9d"
			else
				x"0b" when sbox_in_i = x"9e"
			else
				x"db" when sbox_in_i = x"9f"
				
				
			else
				x"e0" when sbox_in_i = x"a0"
			else
				x"32" when sbox_in_i = x"a1" 
			else
				x"3a" when sbox_in_i = x"a2" 
			else
				x"0a" when sbox_in_i = x"a3"
			else 
				x"49" when sbox_in_i = x"a4"
			else
				x"06" when sbox_in_i = x"a5"
			else
				x"24" when sbox_in_i = x"a6"
			else
				x"5c" when sbox_in_i = x"a7"
			else 
				x"c2" when sbox_in_i = x"a8"
			else
				x"d3" when sbox_in_i = x"a9"
			else 
				x"ac" when sbox_in_i = x"aa"
			else 
				x"62" when sbox_in_i = x"ab"
			else
				x"91" when sbox_in_i = x"ac"
			else 
				x"95" when sbox_in_i = x"ad"
			else
				x"e4" when sbox_in_i = x"ae"
			else
				x"79" when sbox_in_i = x"af"
				
				
			else
				x"e7" when sbox_in_i = x"b0"
			else
				x"c8" when sbox_in_i = x"b1" 
			else
				x"37" when sbox_in_i = x"b2" 
			else
				x"6d" when sbox_in_i = x"b3"
			else 
				x"8d" when sbox_in_i = x"b4"
			else
				x"d5" when sbox_in_i = x"b5"
			else
				x"4e" when sbox_in_i = x"b6"
			else
				x"a9" when sbox_in_i = x"b7"
			else 
				x"6c" when sbox_in_i = x"b8"
			else
				x"56" when sbox_in_i = x"b9"
			else 
				x"f4" when sbox_in_i = x"ba"
			else 
				x"ea" when sbox_in_i = x"bb"
			else
				x"65" when sbox_in_i = x"bc"
			else 
				x"7a" when sbox_in_i = x"bd"
			else
				x"ae" when sbox_in_i = x"be"
			else
				x"08" when sbox_in_i = x"bf"
				
				
			else
				x"ba" when sbox_in_i = x"c0"
			else
				x"78" when sbox_in_i = x"c1" 
			else
				x"25" when sbox_in_i = x"c2" 
			else
				x"2e" when sbox_in_i = x"c3"
			else 
				x"1c" when sbox_in_i = x"c4"
			else
				x"a6" when sbox_in_i = x"c5"
			else
				x"b4" when sbox_in_i = x"c6"
			else
				x"c6" when sbox_in_i = x"c7"
			else 
				x"e8" when sbox_in_i = x"c8"
			else
				x"dd" when sbox_in_i = x"c9"
			else 
				x"74" when sbox_in_i = x"ca"
			else 
				x"1f" when sbox_in_i = x"cb"
			else
				x"4b" when sbox_in_i = x"cc"
			else 
				x"bd" when sbox_in_i = x"cd"
			else
				x"8b" when sbox_in_i = x"ce"
			else
				x"8a" when sbox_in_i = x"cf"
				
				
			else
				x"70" when sbox_in_i = x"d0"
			else
				x"3e" when sbox_in_i = x"d1" 
			else
				x"b5" when sbox_in_i = x"d2" 
			else
				x"66" when sbox_in_i = x"d3"
			else 
				x"48" when sbox_in_i = x"d4"
			else
				x"03" when sbox_in_i = x"d5"
			else
				x"f6" when sbox_in_i = x"d6"
			else
				x"0e" when sbox_in_i = x"d7"
			else 
				x"61" when sbox_in_i = x"d8"
			else
				x"35" when sbox_in_i = x"d9"
			else 
				x"57" when sbox_in_i = x"da"
			else 
				x"b9" when sbox_in_i = x"db"
			else
				x"86" when sbox_in_i = x"dc"
			else 
				x"c1" when sbox_in_i = x"dd"
			else
				x"1d" when sbox_in_i = x"de"
			else
				x"9e" when sbox_in_i = x"df"
				
				
			else
				x"e1" when sbox_in_i = x"e0"
			else
				x"f8" when sbox_in_i = x"e1" 
			else
				x"98" when sbox_in_i = x"e2" 
			else
				x"11" when sbox_in_i = x"e3"
			else 
				x"69" when sbox_in_i = x"e4"
			else
				x"d9" when sbox_in_i = x"e5"
			else
				x"8e" when sbox_in_i = x"e6"
			else
				x"94" when sbox_in_i = x"e7"
			else 
				x"9b" when sbox_in_i = x"e8"
			else
				x"1e" when sbox_in_i = x"e9"
			else 
				x"87" when sbox_in_i = x"ea"
			else 
				x"e9" when sbox_in_i = x"eb"
			else
				x"ce" when sbox_in_i = x"ec"
			else 
				x"55" when sbox_in_i = x"ed"
			else
				x"28" when sbox_in_i = x"ee"
			else
				x"df" when sbox_in_i = x"ef"
				
				
			else
				x"8c" when sbox_in_i = x"f0"
			else
				x"a1" when sbox_in_i = x"f1" 
			else
				x"89" when sbox_in_i = x"f2" 
			else
				x"0d" when sbox_in_i = x"f3"
			else 
				x"bf" when sbox_in_i = x"f4"
			else
				x"e6" when sbox_in_i = x"f5"
			else
				x"42" when sbox_in_i = x"f6"
			else
				x"68" when sbox_in_i = x"f7"
			else 
				x"41" when sbox_in_i = x"f8"
			else
				x"99" when sbox_in_i = x"f9"
			else 
				x"2d" when sbox_in_i = x"fa"
			else 
				x"0f" when sbox_in_i = x"fb"
			else
				x"b0" when sbox_in_i = x"fc"
			else 
				x"54" when sbox_in_i = x"fd"
			else
				x"bb" when sbox_in_i = x"fe"
			else
				x"16" when sbox_in_i = x"ff";

end sbox_arch;
				
				
			
			
				
				
				
				
				
				
				
				
				