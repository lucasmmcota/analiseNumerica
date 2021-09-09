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
## You should have received x copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{x}=} substituicoes_sucessivas (@var{A}, @var{b})
## Objetivo: Achar a solução do sistema triangular inferior
## Entrada:
##    A -> Matriz triangular inferior
##    b -> Vetor independente
## Saída:
##    x -> Solução do sistema triangular inferior
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-08-28

function x = substituicoes_sucessivas (A, b)
  n = size(A, 1);
  x(1) = b(1) / A(1, 1);
  for i = 2 : n
    soma = 0;
    for j = 1 : i - 1
      soma = soma + A(i, j) * x(j);
    endfor
    x(i) = (b(i) - soma) / A(i, i);
  endfor
   
endfunction
