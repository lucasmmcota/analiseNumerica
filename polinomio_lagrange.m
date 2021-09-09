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
## @deftypefn {} {@var{Pz} =} polinomio_lagrange (@var{m}, @var{x}, @var{y}, @var{z})
## Objetivo: Interpolar valor usando o polinômio de Lagrange.
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

function Pz = polinomio_lagrange (m, x, y, z)
  Pz = 0;
  for i = 1 : m
    c = 1;
    d = 1;
    for j = 1 : m
      if i ~= j
        c = c * (z - x(j));
        d = d * (x(i) - x(j));
      endif
    endfor
    Pz = Pz + y(i) * c / d;
  endfor
  
endfunction
