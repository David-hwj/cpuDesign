library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity alu is
  port
(A: in unsigned(3 downto 0);
 B: in unsigned(3 downto 0);
 cin: in std_logic;
 S: in std_logic_vector(3 downto 0);
 R: in std_logic_vector(1 downto 0);
 bcout: out std_logic_vector(3 downto 0);
 cout: out std_logic);
end alu;
architecture behavor of alu is
  signal c,y: std_logic_vector(3 downto 0);
  signal q: unsigned(3 downto 0);
begin
process(a,b,cin,s,R)
begin
case s is
  when "1001"=>
             y(0)<=a(0) xor b(0) xor cin;
             c(0)<=(a(0) and b(0)) or (b(0) and cin) or (a(0) and cin);
             gen1:for i in 1 to 3 loop
             y(i)<=a(i) xor b(i) xor c(i-1);
             c(i)<=(c(i-1) and a(i)) or (c(i-1) and b(i)) or (a(i) and b(i));
             end loop;
             bcout<=y(3)&y(2)&y(1)&y(0);
             cout<=c(3);
  when "0110"=>
 if (a<b)  then
 y<=b-a;cout<='1';bcout<=y(3)&y(2)&y(1)&y(0);
 else
 y<=a-b;bcout<=y(3)&y(2)&y(1)&y(0);cout<='0';
 end if;
  when "1110"=>
             y(3)<=a(3) and b(3);
             y(2)<=a(2) and b(2);
             y(1)<=a(1) and b(1);
             y(0)<=a(0) and b(0);
             bcout<=y(3)&y(2)&y(1)&y(0);
  when "0101"=>
             y(3)<=not a(3);
             y(2)<=not a(2);
             y(1)<=not a(1);
             y(0)<=not a(0);
             bcout<=y(3)&y(2)&y(1)&y(0);
  when "1010"=>
             if(R="00")then
             y(3)<='0';
             y(2)<=a(3);
             y(1)<=a(2);
             y(0)<=a(1);
             bcout<=y(3)&y(2)&y(1)&y(0);
             end if;
             if(R="11")then
             y(3)<=a(2);
             y(2)<=a(1);
             y(1)<=a(0);
             y(0)<='0';
             bcout<=y(3)&y(2)&y(1)&y(0);
             end if;
  when others=>
             bcout<="0000";
  cout<='0';
end case;
end process;
end behavor;