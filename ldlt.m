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
## @deftypefn {} {@var{x} =} teste (@var{A}, @var{b})
## Entrada:
##    A -> Matriz de termos independentes
##    b -> Vetor de termos independentes
## Saida:
##    x -> Vetor solução do sistema
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-04

function x = ldlt(A, b)
  n = length(A);
  v = zeros(n, 1);
  for j = 1 : n
    for i = 1 : j - 1
      v(i) = A(j, i) * A(i, i);
    endfor
    A(j, j) = A(j, j) - A(j, 1 : j - 1) * v(1 : j - 1);
    A(j+1 : n, j) = (A(j+1 : n, j) - A(j+1 : n, 1 : j-1) * v(1 : j-1)) / A(j, j);
  endfor
  L = tril(A, -1) + eye(n);
  D = diag(diag(A));
  y = substituicoes_sucessivas(L * D, b);
  x = substituicoes_retroativas(L', y);
 
endfunction
