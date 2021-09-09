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
## @deftypefn {} {@var{y} =} horner (@var{c}, @var{a})
## Objetivo: Avaliar horner polinômio de grau n na abscissa a
## Entrada:
##    c -> Vetor de coeficientes
##    a -> Abscissa onde será avaliado
## Saída:
##    y -> Ordenada P(a)
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function y = horner (c, a)
  n = length(c);
  y = c(1);
  for i = 2 : n
    y = y * a + c(i);
  endfor
  
endfunction
