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
## @deftypefn {} {@var{Raiz}, @var{Zero}, @var{iter}, @var{info} =} pegaso_rm (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz múltipla de equação pelo método de pégaso
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saida:
##    Raiz -> Raiz
##    Zero -> f(raiz)
##    iter -> Número gasto de iterações
##    info -> Informação sobre convergência
##            info = 0 -> raiz convergiu com sucesso
##            info = 1 -> raiz não convergiu com parâmetros dados
##            info = 2 -> derivada se anula
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-14

function [Raiz, Zero, iter, info] = pegaso_rm (a, b, tolerancia, iter_max)
  Epsilon = precisao_maquina;
  Fa = a^4 + 2 * a^3 - 12 * a^2 + 14 * a - 5; % avaliar a função em a
  DFa = 4 * a^3 + 6 * a^2 - 24 * a + 14; % avaliar a derivada da função em a
  Fb = b^4 + 2 * b^3 - 12 * b^2 + 14 * b - 5; % avaliar a função em b
  DFb = 4 * b^3 + 6 * b^2 - 24 * b + 14; % avaliar a derivada da função em b
  if (DFa) < Epsilon || abs(DFb) < Epsilon
    info = 2;
    return;
  endif
  Ga = Fa / DFa;
  Gb = Fb / DFb;
  Gx = 1 + tolerancia;
  iter = 0;
  while (true)
    deltax = Gb * (b - a) / (Gb - Ga);
    x = b - deltax;
    Fx = x^4 + 2 * x^3 - 12 * x^2 + 14 * x - 5; % avaliar a função em x
    DFx = 4 * x^3 + 6 * x^2 - 24 * x + 14; % avaliar a derivada da função em x
    if (abs(deltax) <= tolerancia && abs(Gx) <= tolerancia) || abs(DFx) < Epsilon || iter >= iter_max
      break;
    endif
    Gx = Fx / DFx;
    % atribuição dos novos pontos base
    if Gb * Gx < 0
      a = b;
      Ga = Gb;
    else
      Ga = Ga * Gb / (Gb + Gx); % a abscissa 'a' se mantém inalterada
    endif
    b = x;
    Gb = Gx;
    iter = iter + 1;
  endwhile
  Raiz = x;
  Zero = Raiz^4 + 2 * Raiz^3 - 12 * Raiz^2 + 14 * Raiz - 5; % avaliar a função em Raiz
  % teste de convergência
  if abs(deltax) <= tolerancia && abs(Gx) <= tolerancia
    info = 0;
  else
    if abs(DFx) >= Epsilon
      info = 1;
    else
      info = 2;
    endif
  endif
  

endfunction
