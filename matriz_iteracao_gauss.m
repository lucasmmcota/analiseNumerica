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
## @deftypefn {} {@var{S} =} matriz_iteracao_gauss (@var{A})
## Objetivo: Achar a matriz iteração S da matriz de coeficientes A para o método de Gauss-Seidel
## Entrada:
##    A -> Matriz de coeficientes
## Saida:
##    S -> Matriz iteração de Gauss-Seidel
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-04

function S = matriz_iteracao_gauss (A)
  n = size(A, 1);
  D = zeros(n, n);
  E = triu(A);
  F = tril(A);
  for i = 1 : n
    for j = 1: n
      if i == j
        D(i, j) = A(i, j);
        E(i, j) = 0;
        F(i, j) = 0;
      endif
    endfor
  endfor
  S = -(D + E)^-1 * F;
  
endfunction
