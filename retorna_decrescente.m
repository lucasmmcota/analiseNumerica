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
## @deftypefn {} {@var{x} =} retorna_decrescente ()
## Objetivo: Retornar um vetor de 4 números em ordem decrescente
## Entrada: 
##    Nenhuma entrada
## Saida:
##    x -> Vetor de 4 números diferentes lidos em ordem decrescente
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro Martino Cota
## Created: 2020-09-01

function x = retorna_decrescente ()
  v(1) = input("Digite um número: ");
  v(2) = input("Digite um número: ");
  
  crescente(1) = v(1);
  
  while v(1) == v(2)
    v(2) = input("Digite um número diferente: ");
  endwhile
  
  if v(1) > v(2)
    crescente(1) = v(2);
    crescente(2) = v(1);
    else 
      crescente(2) = v(2);
  endif
  
  v(3) = input("Digite um número: ");
  
  while v(1) == v(3) || v(2) == v(3)
    v(3) = input("Digite um número diferente: ");
  endwhile
  
  if crescente(1) > v(3)
    maior = crescente(1);
    crescente(1) = v(3);
    crescente(3) = crescente(2);
    crescente(2) = maior;
    else if crescente(2) > v(3)
      crescente(3) = crescente(2);
      crescente(2) = v(3);
      else
        crescente(3) = v(3);
    endif
  endif
  
  v(4) = input("Digite mais um número qualquer: ");
  
  while v(1) == v(4) || v(2) == v(4) || v(3) == v(4)
    v(4) = input("Digite um número diferente: ");
  endwhile
  
  if crescente(1) > v(4)
    x(4) = v(4);
    j = 1;
    for i = 3 : -1 :  1
      x(i) = crescente(j);
      j++;
    endfor
    else if crescente(2) > v(4)
      x(4) = crescente(1);
      x(3) = v(4);
      x(2) = crescente(2);
      x(1) = crescente(3);
      else if crescente(3) > v(4)
        x(4) = crescente(1);
        x(3) = crescente(2);
        x(2) = v(4)
        x(1) = crescente(3);
        else
          j = 1;
          for i = 4 : -1 : 2
            x(i) = crescente(j);
            j++;
          endfor
          x(1) = v(4);
      endif
    endif
  endif

endfunction
