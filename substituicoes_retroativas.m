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
## @deftypefn {} {@var{x} =} substituicoes_retroativas (@var{A}, @var{b})
## Objetivo: Resolver um sistema triangular superior
## Entrada:
##    A -> Matriz triangular superior
##    b -> Vetor de termos independentes
## Saida:
##    x -> Solução do sistema triangular superior
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-01

function x = substituicoes_retroativas (A, b)
  n = size(A,1);
  x(n) = b(n) / A(n,n);
  for i = n - 1 : -1 : 1
    soma = 0;
    for j = i + 1 : n
       soma = soma + A(i,j) * x(j);
    endfor
    x(i) = (b(i) - soma) / A(i,i);
  endfor
  
endfunction
