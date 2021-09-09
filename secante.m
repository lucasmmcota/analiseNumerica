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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info}  =} secante (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz de equação pelo método da secante
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
##            info = 2 -> raiz calculada está fora do intervalo
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Raiz, iter, info] = secante (a, b, tolerancia, iter_max)
  Epsilon = precisao_maquina;
  Fa = 2 * a^3 - 5 * a^2 - a + 3; % avaliar função em a
  Fb = 2 * b^3 - 5 * b^2 - b + 3; % avaliar função em b
  a0 = a;
  b0 = b;
  iter = 0;
  while (true)
    deltax = Fb * (b - a) / (Fb - Fa);
    x = b - deltax;
    Fx = 2 * x^3 - 5 * x^2 - x + 3; % avaliar função em x
    if (abs(deltax) <= tolerancia && abs(Fx) <= tolerancia) || abs(Fb - Fx) < Epsilon || iter >= iter_max
      break;
    endif
    % atribuição dos novos pontos base
    a = b;
    Fa = Fb;
    b = x;
    Fb = Fx;
    iter = iter + 1;
  endwhile
  Raiz = x;
  % teste de convergência
  if abs(deltax) <= tolerancia && abs(Fx) <= tolerancia
    if Raiz >= a0 && Raiz <= b0
      info = 0;
    else
      info = 2;
    endif
  else
    info = 1;
  endif
  
endfunction
