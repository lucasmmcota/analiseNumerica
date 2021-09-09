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
## Objetivo: Verificar se o sistema linear possui solu��o
## Entrada:
##    A -> Matriz de coeficientes
##    b -> Vetor de termos independentes
## Saida:
##    info -> 0 - Possui solu��o / 1 - N�o possui
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
      printf("\nO sistema linear n�o possui solu��o !\n");
      info = 1;
    else
      printf("\nO sistema linear possui infinitas solu��es !\n");
      info = 0;
    endif
  else
    printf("\nO sistema linear possui apenas uma �nica solu��o !\n");
    info = 0;
  endif

endfunction
