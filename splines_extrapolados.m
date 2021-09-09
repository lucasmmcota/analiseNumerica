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
## @deftypefn {} {@var{s2}, @var{info} =} splines_naturais (@var{n}, @var{x}, @var{y})
## Objetivo: Calcular as derivadas segundas dos splines cúbicos extrapolados
## Entrada:
##    n -> Número de pontos
##    x -> Vetor de abscissas em ordem crescente
##    y -> Vetor de ordenadas
## Saida:
##    s2 -> Derivadas segundas
##    info -> info = 0 -> Não houve erro
##            info = -1 -> Número de pontos n < 4
##            info = -2 -> Abscissas não estão em ordem crescente
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-18

function [s2, info] = splines_extrapolados (n, x, y)
  if n < 4
    info = -1;
    return;
  endif
  ordenado = true;
  for i = 2 : n
    ordenado = ordenado && x(i - 1) < x(i);
  endfor
  if ordenado == false
    info = -2;
    return;
  endif
  info = 0;
  m = n - 2;
  Ha = x(2) - x(1);
  Deltaa = (y(2) - y(1)) / Ha;
  Hb = x(3) - x(2);
  Deltab = (y(3) - y(2)) / Hb;
  d(1) = (Ha + Hb) * (Ha + 2 * Hb) / Hb;
  c(2) = Hb - Ha^2 / Hb;
  s2(2) = 6 * (Deltab - Deltaa);
  for i = 2 : m - 1
    ip1 = i + 1;
    ip2 = i + 2;
    Ha = Hb;
    Deltaa = Deltab;
    Hb = x(ip2) - x(ip1);
    Deltab = (y(ip2) - y(ip1)) / Hb;
    d(i) = 2 * (Ha + Hb);
    e(i - 1) = Ha;
    c(ip1) = Hb;
    s2(ip1) = 6 * (Deltab - Deltaa);
  endfor
  Ha = Hb;
  Deltaa = Deltab;
  Hb = x(n) - x(n - 1);
  Deltab = (y(n) - y(n - 1)) / Hb;
  d(m) = (Ha + Hb) * (Hb + 2 * Ha) / Ha;
  e(m - 1) = Ha - Hb^2 / Ha;
  s2(m + 1) = 6 * (Deltab - Deltaa);
  for i = 2 : m
    ip1 = i + 1;
    im1 = i - 1;
    t = e(im1) / d(im1);
    d(i) = d(i) - t * c(i);
    s2(ip1) = s2(ip1) - t * s2(i);
  endfor
  s2(m + 1) = s2(m + 1) / d(m);
  for i = m : -1 : 2
    s2(i) = (s2(i) - c(i) * s2(i + 1)) / d(i - 1);
  endfor
  Ha = x(2) - x(1);
  Hb = x(3) - x(2);
  s2(1) = ((Ha + Hb) * s2(2) - Ha * s2(3)) / Hb;
  Ha = x(n - 1) - x(n - 2);
  Hb = x(n) - x(n - 1);
  s2(n) = ((Ha + Hb) * s2(n - 1) - Hb * s2(n - 2)) / Ha;

endfunction
