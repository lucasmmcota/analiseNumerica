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
## @deftypefn {} {@var{x}} =} LU (@var{A}, @var{b})
## Objetivo: Achar a solu��o de uma matriz que sofreu decomposi��o LU
## Entrada:
##    A -> Matriz a ser decomposta
##    b -> Vetor de termos independentes
## Saida:
##    x -> Vetor solu��o do sistema

## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-03

function x = LU (A, b)
  [A, pivos, detA, info] = decomposicao_lu(A)
  U = triu(A);
  L = eye(size(A)) + tril(A, -1);
  P = eye(size(A));
  P = P(pivos,:);
  b = P * b;
  n = size(A, 1);
  y = substituicoes_sucessivas(L, b);
  x = substituicoes_retroativas(U, y);

endfunction
