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
## @deftypefn {@var{info}} { =} verifica_sistema_linear (@var{A}, @var{b})
## Objetivo: Verificar se o sistema linear possui solução
## Entrada:
##    A -> Matriz de coeficientes
##    b -> Vetor de termos independentes
## Saida:
##    info -> 0 - Possui solução / 1 - Não possui
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-08

function info = verifica_sistema_linear (A, b)
  if det(A) == 0
    x = A;
    x(:,1) = b;
    if det(x) == 0
      printf("\nO sistema linear não possui solução !\n");
      info = 1;
    else
      printf("\nO sistema linear possui infinitas soluções !\n");
      info = 0;
    endif
  else
    printf("\nO sistema linear possui apenas uma única solução !\n");
    info = 0;
  endif

endfunction
