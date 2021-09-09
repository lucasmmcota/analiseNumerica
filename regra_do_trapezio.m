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
## @deftypefn {} {@var{Integral}, @var{info} =} regra_do_trapezio (@var{a}, @var{b}, @var{n})
## Objetivo: Calcular a integral utilizando a regra do trap�zio
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    n -> N�mero de subintervalos
## Sa�da:
##    Integral -> Valor da integral
##    info -> Informa��o
##            info = 0 -> n�o houve erros
##            info = -1 -> n�meros de subintervalos inv�lido;
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Integral, info] = regra_do_trapezio (a, b, n)
  if n <= 0
    info = -1;
    return;
  endif
  info = 0;
  h = (b - a) / n;
  x = a + h;
  soma = 0;
  for i = 1 : n - 1
    fxy = 1 / x; % avaliar a fun��o em f(x, y);
    soma = soma + fxy;
  endfor
  fxa = 1 / a; % fun��o no ponto x(a)
  fxb = 1 / b; % fun��o no ponto x(b)
  Integral = h * ((fxa + fxb) / 2 + soma);
endfunction
