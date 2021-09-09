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
## @deftypefn {} { =} distancia_entre_dois_pontos (@var{x}, @var{y})
## Objetivo: Calcular a distância entre dois pontos
## Entrada:
##    x -> Vetor de ordenadas
##    y -> Vetor de abscissas
## Saida:
##    Nenhuma
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-21

function distancia_entre_dois_pontos (x, y)
  m = size(x);
  n = m(2);
  for i = 1 : n
    for j = 1 : n
      if (i ~= j) && (i < j)
        distancia = sqrt((x(j) - x(i))^2 + (y(j) - y(i))^2);
        printf("\nDistância entre (%d, %d) e (%d, %d): %d ", x(i), y(i), x(j), y(j), distancia);
      endif
    endfor
  endfor

endfunction
