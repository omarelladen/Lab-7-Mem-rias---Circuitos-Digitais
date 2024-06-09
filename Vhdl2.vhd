library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity up_ctr_mod256_2 is
    port (
        cout      : out std_logic_vector (7 downto 0);  -- Output do contador
        enable    : in  std_logic;                      -- Habilitar contagem
        clk       : in  std_logic;                      -- Relógio de entrada
        reset     : in  std_logic                       -- Reset de entrada
                               
    );
end entity;

architecture rtl of up_ctr_mod256_2 is
    signal count     : std_logic_vector (7 downto 0);
    
begin
    process (clk, reset) begin
        if (reset = '1') then
            count <= (others => '0');
        elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= count + 1;
            end if;
        end if;
    end process;

    cout <= count;
end architecture;