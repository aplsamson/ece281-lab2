--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : thirtyOneDayMonth_tb.vhd (TEST BENCH)
--| AUTHOR(S)     : Capt Dan Johnson, ***Your Name Here***
--| CREATED       : 12/12/2019 Last Modified 06/24/2020
--| DESCRIPTION   : This file tests to ensure thirtyOneDayMonthMux works properly
--|
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : thirtyOneDayMonth.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevenSegDecoder_tb is --notice entity is empty.  The testbench has no external connections.
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is 
	
  -- declare the component of your top-level design unit under test (UUT) (looks very similar to entity declaration)
  component sevenSegDecoder is
    port(
	i_D : in STD_LOGIC_VECTOR (3 downto 0);
    o_S : out STD_LOGIC_VECTOR (6 downto 0)
    );	
  end component;

  -- declare any additional components required
  
  signal sw : std_logic_vector (3 downto 0);
  signal w_seg : std_logic_vector (6 downto 0);

  
begin
	-- PORT MAPS ----------------------------------------
	-- map ports for any component instances (port mapping is like wiring hardware)
    sevenSegDecoder_inst : sevenSegDecoder port map (
			i_D => sw,
			o_S => w_seg
        );
	-----------------------------------------------------

	-- PROCESSES ----------------------------------------	
	-- Test Plan Process --------------------------------
	-- Implement the test plan here.  Body of process is continuous from time = 0  
	test_process : process 
	begin
	-- Place test cases here. The first two have been written for you
		sw <= x"0"; wait for 10 ns;
            assert w_seg = "1000000" report "error on x0" severity failure;
        sw <= x"1"; wait for 10 ns;
            assert w_seg = "1111001" report "error on x1" severity failure;
        sw <= x"2"; wait for 10 ns;
            assert w_seg = "0100100" report "error on x2" severity failure;
        sw <= x"3"; wait for 10 ns;
            assert w_seg = "0110000" report "error on x3" severity failure; 
        sw <= x"4"; wait for 10 ns;
            assert w_seg = "0011001" report "error on x4" severity failure;       
        sw <= x"5"; wait for 10 ns;
            assert w_seg = "0010010" report "error on x5" severity failure;       
        sw <= x"6"; wait for 10 ns;
            assert w_seg = "0000010" report "error on x6" severity failure;  
        sw <= x"7"; wait for 10 ns;
            assert w_seg = "1111000" report "error on x7" severity failure;  
        sw <= x"8"; wait for 10 ns;
            assert w_seg = "0000000" report "error on x8" severity failure;
        sw <= x"9"; wait for 10 ns;
            assert w_seg = "0011000" report "error on x9" severity failure;
        sw <= x"A"; wait for 10 ns;
            assert w_seg = "0001000" report "error on x10" severity failure;      
        sw <= x"B"; wait for 10 ns;
            assert w_seg = "0000011" report "error on x11" severity failure;  
        sw <= x"C"; wait for 10 ns;
            assert w_seg = "0100111" report "error on x12" severity failure;          
        sw <= x"D"; wait for 10 ns;
            assert w_seg = "0100001" report "error on x13" severity failure;          
        sw <= x"E"; wait for 10 ns;
            assert w_seg = "0000110" report "error on x14" severity failure;  
        sw <= x"F"; wait for 10 ns;
            assert w_seg = "0001110" report "error on x15" severity failure;  
                     
		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;
