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
## @deftypefn {} {@var{c} =} coeficientes_polinomio (@var{n}, @var{x}, @var{y})
## Objetivo: Calcular os coeficientes de polinômio interpolador
## Entrada:
##    n -> Grau máximo do polinômio
##    x -> Vetor de tamanho n + 1 com abscissas
##    y -> Vetor de tamanho n + 1 com ordenadas
## Saida:
##    c -> Coeficientes do polinômio na forma 
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-18

function c = coeficientes_polinomio (n, x, y)
  for i = 1 : n + 1
    c(i) = y(i);
  endfor
  for i = 1 : n
    for k = n + 1 : -1 : i + 1
      c(k) = (c(k) - c(k - 1)) / (x(k) - x(k - i));
    endfor
  endfor
  for i = n : -1 : 1
    for k = i : n
      c(k) = c(k) - c(k + 1) * x(i);
    endfor
  endfor

endfunction
