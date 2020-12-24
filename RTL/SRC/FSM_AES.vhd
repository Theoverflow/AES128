library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.crypt_pack.all;

entity FSM_AES is
    Port ( resetb_i : in  STD_LOGIC;
           clock_i : in  STD_LOGIC;
           start_i : in  STD_LOGIC;
	   reset_key_expander_o : out std_logic;
	   start_key_expander_o : out std_logic;
	   round_key_expander_o : out bit4;
	   end_key_expander_i : in std_logic;
	   enableMixcolumns_o : out std_logic;
	   enableRoundcomputing_o : out std_logic;
	   enableOutput_o : out std_logic;
	   done_o : out std_logic);
end FSM_AES;

architecture FSM_AES_arch  of FSM_AES is
type state_type is (reset, hold, start_key_expander, wait_key_expander, round0, roundn, lastround, store, done, wait_start);
signal present_state, next_state : state_type;
signal counter_s : integer range 0 to 10;
begin

sequentiel : process(clock_i, resetb_i, counter_s)
begin
	if resetb_i = '0' then
		present_state <= reset;
	elsif rising_edge(clock_i) then
		present_state <= next_state;
		if (present_state = round0) then
		  counter_s <= 1;
		elsif (present_state = roundn) then
		  counter_s <= counter_s + 1;
		end if;
	end if;
end process;

C0 : process(present_state, start_i, counter_s, end_key_expander_i)
begin
	case present_state is
		when reset => 
				next_state <= hold;
		when hold =>
				if (start_i = '1') then
					if (end_key_expander_i = '0') then
					   next_state <= start_key_expander;
					else 
					   next_state <= round0;
					end if;
				else
					next_state <= hold;
				end if;
		when start_key_expander =>
				next_state <= wait_key_expander;
		when wait_key_expander => 
				if (end_key_expander_i = '1') then 
					next_state <= round0;
				else
					next_state <= wait_key_expander;
				end if;
		when round0 =>  
				next_state <= roundn;
		when roundn =>
				if counter_s = 9 then
					next_state <= lastround;
				else
					next_state <= roundn;
				end if;
		when lastround => 
				next_state <= store;
		when store => 
                next_state <= done;
		when done =>
				if (start_i = '0') then
				    next_state <= wait_start;
				else
				    next_state <= done;
				end if;
		when wait_start =>
                if (start_i = '1') then
					if (end_key_expander_i = '0') then
                       next_state <= start_key_expander;
                    else 
                       next_state <= round0;
                    end if;
                else
                    next_state <= wait_start;
                end if;
        end case;
end process C0;

C1 : process(present_state, counter_s)
begin
	case present_state is
		when reset => 
			reset_key_expander_o <= '0';
			start_key_expander_o <= '0';
			round_key_expander_o <= X"0";
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '0';
			enableOutput_o <= '0';
			done_o <= '0';
		when hold =>
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= X"0";
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '0';
			enableOutput_o <= '0';
			done_o <= '0';
		when start_key_expander =>
			reset_key_expander_o <= '1';
			start_key_expander_o <= '1';
			round_key_expander_o <= X"0";
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '0';
			enableOutput_o <= '0';
			done_o <= '0';
		when wait_key_expander => 
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= X"0";
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '0';
			enableOutput_o <= '0';
			done_o <= '0';
		when round0 => 
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= X"0";
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '0';
			enableOutput_o <= '0';
			done_o <= '0';
		when roundn =>
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= conv_std_logic_vector(counter_s,4);
			enableMixColumns_o <= '1';
			enableRoundcomputing_o <= '1';
			enableOutput_o <= '0';
			done_o <= '0';
		when lastround =>
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= conv_std_logic_vector(counter_s,4);
			enableMixColumns_o <= '0';
			enableRoundcomputing_o <= '1';
			enableOutput_o <= '0';
			done_o <= '0';
		when store =>
            reset_key_expander_o <= '1';
            start_key_expander_o <= '0';
            round_key_expander_o <= conv_std_logic_vector(counter_s,4);
            enableMixColumns_o <= '0';
            enableRoundcomputing_o <= '1';
            enableOutput_o <= '1';
            done_o <= '0';
        when done =>
			reset_key_expander_o <= '1';
			start_key_expander_o <= '0';
			round_key_expander_o <= conv_std_logic_vector(counter_s,4);
			enableMixColumns_o <= '0';
			enableRoundcomputing_o <= '1';
			enableOutput_o <= '0';
			done_o <= '1';
		when wait_start =>
            reset_key_expander_o <= '1';
            start_key_expander_o <= '0';
            round_key_expander_o <= X"0";
            enableMixColumns_o <= '1';
            enableRoundcomputing_o <= '0';
            enableOutput_o <= '0';
            done_o <= '1';
        end case;
end process C1;

end FSM_AES_arch;

