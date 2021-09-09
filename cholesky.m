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
## @deftypefn {} {@var{A}, @var{detA}, @var{info} =} cholesky (@var{A})
## Objetivo: Fazer a decomposição LL^t de uma matriz A simétrica e definida positiva
## Entrada:
##    n -> Ordem da matriz
##    A -> Matriz a ser decomposta
## Saida:
##    L -> Fator L escrito sobre A
##    detA -> Determinante
##    info -> Igual a zero -> Matriz definida positiva    
##
## @seealso{}
## @end deftypefn
## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-03

function [L, detA, info] = cholesky (A)
  n = size(A,1);
  detA = 1;
  info = 0;
  for j = 1 : n
    Soma = 0;
    for k = 1 : j - 1
      Soma = Soma + A(j,k) * A(j,k);
    endfor
    t = A(j,j) - Soma;
    if t > 0
      A(j,j) = sqrt(t);
      r = 1 / A(j,j);
      detA = detA * t;
      else
        info = j;
        disp("O sistema linear não pode ser resolvido por este método !\n");
        return;
    endif
    for i = j + 1 : n
      Soma = 0;
      for k = 1 : j - 1
        Soma = Soma + A(i,k) * A(j,k);
      endfor
      A(i,j) = (A(i,j) - Soma) * r;
    endfor
  endfor
  L = tril(A);

endfunction
