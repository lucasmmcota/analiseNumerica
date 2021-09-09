## Copyright (C) 2020 lucas
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{Den}, @var{VetC}, @var{info} =} coeficientes_cotes (@var{n})
## Objetivo: Fornecer os parâmetros da fórmula de Newton-Cotes
## Entrada:
##    n -> Grau do polinômio usado na integração
## Saida:
##    Den -> Denominador da forma geral
##    VetC -> Vetor com os coeficientes de Cotes
##    info -> Informação sobre consistência
##            info = 0 -> 1 <= n <= 10
##            info = -1 -> n < 1 ou n > 10
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-28

function [Den, VetC, info] = coeficientes_cotes (n)
  %consistência do parâmetro de entrada
  if n < 1 || n > 10
    info = -1;
    return;
  endif
  % denominadores da forma geral
  d(1) = 2; d(2) = 6; d(3) = 8; d(4) = 90; d(5) = 288;
  d(6) = 840; d(7) = 17280; d(8) = 28350; d(9) = 89600;
  d(10) = 598752;
  % coeficientes de Cotes simétricos
  c(1) = 1; c(2) = 1; c(3) = 4; c(4) = 1; c(5) = 3;
  c(6) = 7; c(7) = 32; c(8) = 12; c(9) = 19; c(10) = 75;
  c(11) = 50; c(12) = 41; c(13) = 216; c(14) = 27; c(15) = 272;
  c(16) = 751; c(17) = 3577; c(18) = 1323; c(19) = 2989; c(20) = 989;
  c(21) = 5888; c(22) = -928; c(23) = 10496; c(24) = -4540; c(25) = 2857;
  c(26) = 15741; c(27) = 1080; c(28) = 19344; c(29) = 5778; c(30) = 16067;
  c(31) = 106300; c(32) = -48525; c(33) = 272400; c(34) = -260550; c(35) = 427368;
  info = 0;
  Den = d(n);
  p = fix(n * (n + 2) / 4 + rem(n, 2)); % indica início dos coeficientes da fórmula
  n12 = fix((n + 1) / 2) - 1;
  for i = 0 : n12
    VetC(i + 1) = c(p + i);
    VetC(n + 1 - i) = c(p + i);
  endfor
  if rem(n, 2) == 0
    VetC(n / 2 + 1) = c(p + n / 2);
  endif
  
endfunction
