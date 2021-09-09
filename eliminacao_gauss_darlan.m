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
## @deftypefn {} {@var{A}, @var{b} =} eliminacao_gauss_darlan (@var{A}, @var{b}, @var{n})
## Objetivo: Fazer a eliminação de Gauss do sistema Ax = b
## Entrada:
##     A -> Matriz dos coeficientes
##     b -> Vetor de termos independentes
##     n -> Ordem da matriz
## Saida:
##     A -> Matriz dos coeficientes escalonadas
##     b -> Vetor de termos independentes ajustados
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-01

function [A, b] = eliminacao_gauss_darlan (A, b, n)
  for j = 1 : n
    for i = j + 1 : n
      m(i,j) = A(i,j)/A(j,j);
      for k = 1 : n
        A(i,k) = -m(i,j) * A(j,k) + A(i,k);
      endfor
      b(i) = -m(i,j) * b(j) + b(i);
    endfor
  endfor
endfunction
