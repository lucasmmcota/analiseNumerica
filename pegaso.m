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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info}  =} pegaso (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz de equação pelo método pegaso
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saída:
##    Raiz -> Raiz
##    iter -> Número gasto de iterações
##    info -> Informação sobre consistência e convergência
##            info = 0 -> raiz calculada com sucesso
##            info = 1 -> raiz não convergiu com parâmetros dados
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Raiz, iter, info] = pegaso (a, b, tolerancia, iter_max)
  Fa = a^4 + 2 * a^3 - 12 * a^2 + 14 * a - 5; % avaliar função em a
  Fb = b^4 + 2 * b^3 - 12 * b^2 + 14 * b - 5; % avaliar função em b
  iter = 0;
  while (true)
    deltax = Fb * (b - a) / (Fb - Fa);
    x = b - deltax;
    Fx = x^4 + 2 * x^3 - 12 * x^2 + 14 * x - 5; % avaliar função em x
    if (abs(deltax) <= tolerancia && abs(Fx) <= tolerancia) || iter >= iter_max
      break;
    endif
    % atribuição dos novos pontos base
    if Fb * Fx < 0
      a = b;
      Fa = Fb;
    else
      Fa = Fa * Fb / (Fb + Fx); % a abscissa 'a' se mantém inalterada
    endif
    b = x;
    Fb = Fx;
    iter = iter + 1;
  endwhile
  Raiz = x;
  % teste de convergência
  if abs(deltax) <= tolerancia && abs(Fx) <= tolerancia
    info = 0;
  else
    info = 1;
  endif

endfunction
