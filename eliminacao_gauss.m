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
## @deftypefn {} {@var{A}, @var{b}, @var{detA}, @var{info}=} eliminacao_gauss (@var{A}, @var{b})
## Objetivo: Fazer a eliminação de Gauss do sistema Ax = b
## Entrada:
##    A -> Matriz dos coeficientes
##    b -> Vetor de termos independentes
##    n -> Ordem da A
## Saída:
##    A -> Matriz dos coeficientes escalonados
##    b -> Vetor de termos independentes ajustados
##    detA -> Determinante
##    info -> Informação sobre a singularidade de A, sendo info = 0: A não singular e
##              info = k: menor k tal que ukk = 0
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-08-28

function [A, b, detA, info] = eliminacao_gauss (A, b)
  n = size(A,1);
  detA = 1;
  info = 0;
  for j = 1 : n - 1
    p = j;
    Amax = abs(A(j,j));
    for k = j + 1 : n
      if abs(A(k,j)) > Amax
        Amax = abs(A(k,j));
        p = k;
      endif
    endfor
    if p ~= j
      for k = 1 : n
        t = A(j,k);
        A(j,k) = A(p,k);
        A(p,k) = t;
      endfor
      t = b(j);
      b(j) = b(p);
      b(p) = t;
      detA = -detA;
    endif
    detA = detA * A(j,j);
    if abs(A(j,j)) ~= 0
      r = (1 / A(j,j));
      for i = j + 1 : n
        mult = A(i,j) * r;
        A(i,j) = 0;
        for k = j + 1 : n
          A(i,k) = A(i,k) - (mult * A(j,k));
        endfor
        b(i) = b(i) - (mult * b(j));
      endfor
    else
      if info == 0
        info = j;
      endif
    endif
  endfor
  detA = detA * A(n,n);
  if info == 0 && abs(A(n,n)) == 0
    info = n;
  endif
endfunction
