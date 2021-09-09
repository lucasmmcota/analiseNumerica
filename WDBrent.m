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
## @deftypefn {} {@var{Raiz}, @var{iter}, @var{info}  =} WDBrent (@var{a}, @var{b}, @var{tolerancia}, @var{iter_max})
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
##            info = -1 -> fun��o n�o muda de sinal nos extremos do intervalo
##            info = 1 -> raiz n�o convergiu com par�metros dados
##            info = 2 -> raiz calculada est� fora do intervalo
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-05

function [Raiz, iter, info] = WDBrent (a, b, tolerancia, iter_max)
  Epsilon = precisao_maquina;
  Fa = 0.05 * a^3 - 0.4 * a^2 + 3 * a * sin(a); % avaliar fun��o em a
  Fb = 0.05 * b^3 - 0.4 * b^2 + 3 * b * sin(b); % avaliar fun��o em b
  % verificar se a fun��o muda de sinal nos extremos de [a, b]
  if Fa * Fb > 0
    info = -1;
    return;
  endif
  c = b;
  Fc = Fb;
  iter = 0;
  while (true)
    % altera a, b e c para que b seja a melhor estimativa da raiz
    if Fb * Fc > 0
      c = a;
      Fc = Fa;
      d = b - a;
      e = d;
    endif
    if abs(Fc) < abs(Fb)
      a = b;
      b = c;
      c = a;
      Fa = Fb;
      Fb = Fc;
      Fc = Fa;
    endif
    tol = 2 * Epsilon * abs(b) + 0.5 * tolerancia;
    z = 0.5 * (c - b);
    if abs(z) <= tol || Fb == 0 || iter >= iter_max
      break;
    endif
    % escolha entre interpola��o e bisse��o
    if abs(e) >= tol && abs(Fa) > abs(Fb)
      s = Fb / Fa;
      if a == c % interpola��o linear
        p = 2 * z * s;
        q = 1 - s;
      else % interpola��o quadr�tica inversa
        q = Fa / Fc;
        r = Fb / Fc;
        p = s * (2 * z * q * (q - r) - (b - a) * (r - 1));
        q = (q - 1) * (r - 1) * (s - 1);
      endif
      if p > 0
        q = -q;
      endif
      p = abs(p);
      if 2 * p < min(3 * z * q - abs(tol * q), abs(e * q)) % aceita interpola��o
        e = d;
        d = p / q;
      else % usa bisse��o devido � falha na interpola��o
        d = z;
        e = d;
      endif
    else % usa bisse��o por causa da redu��o lenta dos limites
      d = z;
      e = d;
    endif
    % calcula nova estimativa da raiz
    a = b;
    Fa = Fb;
    if abs(d) > tol
      b = b + d;
    else
      if z < 0
        b = - (b + tol);
      else
        b = b + tol;
      endif
    endif
    Fb = 0.05 * b^3 - 0.4 * b^2 + 3 * b * sin(b); % avaliar a fun��o em b  
    iter = iter + 1;
  endwhile
  Raiz = b;
  % teste de converg�ncia
  if abs(z) <= tolerancia || Fb == 0
    info = 0;
  else
    info = 1;
  endif

endfunction
