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
## @deftypefn {} {@var{numeroDeCondicao}, {@var{info} =} verifica_condicao_do_sistema (@var{A})
##  Entrada:
##    A -> Matriz de coeficientes
##  Saida:
##    numeroDeCondicao -> Número de condição do sistema linear
##    info -> 0 = sistema bem condicionado / 1 = sistema mal condicionado
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-09

function [numeroDeCondicao, info] = verifica_condicao_do_sistema (A)
  numeroDeCondicao = -1;
  [invA, info] = matriz_inversa(A);
  if info == 0
    numeroDeCondicao = norm(A) * norm(invA);
    if numeroDeCondicao < 100
      info = 0;
      else
        info = 1;
    endif
  endif
  
endfunction
