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
## @deftypefn {} {@var{x} =} substituicoes_sucessivas_com_pivo (@var{A}, @var{b}, @var{Pivot})
## Objetivo: Achar a solução do sistema triangular inferior usando as linhas pivotais
## Entrada:
##    A -> Matriz triangular inferior
##    b -> Vetor de termos independentes
##    Pivot -> Linhas pivotais
## Saida:
##    x -> Solução do sistema triangular inferior
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-11

function x = substituicoes_sucessivas_com_pivo (A, b, Pivot)
  n = size(A,1);
  k = Pivot(1);
  x(1) = b(k);
  for i = 2 : n
    soma = 0;
    for j = 1 : i - 1
      soma = soma + A(i,j) * x(j);
    endfor
    k = Pivot(i);
    x(i) = b(k) - soma;
  endfor
  
endfunction
