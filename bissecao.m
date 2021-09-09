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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info} =} bissecao (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz de equação pelo método de bisseção
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saída:
##    Raiz -> Raiz da equação
##    iter -> Número gasto de iterações
##    info -> Informações sobre erro
##            info = -1 -> função não muda de sinal nos extremos do intervalo
##            info = 0 -> raiz encontrada
##            info = 1 -> raiz não convergiu com os parâmetros dados
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-13

function [Raiz, iter, info] = bissecao (a, b, tolerancia, iter_max)
  Fa = f(a); % avaliar a função em a
  Fb = f(b); % avaliar a função em b
  if Fa * Fb > 0
    info = -1;
    return;
  endif
  deltax = abs(b - a);
  iter = 0;
  while (true)
    deltax = deltax / 2;
    x = (a + b) / 2;
    Fx = f(x); % avaliar a função em x
    if (deltax <= tolerancia && abs(Fx) <= tolerancia) || iter >= iter_max
      break;
    endif
    % escolha dos novos pontos
    if Fa * Fx > 0
      a = x;
      Fa = Fx;
    else
      b = x;
      Fb = Fx;
    endif
    iter = iter + 1;
  endwhile
  Raiz = x;
  % teste de convergência
  if deltax <= tolerancia && abs(Fx) <= tolerancia
    info = 0;
  else
    info = 1;
  endif
    
endfunction
