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
## @deftypefn {} {@var{VetX}, @var{VetY} =} euler (@var{a}, @var{b}, @var{y0}, @var{m})
## Objetivo: Resolver um PVI pelo método de Euler
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    y0 -> Valor inicial
##    m -> Número de subintervalos
## Saída:
##    VetX -> Abscissas
##    VetY -> Solução do PVI
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function [VetX, VetY] = euler (a, b, y0, m)
  h = (b - a) / m;
  x = a;
  y = y0;
  VetX(1) = x;
  VetY(1) = y;
  fxy = x - 2 * y + 1 % avaliar f(x, y) em x = x0 e y = y0
  for i = 1 : m
    x = a + i * h;
    y = y + h * fxy;
    fxy = x - 2 * y + 1 % avaliar f(x, y) em x = xi e y = yi
    VetX(i + 1) = x;
    VetY(i + 1) = y;
  endfor
  
endfunction
