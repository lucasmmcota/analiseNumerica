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

## @deftypefn {} {@var{Integral}, @var{info} =} regra_simpson_tres_oitavos (@var{a}, @var{b}, @var{n})
## Objetivo: Calcular a integral utilizando a regra 3/8 de Simpson
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    n -> Número de subintervalos
## Saída:
##    Integral -> Valor da integral
##    info -> Informação
##            info = 0 -> não houve erros
##            info = -1 -> números de subintervalos inválido;
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Integral, info] = regra_simpson_tres_oitavos (a, b, n)
  if n <= 0
    info = -1;
    return;
  endif
  info = 0;
  if rem(n, 3) ~= 0
    n = 3 * ((n / 3) + 1);
  endif
  h = (b - a) / n;
  x = a + h;
  SomaMultiplos3 = 0;
  SomaNaoMultiplos3 = 0;
  for i = 1 : n - 1
    fxy = 1 / x; % avaliar a função em f(x, y);
    if rem(i, 3) == 0
      SomaMultiplos3 = SomaMultiplos3 + fxy;
    else
      SomaNaoMultiplos3 = SomaNaoMultiplos3 + fxy;
    endif
    x = x + h;
  endfor
  fxa = 1 / a; % função no ponto x(a)
  fxb = 1 / b; % função no ponto x(b)
  Integral = 3 / 8 * h * (fxa + fxb + 3 * SomaNaoMultiplos3 + 2 * SomaMultiplos3);
   
endfunction
