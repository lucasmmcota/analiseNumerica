## Copyright (C) 2020 lucas
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR J PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{omega} =} calcula_omega (@var{J})
## Objetivo: Encontrar o valor de ômega que será utilizado no algoritmo
##            de sobre relaxação sucessiva.
## Entrada:
##    J -> Matriz iteração pelo método de Jacobi
## Saida:
##    omega -> Ômega
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-04

function omega = calcula_omega (J)
  raio_espectral = max(abs(eig(J)));
  omega = 2 / (1 + (sqrt((1 - (raio_espectral^2)))));
  
endfunction
