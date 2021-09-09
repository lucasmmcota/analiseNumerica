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
## @deftypefn {} {@var{VetX}, @var{VetY} =} runge_kutta_o4 (@var{a}, @var{b}, @var{y0}, @var{m})
## Objetivo: Resolver um PVI pelo método de Runge-Kutta de ordem 4
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

function [VetX, VetY] = runge_kutta_o4 (a, b, y0, m)
  h = (b - a) / m;
  xt = a;
  yt = y0;
  VetX(1) = xt;
  VetY(1) = yt;
  for i = 1 : m
    x = xt;
    y = yt;
    k1 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + h / 2;
    y = yt + h / 2 * k1;
    k2 = x - 2 * y + 1; % avaliar f(x, y)
    y = yt + h / 2 * k2;
    k3 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + h;
    y = yt + h * k3;
    k4 = x - 2 * y + 1; % avaliar f(x, y)
    xt = a + i * h;
    yt = yt + h / 6 * (k1 + 2 * (k2 + k3) + k4);
    VetX(i + 1) = xt;
    VetY(i + 1) = yt;
  endfor
    
endfunction
