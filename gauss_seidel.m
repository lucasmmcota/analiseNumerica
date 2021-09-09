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
## @deftypefn {} {@var{x}, {@var{iter}, {@var{info}, {@var{raio_espectral}=} jacobi (@var{A}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Resolver o sistemax Ax = b pelo método iterativo de Gauss-Seidel
## Entrada:
##    n -> Ordem da matriz
##    A -> Matriz dos coeficientes
##    b -> Vetor de termos independentes
##    tolerancia -> Tolerância
##    iter_max -> Número máximo de iterações
## Saída:
##    x -> Vetor solução
##    iter -> Número de iterações
##    info -> 0: convergiu / 1: não convergiu
##    raio_espectral -> Raio espectral da matriz de iteração S
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-03

function [x, iter, info, raio_espectral] = gauss_seidel (A, b, tolerancia, iter_max)
 n = size(A, 1);
 for i = 1 : n
    x(i) = b(i) / A(i,i);
  endfor
  iter = 0;
  printf("\nIteração %d: %d | %d | %d   Norma Relativa: \n", iter, x(1), x(2), x(3));
  while (true)
    iter = iter + 1;
    NormaNum = 0;
    NormaDen = 0;
    for i = 1 : n
      soma = 0;
      for j = 1 : n
        if i ~= j
          soma = soma + A(i,j) * x(j);
        endif
      endfor
      v(i) = x(i);
      x(i) = (b(i) - soma) / A(i,i);
      t = abs(v(i) - x(i));
      if t > NormaNum
        NormaNum = t;
      endif
      if abs(x(i)) > NormaDen
        NormaDen = abs(x(i));
      endif
    endfor
    NormaRel = NormaNum / NormaDen;
    printf("\nIteração %d: %d | %d | %d   Norma Relativa: %d\n", iter, x(1), x(2), x(3), NormaRel);
    if NormaRel <= tolerancia || iter >= iter_max
      break;
    endif;
  endwhile
  if NormaRel <= tolerancia
    info = 0;
    else
      info = 1;
  endif
  S = matriz_iteracao_gauss (A);
  raio_espectral = max(abs(eig(S)));
endfunction
