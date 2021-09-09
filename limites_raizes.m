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
## @deftypefn {} {@var{L} =} limites_raizes (@var{n}, @var{c})
## Objetivo: Calcular os limites das ra�zes reais de uma equa��o alg�brica
## Entrada:
##    n -> Grau do polin�mio
##    c -> Vetor de coeficientes
## Sa�da:
##    L -> Vetor com os limites infeior e superior das ra�zes
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function L = limites_raizes (n, c)
  n1 = n + 1;
  if rem(n, 2) == 0
    sinal = 1;
  else
    sinal = -1;
  endif
  % matriz com os coeficientes dos polin�mios
  for i = 1 : n1
    MatC(i, 1) = c(i);
    MatC(n1 + 1 - i, 2) = c(i);
    MatC(i, 3) = sinal * c(i);
    sinal = -sinal;
    MatC(n1 + 1 - i, 4) = MatC(i, 3);
  endfor
  % c�lculo dos quatro limites das ra�zes reais
  for j = 1 : 4
    % se o coeficiente l�der for negativo troca o sinal de todos os coeficientes
    if MatC(1, j) < 0
      for i = 1 : n1
        MatC(i, j) = - MatC(i, j);
      endfor
    endif
    % determinar k, o maior �ndice de coeficiente negativo
    % B, m�dulo do menor coeficiente negativo
    B = 0;
    for i = n1 : -1 : 2
      if MatC(i, j) < 0
        k = i;
        if abs(MatC(i, j)) > B
          B = abs(MatC(i, j));
        endif
      endif
    endfor
    % limite das ra�zes positivas de P(x) = 0 e das equa��es auxiliares
    if B ~= 0
      L(j) = 1 + (B / MatC(1, j))^(1 / (k - 1));
    else
      L(j) = 10^10;
    endif
  endfor
  % limites das ra�zes positivas e nagativas de P(x) = 0
  aux = L(1);
  L(1) = 1 / L(2);
  L(2) = aux;
  L(3) = - L(3);
  L(4) = - 1 / L(4);

endfunction
