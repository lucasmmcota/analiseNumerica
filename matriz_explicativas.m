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
## @deftypefn {} {@var{MatX}, @var{info} =} matriz_explicativas (@var{n}, @var{v}, @var{p}, @var{ii}, @var{x})
## Objetivo: Montar a matriz de vari�veis explicativas para regress�o linear m�ltipla
## Entrada:
##    n -> N�mero de pontos
##    v -> N�mero de vari�veis explicativas
##    p -> N�mero de par�metros do modelo
##    ii -> Indica��o de interse��o
##    x -> Submatriz com vari�veis explicativas originais
## Saida:
##    MatX -> Matriz das vari�veis explicativas
##    info -> info = 0 -> sem erro
##            info = 1 -> p < v
##            info = 2 -> ii ~= 1 e ii~= 0
##            info = 3 -> modelo n�o permitido
##                        (v ~= 1 ou v > p)
##                        (v <= 1 ou v + ii ~= p)
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-20

function [MatX, info] = matriz_explicativas (n, v, p, ii, x)
  if p < v
    info = 1;
    return;
  endif
  if ii ~= 1 && ii~= 0
    info = 2;
    return;
  endif
  if (v ~= 1 || v > p) && (v <= 1 || v + ii ~= p)
    info = 3;
    return;
  endif
  info = 0;
  if v == 1 % regress�o polinomial
    if ii ~= 0 % modelo com interse��o
      for i = 1 : n
        MatX(i, 1) = 1;
      endfor
    else % modelo sem interse��o
      for i = 1 : n
        MatX(i, 1) = x(i, 1);
      endfor
    endif
    for j = 2 : p % completa a matriz MatX com pot�ncias do vetor coluna x(i, 1)
      j1 = j - 1;
      for i = 1 : n
        MatX(i, j) = MatX(i, j1) * x(i, 1);
      endfor
    endfor
  else % regress�o linear m�ltipla
    if ii ~= 0
      for i = 1 : n
        MatX(i, 1) = 1;
      endfor
    endif
    m = 0;
    for j = ii + 1 : p
      m = m + 1;
      for i = 1 : n
        MatX(i, j) = x(i, m);
      endfor
    endfor
  endif
      
endfunction
