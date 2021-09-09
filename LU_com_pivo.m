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
## @deftypefn {} {@var{x}, @var{erro}, @var{detA}=} LU_com_pivo (@var{A}, @var{b})
## Objetivo: Achar a solução de uma matriz que sofreu decomposição LU
## Entrada:
##    A -> Matriz a ser decomposta
##    b -> Vetor de termos independentes
## Saida:
##    x -> Vetor solução do sistema
##    erro -> Erro absoluto
##    PdU -> Determinante da Matriz A
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-11

function [x, erro, PdU] = LU_com_pivo (A, b)
  [A, Pivot, PdU, Info] = decomposicao_lu(A);
  if Info ~= 0
    printf("\nNão foi possível decompor a matriz usando este método !\n");
    return;
  endif
  U = triu(A);
  L = eye(size(A)) + tril(A, -1);
  P = eye(size(A));
  P = P(Pivot,:);
  b = P * b;
  n = size(A, 1);
  y = substituicoes_sucessivas_com_pivo(L, b, Pivot);
  x = substituicoes_retroativas(U, y);
  erro = norm(x(:,1) - x(:,2)) / norm(x(:,1));
endfunction
