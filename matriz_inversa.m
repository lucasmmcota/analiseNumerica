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
## @deftypefn {} {@var{A}, @var{info} =} matriz_inversa (@var{A})
## Objetivo: Inverter uma matriz se for possível
## Entrada:
##    A -> Matriz que vai ser invertida.
## Saida:
##    A -> Matriz invertida, se ela for quadrada.
##    info -> 0 - possui inversa / 1 - não possui inversa
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-04

function [A, info] = matriz_inversa (A)
  info = 0;
  if size(A,1) ~= size(A,2)
    printf("A matriz não é quadrada !");
    info = 1;
    return;
  endif
  n = size(A, 1);
  identidade = eye(n);
  aux_A = zeros(size(A));
  [A, Pivot, PdU, Info] = decomposicao_lu(A);
  if info ~= 0
    printf("O sistema não possui solução");
    A = [];
    return;
  endif

endfunction
