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
## @deftypefn {} {@var{Integral}, @var{info} =} newton_cotes (@var{a}, @var{b}, @var{n}, @var{m})
## Objetivo: Integrar uma função pela fórmula de Newton-Cotes
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    n -> Grau do polinômio
##    m -> Número de subintervalos
## Saida:
##    Integral -> Valor da Integral
##    info -> Informação sobre consistência
##            info = -1 -> n < 1 ou n > 10
##            info = -10 -> resto(m, n) ~= 0 ou m < 0
##            info = -11 -> ambas as condições ocorreram
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-28

function [Integral, info] = newton_cotes (a, b, n, m)
  Integral = 0;
  info = 0;
  % coeficientes de Cotes
  [d, c, info] = coeficientes_cotes(n);
  % consistência dos parâmetros
  if rem(m, n) ~= 0 || m < 0
    info = info - 10;
  endif
  if info ~= 0
    return;
  endif
  % cálculo da Integral
  h = (b - a) / m;
  j = 0;
  for i = 0 : m
    x = a + i * h;
    y = -x^2 + 5 * x; % avaliar a função integrando em x
    j = j + 1;
    k = c(j);
    if rem(i, n) == 0 && i ~= 0 && i ~= m
      k = k + k;
      j = 1;
    endif
    Integral = Integral + y * k;
  endfor
  Integral = n * h / d * Integral;
    
endfunction
