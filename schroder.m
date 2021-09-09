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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info} =} schroder (@var{m}, @var{x}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz m�ltipla pelo m�todo de Schr�der
## Entrada:
##    m -> Multiplicidade
##    x -> Valor inicial
##    tolerancia -> Toler�ncia
##    iter_max -> N�mero m�ximo de itera��es
## Sa�da:
##    Raiz -> Raiz
##    iter -> N�mero gasto de itera��es
##    info -> Informa��o sobre converg�ncia
##            info = 0 -> raiz convergiu com sucesso
##            info = 1 -> raiz n�o convergiu com par�metros dados
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-14

function [Raiz, iter, info] = schroder (m, x, tolerancia, iter_max)
  Epsilon = precisao_maquina;
  deltax = 1 + tolerancia;
  iter = 0;
  while (true)
    Fx = x^4 + 2 * x^3 - 12 * x^2 + 14 * x - 5; % avaliar a fun��o em x
    DFx = 4 * x^3 + 6 * x^2 - 24 * x + 14; % avaliar a derivada da fun��o em x
    deltax = m * Fx / DFx;
    if (abs(deltax) <= tolerancia && abs(Fx) <= tolerancia) || abs(DFx) < Epsilon || iter >= iter_max
      break;
    endif
    x = x - deltax;
    iter = iter + 1;
  endwhile
  Raiz = x;
  % teste de converg�ncia
  if abs(deltax) <= tolerancia && abs(Fx) <= tolerancia
    info = 0;
  else
    info = 1;
  endif
  
endfunction
