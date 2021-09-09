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
## @deftypefn {} {@var{T}, @var{W}, @var{info} =} gauss_legendre_AbsPes (@var{n})
## Objetivo: Calcular abscissas e pesos para a quadratura de Gauss-Legendre
## Entrada:
##    n -> Número de pontos (n >= 1)
## Saida:
##    T -> Abscissas
##         T(1) -> menor que zero
##         T(n) -> maior que zero
##    W -> Pesos
##    info -> Informação sobre consistência e convergência
##            info = 0 -> n >= 0 e todos os zeros convergiram
##            info = k -> 'k' zeros não convergiram
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-28

function [T, W, info] = gauss_legendre_AbsPes (n)
  if n < 1
    info = -1;
    return;
  endif
  toler = 10^-15;
  iter_max = 30;
  info = 0;
  m = fix(n / 2);
  pi8 = 3.141592653589793;
  % os zeros são simétricos, calculam-se apenas os positivos
  for i = 1 : m
    z = cos((i - 0.25) / (n + 0.5) * pi8);
    delta = 1 + toler;
    iter = 0;
    while (true)
      p1 = 1;
      Pz = z;
      for k = 2 : n
        p0 = p1;
        p1 = Pz;
        Pz = ((2 * k - 1) * z * p1 - (k - 1) * p0) / k;
      endfor
      DPz = n * (p1 - z * Pz) / (1 - z^2);
      if abs(delta) <= toler || iter == iter_max
         break;
      endif
      delta = Pz / DPz;
      z = z - delta;
      iter = iter + 1;
    endwhile
    if abs(delta) <= toler
      % abscissas
      T(i) = -z;
      T(n + 1 - i) = z;
      % pesos
      W(i) = 2 / ((1 - z^2) * DPz^2);
      W(n + 1 - i) = W(i);
    else
      T(i) = 0;
      T(n + 1 - i) = 0;
      W(i) = 0;
      W(n + 1 - i) = 0;
      info = info + 1;
    endif
  endfor
  % o zero central do polinômio de Legendre de grau ímpar é nulo
  if rem(n, 2) ~= 0
    T(m + 1) = 0;
    W(m + 1) = pi8 / 2 * e * (gammaln((n + 1) / 2) - gammaln(n / 2 + 1))^2;
  endif
  
endfunction
