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
## @deftypefn {} {@var{x} =} resolve_cholesky (@var{A}, @var{b})
## Objetivo: Resolver o sistema linear decomposto pelo metódo de Cholesky
## Entrada:
##    A -> Matriz de coeficientes
##    b -> Vetor de termos independentes
## Saida:
##    x -> Vetor solução do sistema linear Ax = b
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-17

function x = resolve_cholesky (A, b)
  [L, detA, info] = cholesky(A);
  if info == 0
    y = substituicoes_sucessivas(L, b);
    x = substituicoes_retroativas(L', y);
    else 
      disp("\nA matriz não é definida positiva !\n");
  endif

endfunction
