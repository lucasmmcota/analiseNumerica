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
## @deftypefn {} {@var{Pz} =} polinomio_newton (@var{m}, @var{x}, @var{y}, @var{z})
## Objetivo: Interpolar valor usando o polinômio de Newton.
## Entrada:
##    m -> Números de pontos
##    x -> Vetor de abscissas
##    y -> Vetor de ordenadas
##    z -> Valor a interpolar
## Saida:
##    Pz -> Valor interpolado
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-18

function Pz = polinomio_newton (m, x, y, z)
  for i = 1 : m
    Dely(i) = y(i);
  endfor
  for i = 1 : m - 1
    for k = m : -1 : i + 1
      Dely(k) = (Dely(k) - Dely(k - 1)) / (x(k) - x(k - i));
    endfor
  endfor
  Pz = Dely(m);
  for i = m - 1 : -1 : 1
    Pz = Pz * (z - x(i)) + Dely(i)
  endfor

endfunction
