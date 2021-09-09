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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info}  =} halley (@var{x}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz de equação pelo método de Halley
## Entrada:
##    x -> Valor inicial
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saída:
##    Raiz -> Raiz
##    iter -> Número gasto de iterações
##    info -> Informação sobre consistência e convergência
##            info = 1 -> raiz não convergiu com parâmetros dados
##            info = 2 -> raiz calculada está fora do intervalo
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Raiz, iter, info] = halley (x, tolerancia, iter_max)
  deltax = 1 + tolerancia;
  iter = 0;
  while (true)
    Fx = 2 * x^3 - cos(x + 1) - 4; % avaliar a função em x
    DFx = 6 * x^2 + sin(x + 1); % avaliar a deriva da função em x
    if (abs(deltax) <= tolerancia && abs(Fx) <= tolerancia) || iter >= iter_max
      break;
    endif
    D2Fx = 12 * x + cos(x + 1); % avaliar a derivada segunda em x
    deltax = 2 * Fx * DFx / (2 * DFx^2 - Fx * D2Fx);
    x = x - deltax;
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
