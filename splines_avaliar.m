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
## @deftypefn {} {@var{sz}, @var{info} =} splines_avaliar (@var{n}, @var{x}, @var{y}, @var{m}, @var{z}, @var{ts})
## Objetivo: Avaliar os splines cúbicos naturais e extrapolados
## Entrada:
##    n -> Número de pontos
##    x -> Vetor de abscissas em ordem crescente
##    y -> Vetor de ordenadas
##    m -> Número de pontos a interpolar
##    z -> Valores a interpolar
##    ts -> Tipos de splines
## Saida:
##    sz -> Valores interpolados
##    info -> info = 0 -> Sem erro
##            info = -1 -> Número de pontos n < 3 ou n < 4 (depende do spline)
##            info = -2 -> Abscissas não estão em ordem crescente
##            info > 0 -> Número de tentativas de extrapolação
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-18

function [sz, info] = splines_avaliar (n, x, y, m, z, ts)
  if ts == 0
    [s2, info] = splines_naturais(n, x, y);
  else
    [s2, info] = splines_extrapolados(n, x, y);
  endif
  if info < 0
    return;
  endif
  info = 0;
  for j = 1 : m
    if z(j) >= x(1) && z(j) <= x(n)
      inf = 1;
      sup = n;
      while true
        if sup - inf <= 1
          break;
        endif
        ind = fix((inf + sup) / 2);
        if x(ind) > z(j)
          sup = ind;
        else
          inf = ind;
        endif
      endwhile
      h = x(sup) - x(inf);
      a = (s2(sup) - s2(inf)) / (6 * h);
      b = s2(inf) / 2;
      c = (y(sup) - y(inf)) / h - (s2(sup) + 2 * s2(inf)) * h / 6;
      d = y(inf);
      h = z(j) - x(inf);
      sz(j) = ((a * h + b) * h + c) * h + d;
    else
      sz(j) = 0;
      info = info + 1;
    endif
  endfor
          
endfunction
