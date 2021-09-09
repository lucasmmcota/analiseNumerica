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
## @deftypefn {} {@var{A}, @var{erro}, @var{detA} =} cholesky_v2 (@var{A}, @var{b})
## Objetivo: Fazer a decomposição LL^t de uma matriz A simétrica e definida positiva
## Entrada:
##    A -> Matriz de termos independentes
##    b -> Vetor de termos independentes
## Saida:
##    x -> Vetor solução do sistema
##    erro -> Erro absoluto do sistema
##    detA -> Determinante da matriz A
##   
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-03

function [x, erro, detA] = cholesky_v2 (A, b)
  n = size(A, 1);
  detA = 1;
  %info = 0;
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
        x = 0;
        erro = 0;
        %info = j
        disp("\nMatriz não é definida positiva !\n");
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
  y = substituicoes_sucessivas(L, b);
  x = substituicoes_retroativas(L', y);
  erro = norm(x(:,1) - x(:,2)) / norm(x(:,1));

endfunction
