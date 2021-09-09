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
## @deftypefn {} {@var{x}, {@var{iter}, {@var{info}, {@var{raio_espectral} =} jacobi (@var{A}, @var{b}, @var{tolerancia}, @var{iter_max})
## Objetivo: Resolver o sistemax Ax = b pelo método iterativo de Jacobi
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
##    raio_espectral -> Raio espectral da matriz de iteração J  
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-03

function [x, iter, info, raio_espectral] = jacobi (A, b, tolerancia, iter_max)
  n = size(A,1);
  for i = 1 : n
    x(i) = b(i) / A(i,i);
  endfor
  iter = 0;
  printf("\nIteração %d: %d | %d | %d   Norma Relativa: %d", iter, x(1), x(2), x(3));
  printf("\n");
  while (true)
    iter = iter + 1;
    for i = 1 : n
      soma = 0;
      for j = 1 : n
        if i ~= j
          soma = soma + A(i,j) * x(j);
        endif
      endfor
      v(i) = (b(i) - soma)/A(i,i);
    endfor
    NormaNum = 0;
    NormaDen = 0;
    for i = 1 : n
      t = abs(v(i) - x(i));
      if t > NormaNum
        NormaNum = t;
      endif
      if abs(v(i)) > NormaDen
        NormaDen = abs(v(i));
      endif
      x(i) = v(i);
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
  J = matriz_iteracao_jacobi (A);
  raio_espectral = max(abs(eig(J)));
endfunction
