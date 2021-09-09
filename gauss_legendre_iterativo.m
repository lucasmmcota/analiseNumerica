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
## @deftypefn {} {@var{Integral}, @var{delta}, @var{iter}, @var{info} =} gauss_legendre (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Integrar uma função pela quadratura de Gauss-Legendre
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saida:
##    Integral -> Valor da integral
##    delta -> Menor diferença relativa obtida
##    iter -> Número de iterações
##    info -> Informação sobre consistência e convergência
##            info = 0 -> delta <= tolerancia
##            info = 1 -> delta > tolerancia
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-30

function [Integral, delta, iter, info] = gauss_legendre_iterativo (a, b, tolerancia, iter_max)
  iter = 1;
  n1 = 5;
  n2 = 8;
  [Int, info] = gauss_legendre(a, b, n2);
  while (true)
    iter = iter + 1;
    n = n1 + n2;
    [Integral, info] = gauss_legendre(a, b, n);
    if Integral ~= 0
      delta = abs((Integral - Int) / Integral);
    else
      delta = abs(Integral - Int);
    endif
    if delta <= tolerancia || iter == iter_max
      break;
    endif
    Int = Integral;
    n1 = n2;
    n2 = n;
  endwhile
  % teste de convergência
  if delta <= tolerancia
    info = 0;
  else
    info = 1;
  endif
  
endfunction
