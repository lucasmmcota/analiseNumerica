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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info}  =} muller (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Calcular raiz de equa��o pelo m�todo de Muller
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    tolerancia -> Toler�ncia
##    iter_max -> N�mero m�ximo de itera��es
## Sa�da:
##    Raiz -> Raiz
##    iter -> N�mero gasto de itera��es
##    info -> Informa��o sobre consist�ncia e converg�ncia
##            info = 1 -> raiz n�o convergiu com par�metros dados
##            info = 2 -> raiz calculada est� fora do intervalo
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Raiz, iter, info] = muller (a, b, tolerancia, iter_max)
  Epsilon = precisao_maquina;
  Fa = a^3 - a^2 - a - 1; % avaliar fun��o em a
  Fb = b^3 - b^2 - b - 1; % avaliar fun��o em b
  % obten��o do terceiro ponto para interpola��o quadr�tica via bisse��o
  x = (a + b) / 2;
  Fx = x^3 - x^2 - x - 1; % avaliarm a fun��o em x
  iter = 0;
  while (true)
    ha = x - a;
    hb = b - x;
    Da = (Fa - Fx) / ha;
    Db = (Fb - Fx) / hb;
    AA = (Da + Db) / (ha + hb);
    BB = (ha * Db - hb * Da) / (ha + hb);
    CC = Fx;
    Delta = sqrt(BB^2 - 4 * AA * CC);
    if abs(BB + Delta) > abs(BB - Delta)
      v = -2 * CC / (BB + Delta);
    else
      v = -2 * CC / (BB - Delta);
    endif
    t = x;
    Ft = Fx;
    x = x + v;
    Fx = x^3 - x^2 - x - 1; % avaliar a fun��o em x
    if (abs(v) <= tolerancia && abs(Fx) <= tolerancia) || iter >= iter_max
      break;
    endif
    % atribui��o dos novos pontos base
    a = b;
    Fa = Fb;
    b = t;
    Fb = Ft;
    iter = iter + 1;
  endwhile
  Raiz = x;
  % teste de converg�ncia
  if abs(v) <= tolerancia && abs(Fx) <= tolerancia
    info = 0;
  else
    info = 1;
  endif

endfunction
