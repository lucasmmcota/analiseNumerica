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
## @deftypefn {} {@var{VetX}, @var{VetY}, @var{erro} =} adams_abm_o4 (@var{a}, @var{b}, @var{y0}, @var{m})
## Objetivo: Resolver um PVI pelo método incorporado de Adams-Bashforth-Moulton de ordem 4
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    y0 -> Valor inicial
##    m -> Número de subintervalos
## Saída:
##    VetX -> Abscissas
##    VetY -> Solução do PVI
##    erro -> Erros
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function [VetX, VetY, erro] = adams_abm_o4 (a, b, y0, m)
  nc = 3;
  h = (b - a) / m;
  % método de Dormand-Prince para cacular y1, y2, y3
  [VetX, VetY, DifY] = dormand_prince (a, a + 3 * h, y0, 3);
  % cálculo de f0, f1, f2 e f3
  x = VetX(1);
  y = VetY(1);
  f0 = x - 2 * y + 1; % avaliar f(x0, y0)
  
  x = VetX(2);
  y = VetY(2);
  f1 = x - 2 * y + 1; % avaliar f(x1, y1) 
  
  x = VetX(3);
  y = VetY(3);
  f2 = x - 2 * y + 1; % avaliar f(x2, y2)
  
  x = VetX(4);
  y = VetY(4);
  f3 = x - 2 * y + 1; % avaliar f(x3, y3)

  for i = 4 : m
    x = a + i * h;
    VetX(i + 1) = x;
    Ypre = VetY(i) + h * (55 * f3 - 59 * f2 + 37 * f1 - 9 * f0) / 24;
    y = Ypre;
    f4 = x - 2 * y + 1; % avaliar f(xi, yi)
    % cálculo das nc correções
    for j = 1 : nc
      Ycor = VetY(i) + h * (9 * f4 + 19 * f3 - 5 * f2 + f1) / 24;
      y = Ycor;
      f4 = x - 2 * y + 1; % avaliar f(xi, yi)
    endfor
    VetY(i + 1) = Ycor;
    erro(i + 1) = abs(Ycor - Ypre) * 19 / 270;
    f0 = f1;
    f1 = f2;
    f2 = f3;
    f3 = f4;
  endfor
  
endfunction
