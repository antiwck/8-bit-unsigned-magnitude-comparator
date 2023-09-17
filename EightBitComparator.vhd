------------------------------------------------------------------------------------
-- Full adder
library ieee;
use ieee.std_logic_1164.all;

entity FA is 
	port (        
		a, b, cin	: in std_logic;
		cout, sum	: out std_logic
	);
end FA;

architecture Behavioral of FA is

signal tmp : std_logic;

begin
	tmp <= (a XOR b);
	sum <= (tmp XOR cin);
	cout <= ((tmp AND cin) OR (a AND b));
end Behavioral;


------------------------------------------------------------------------------------
-- 4-bit comparator
library ieee;
use ieee.std_logic_1164.all;

entity FourBitcomparator is
port (
	aInput		: in std_logic_vector(3 downto 0);
	bInput		: in std_logic_vector(3 downto 0);
	aLesserBin	: in std_logic;
	aEqualsBin	: in std_logic;
	aLargerBin	: in std_logic;
	aLesserBout	: out std_logic;
	aEqualsBout	: out std_logic;
	aLargerBout	: out std_logic
);
end FourBitcomparator;

architecture Behavioral of FourBitcomparator is

component FA is 
	port (        
		a, b, cin	: in std_logic;
		cout, sum	: out std_logic
	);
end component;

signal ainput0			: std_logic;
signal ainput1			: std_logic;
signal ainput2			: std_logic;
signal ainput3			: std_logic;
signal line0 			: std_logic;
signal line1 			: std_logic;
signal line2 			: std_logic;
signal line3 			: std_logic;
signal line0cout 		: std_logic;
signal line1cout 		: std_logic;
signal line2cout		: std_logic;
signal line3cout		: std_logic;
signal tmp1				: std_logic; 
signal tmp2				: std_logic; 
signal tmp3				: std_logic; 
signal tmp4				: std_logic;
signal tmp5				: std_logic;
signal tmp6				: std_logic;


begin
		
	ainput0		<= not(aInput(0));
	ainput1		<= not(aInput(1));
	ainput2		<= not(aInput(2));
	ainput3		<= not(aInput(3));

	FA0 : FA port map (
		a 		=> ainput0,
		b 		=> bInput(0),
		cin 	=> '1',
		cout 	=> line0cout,
		sum 	=> line0
	);
	
	FA1 : FA port map (
		a 		=> ainput1,
		b 		=> bInput(1),
		cin 	=> line0cout,
		cout 	=> line1cout,
		sum 	=> line1
	);
	
	FA2 : FA port map (
		a 		=> ainput2,
		b 		=> bInput(2),
		cin 	=> line1cout,
		cout 	=> line2cout,
		sum 	=> line2
	);
	
	FA3 : FA port map (
		a 		=> ainput3,
		b 		=> bInput(3),
		cin 	=> line2cout,
		cout 	=> line3cout,
		sum 	=> line3
	); 

	
	tmp1 	<= line3cout;
	tmp2	<= not(line0) and not(line1) and not(line2) and not(line3);
	tmp3	<= not(line3cout) or tmp2;
	
	tmp4	<= '0' when tmp1 = '1' and tmp2 = '1' and tmp3 = '1' else 
				tmp1;
	tmp5 	<= '1' when tmp1 = '1' and tmp2 = '1' and tmp3 = '1' else
				tmp2;
	tmp6	<= '0' when tmp1 = '1' and tmp2 = '1' and tmp3 = '1' else
				tmp3;
	
	aLesserBout <= '1' when tmp4 = '1' else
						'0' when tmp6 = '1' else
						'1' when aLesserBin = '1' else
						'0';

	aEqualsBout <= '1' when not tmp4 = '1' and not tmp6 = '1' and not aLesserBin = '1' else
						'0';

	aLargerBout <= '1' when tmp6 = '1' else
						'0' when tmp4 = '1' else
						'1' when aLargerBin = '1' else
						'0';
	
end Behavioral;

------------------------------------------------------------------------------------
-- 8-bit comparator
library ieee;
use ieee.std_logic_1164.all;

entity EightBitcomparator is
port (
	a 			: in std_logic_vector(7 downto 0);
	b 			: in std_logic_vector(7 downto 0);
	aLesserB	: out std_logic;
	aEqualsB	: out std_logic;
	aLargerB	: out std_logic
);
end EightBitcomparator;

architecture Behavioral of EightBitcomparator is

component FourBitcomparator is
port (
	aInput		: in std_logic_vector(3 downto 0);
	bInput		: in std_logic_vector(3 downto 0);
	aLesserBin	: in std_logic;
	aEqualsBin	: in std_logic;
	aLargerBin	: in std_logic;
	aLesserBout	: out std_logic;
	aEqualsBout	: out std_logic;
	aLargerBout	: out std_logic
);
end component;

signal tmpaLesserB 	: std_logic;
signal tmpaEqualsB 	: std_logic;
signal tmpaLargerB 	: std_logic;

begin

	COMP1: FourBitcomparator port map (
		aInput		=> a(3 downto 0),
		bInput		=> b(3 downto 0),
		aLesserBin	=> '0',
		aEqualsBin	=> '1',
		aLargerBin	=> '0',
		aLesserBout	=> tmpaLesserB,
		aEqualsBout	=> tmpaEqualsB,
		aLargerBout	=> tmpaLargerB
	);
	
	
	COMP2: FourBitcomparator port map (
		aInput		=> a(7 downto 4),
		bInput		=> b(7 downto 4),
		aLesserBin	=> tmpaLesserB,
		aEqualsBin	=> tmpaEqualsB,
		aLargerBin	=> tmpaLargerB,
		aLesserBout	=> aLesserB,
		aEqualsBout	=> aEqualsB,
		aLargerBout	=> aLargerB
	);

end Behavioral;
