library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;
entity CPU_IRyima is
	port(
		in_zl:in std_logic_vector(1 downto 0);
		t:in std_logic_vector(2 downto 0);
		
		jmp,
		load_sa,load_sb,load_mar,--jicunqi
		lod_IR,--ir
		load_A,load_B,--xuanzeqi
		cs,dl,xl,RAM_en,--RAM
		ra0,ra1,re,wa0,wa1,we,--regs
		shl,shr,shpass,ALU_en,--ALUyw
		lod_pc,LD_pc,pc_bus,--PC   lod_pc: jmc   LD_pc:+1
		M--ALU
		:out std_logic;
		s:out std_logic_vector(3 downto 0)		
		);
end CPU_IRyima;

architecture ALU_architecture of CPU_IRyima is
begin
	
	process(in_zl,t)		
	begin
	if t="000" then
		jmp<='0';
		load_sa<='0';
		load_sb<='0';
		load_mar<='0';
		lod_IR<='0';
		load_A<='0';
		load_B<='0';
		cs<='1';
		dl<='0';
		xl<='0';
		RAM_en<='0';
		ra0<='0';
		ra1<='0';
		re<='0';
		wa0<='0';
		wa1<='0';
		we<='0';
		shl<='0';
		shr<='0';
		shpass<='0';
		ALU_en<='0';
		lod_pc<='0';
		LD_pc<='0';
		pc_bus<='0';
		M<='0';
		s<="0000";
	else
		case t is
				when "001"=>
					pc_bus<='1';
					load_A<='1';
					load_mar<='1';
				when "010"=>	
					pc_bus<='0';
					load_A<='0';
					load_mar<='0';
					
					LD_pc<='1';
					cs<='0';
					dl<='1';
					RAM_en<='1';
					--lod_IR<='1';
				when "011"=>
					LD_pc<='0';
					cs<='1';
					dl<='0';
					RAM_en<='0';
					
					Lod_IR<='1';
				when others=>NULL;
		end case;
		case in_zl is
		when "00"=>
			case t is
				when "100"=>
					lod_IR<='0';
				
					re<='1';
					ra1<='0';
					ra0<='1';
				when "101"=>
					re<='0';
					
					load_sa<='1';
					s<="0011";
					M<='1';
					ALU_en<='1';
					shpass<='1';
				when "110"=>
					load_sa<='0';
					M<='0';
					ALU_en<='0';
					shpass<='0';	
					
					we<='1';
					wa0<='0';
					wa1<='0';
				when others	=>NULL;
					
				end case;	
			when "01"=>
			 	case t is
					when "100"=>
						lod_IR<='0';
						re<='1';
						ra0<='1';
						ra1<='0';
						load_A<='0';
						load_mar<='1';
					when "101"=>
						load_mar<='0';
						
						re<='1';
						ra0<='0';
						ra1<='1';
						
					when "110"=>
						load_sa<='1';
						s<="0011";
						M<='1';
						ALU_en<='1';
						shpass<='1';
						xl<='1';
						cs<='0';
					when others=>NULL;	
						
					end case;	
			when "10"=>
			 	case t is
					when "100"=>
						lod_IR<='0';
						re<='1';
						ra0<='0';
						ra1<='0';
						load_sa<='1';
					when "101"=>
						load_sa<='0';
						
						re<='1';
						ra0<='0';
						ra1<='1';
						load_B<='1';
						load_sb<='1';
					when "110"=>
						re<='0';
						load_B<='0';
						load_sb<='0';
						
						
						M<='1';
						s<="1001";
						shpass<='1';
						ALU_en<='1';
						we<='1';
						wa0<='0';
						wa1<='0';
					when others=>NULL;	
					end case;			
			when "11"=>
				case t is
					when "100"=>
						jmp<='1';
					when "101"=>
						jmp<='0';
						lod_pc<='1';
					when others=>NULL;
					end case;	
			when others=>NULL;		
		end case;
	end if;	
	end process;	
end ;	