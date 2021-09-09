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
## @deftypefn {} {@var{Integral}, @var{info} =} gauss_legendre (@var{a}, @var{b}, @var{n})
## Objetivo: Integrar uma função pela quadratura de Gauss-Legendre
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    n -> Número de pontos (n >= 1)
## Saida:
##    Integral -> Valor da integral
##    info -> Informação sobre consistência e convergência
##            info = -1 -> n < 1
##            info = 0 -> sem erro
##            info = k -> 'k' zeros não convergiram
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-28

function [Integral, info] = gauss_legendre (a, b, n)
  % cálculo das abscissas e pesos
  [T, W, info] = gauss_legendre_AbsPes (n);
  if info ~= 0 % n < 1 ou zeros não convergiram
    return;
  endif
  % cálculo da integral
  Integral = 0;
  info = 0;
  ba2 = (b - a) / 2;
  for i = 1 : n
    x = a + ba2 * (T(i) + 1);
    y = x * sin(15 * x); % avaliar a função integrando em x
    Integral = Integral + y * W(i);
  endfor
  Integral = ba2 * Integral;
  
endfunction
