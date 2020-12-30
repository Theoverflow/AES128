library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;

entity keyexpander_fsm is
    port(
        start_i : in std_logic;
        clock_i : in std_logic;
        resetb_i : in std_logic;
        counter_i : in bit4;
        enable_o : out std_logic;
        reset_o : out std_logic);
end keyexpander_fsm;


architecture keyexpander_fsm_arch of keyexpander_fsm is
    type state is (init, count, stop);
	signal etat_present, etat_futur : state;

	begin 	
		seq_0 : process (clock_i, resetb_i)
		begin
			if resetb_i = '0' then
			etat_present <= init;
			
			elsif clock_i 'event and clock_i = '1' then
				etat_present <= etat_futur;
			end if;
			
		end process seq_0;
		
		
		comb0 : process (etat_present, start_i, counter_i)
		begin
			case etat_present  is
				when init =>
					if start_i = '1' then
						etat_futur <= count;
					else 
						etat_futur <= init;
					end if;

				when count =>
					if (counter_i = x"9") then --toutes les roundes ont été faites
						etat_futur <= stop;
					else 
						etat_futur <= count;
					end if;

				when stop =>
					if (start_i = '1') then 
						etat_futur <= stop;
					else
						etat_futur <= init;
					end if;
				when others => -- rajouter quoi ?
			end case;
		end process comb0;
			
		comb1 : process (etat_present)
		begin
			case etat_present is
				when init =>
					enable_o <= '0';
					reset_o <= '0';
				when count =>
					enable_o <= '1';
					reset_o <= '1'; --reset inactif à l'état haut
				when stop =>
					enable_o <= '0';
					reset_o <= '1';
				
				when others => --?
			end case;
		end process comb1;

end keyexpander_fsm_arch;