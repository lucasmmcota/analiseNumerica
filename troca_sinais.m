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
## @deftypefn {} {@var{Var} =} troca_sinais (@var{n1}, @var{c})
## Objetivo: Contar o número de troca de sinais dos coeficientes de um polinômio
## Entrada:
##    n1 -> Grau do polinômio + 1
##    c -> Coeficientes
## Saída:
##    Var -> Número de variações de sinais
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function Var = troca_sinais (n1, c)
  Var = 0;
  i = 1;
  for j = 2 : n1
    if c(j) ~= 0
      if c(i) * c(j) < 0
        Var = Var + 1;
      endif
      i = j;
    endif
  endfor
  
endfunction
