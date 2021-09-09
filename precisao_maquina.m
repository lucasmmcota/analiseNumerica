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
## @deftypefn {} {@var{epsilon} =} precisao_maquina ()
## Objetivo: Determinar a precisão da máquina
## Entrada:
##    Nenhuma
## Saida:
##    epsilon -> Precisão da máquina
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-20

function epsilon = precisao_maquina
  Eps1 = 1;
  while true
    if 1 + Eps1 <= 1
      break;
    endif
    epsilon = Eps1;
    Eps1 = Eps1 / 2;
  endwhile

endfunction
