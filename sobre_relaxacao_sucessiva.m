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
## @deftypefn {} {@var{x}, @var{i}, @var{info} =} sobre_relaxacao_sucessiva (@var{A}, @var{b}, @var{x_0}, @var{omega}, @var{tol}, @var{iter_max})
## Objetivo: Achar a solução do sistema linear pelo método de sobre relaxação sucessiva
## Entrada:
##    A -> Matriz dos coeficientes
##    b -> Vetor de termos independentes
##    x_0 -> Valor inicial
##    omega -> Constante que vai ajudar no cálculo
##    tol -> Tolerância
##    iter_max -> Número máximo de iterações
## Saída:
##    x -> Vetor solução
##    i -> Número de iterações
##    info -> 0: convergiu / 1: não convergiu
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-09

function [x, i, info] = sobre_relaxacao_sucessiva(A, b, x_0, omega, tol, iter_max)
  n = size(A, 1);
  x = zeros(n, 1);
  D = diag(diag(A));
  L = -tril(A, -1);
  U = -triu(A, 1);
  a = (D - omega * L);
  for i = 1 : iter_max
    x = a \ (((1 - omega) * D + omega * U)* x_0) + omega *(a \ b);
    if norm(x - x_0) <= tol
      break;
    endif
    x_0 = x;
  endfor
  if norm(x - x_0) <= tol && i < 100
    info = 0;
    else
      info = 1;
  endif
endfunction

