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
## @deftypefn {} {@var{f} =} fibonacci (@var{n})
## Objetivo: Retornar um vetor com a sequência de Fibonacci
## Entrada:
##    n -> Quantidade de números que retornarão no vetor.
## Saida:
##    f -> Vetor de números com a sequência de Fibonacci
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-01

function f = fibonacci (n)
  f = zeros(n,1);
  f(1) = 0;
  f(2) = 1;
  for i = 3 : n
    f(i) = f(i - 1) + f(i - 2);
  end
end
