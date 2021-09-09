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
## @deftypefn {} {@var{A}, @var{Pivot}, @var{detA}, @var{info}, =} decomposicao_lu (@var{A})
## Objetivo: Fazer a decomposição LU de uma matriz
## Entrada:
##    A -> Matriz a ser decomposta
## Saida:
##    A -> Matriz decomposta (A = U + L - I)
##    Pivot -> Pivôs
##    detA -> Produto da diagonal de U (Determinante)
##    info -> Singularidade da matriz
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-03

function [A, Pivot, detA, info]  = decomposicao_lu(A)
  m = size(A, 1); % linha
  n = size(A, 2); % coluna
  for i = 1 : m
    Pivot(i) = i;
  endfor
  detA = 1;
  info = 0;
  for j = 1 : min(m,n) % escolha do pivô
    p = j;
    Amax = abs(A(j,j));
    for k = j + 1 : m
      if abs(A(k,j)) > Amax
        Amax = abs(A(k,j));
        p = k;
      endif
    endfor
    if p ~= j
      for k = 1 : n
        t = A(j,k);
        A(j,k) = A(p,k);
        A(p,k) = t;
      endfor
      i = Pivot(j);
      Pivot(j) = Pivot(p);
      Pivot(p) = i;
      detA = -detA;
    endif
    detA = detA * A(j,j);
    if abs(A(j,j)) ~= 0
      r = 1 / A(j,j);
      for i = j + 1 : m
        Mult = A(i,j) * r;
        A(i,j) = Mult;
        for k = j + 1 : n
          A(i,k) = A(i,k) - Mult * A(j,k);
        endfor
      endfor
    else
        if info == 0
          info = j;
        endif
    endif
  endfor
      
endfunction
