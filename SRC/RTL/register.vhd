library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lib_aes;
use lib_aes.crypt_pack.all;



-- architecture register_arch of register is

--     signal q_s : type_state;

--     begin
--         seq0 : process (clock_i, resetb_i) is
--             begin
--                 if resetb_i = '0' then
--                     q_s <= ((x"00", x"00", x"00", x"00"),
--                             (x"00", x"00", x"00", x"00"),
--                             (x"00", x"00", x"00", x"00"),
--                             (x"00", x"00", x"00", x"00"));
--                 elsif clock_i'event and clock_i = '1' then --front de clock montant
--                     q_s <= d_i;
--                 else 
--                     q_s <= q_s;

--                 end if;
--             end process seq0;
        
--         q_o <= q_s;
-- end register_arch;

