-- 
-- LinearTable.vhd 
--
-- Copyright (c) 2006 Mitsutaka Okazaki (brezza@pokipoki.org)
-- All rights reserved.
-- 
-- Redistribution and use of this source code or any derivative works, are 
-- permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, 
--    this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above copyright 
--    notice, this list of conditions and the following disclaimer in the 
--    documentation and/or other materials provided with the distribution.
-- 3. Redistributions may not be sold, nor may they be used in a commercial 
--    product or activity without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED 
-- TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
-- OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
-- WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
-- OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use WORK.VM2413.ALL;

entity LinearTable is port ( 
  clk    : in std_logic;
  reset  : in std_logic;    
  addr   : in  SIGNED_DB_TYPE;
  data   : out SIGNED_LI_TYPE
);
end LinearTable;

architecture RTL of LinearTable is

  constant TABLE_WIDTH : integer := 2 ** (DB_TYPE'high+1);
  type LOG2LIN_TYPE is array (0 to TABLE_WIDTH-1) of LI_TYPE;
  
  constant log2lin_data : LOG2LIN_TYPE := (
"111111111","111101001","111010100","111000000",
"110101101","110011011","110001010","101111001",
"101101001","101011010","101001011","100111101",
"100110000","100100011","100010111","100001011",
"100000000","011110101","011101010","011100000",
"011010111","011001110","011000101","010111101",
"010110101","010101101","010100110","010011111",
"010011000","010010010","010001011","010000110",
"010000000","001111010","001110101","001110000",
"001101011","001100111","001100011","001011110",
"001011010","001010111","001010011","001001111",
"001001100","001001001","001000110","001000011",
"001000000","000111101","000111011","000111000",
"000110110","000110011","000110001","000101111",
"000101101","000101011","000101001","000101000",
"000100110","000100100","000100011","000100001",
"000100000","000011110","000011101","000011100",
"000011011","000011001","000011000","000010111",
"000010110","000010101","000010100","000010100",
"000010011","000010010","000010001","000010000",
"000010000","000001111","000001110","000001110",
"000001101","000001101","000001100","000001011",
"000001011","000001010","000001010","000001010",
"000001001","000001001","000001000","000001000",
"000001000","000000111","000000111","000000111",
"000000110","000000110","000000110","000000101",
"000000101","000000101","000000101","000000101",
"000000100","000000100","000000100","000000100",
"000000100","000000011","000000011","000000011",
"000000011","000000011","000000011","000000011",
"000000010","000000010","000000010","000000010",
"000000010","000000010","000000010","000000000"
);
begin

  process (clk)
  begin  
    if clk'event and clk = '1' then    
      data <= ( sign=>addr.sign, value=>log2lin_data(CONV_INTEGER(addr.value)) );      
    end if;        
  end process;

end RTL;
