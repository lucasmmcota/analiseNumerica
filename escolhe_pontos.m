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
## @deftypefn {} {@var{x}, @var{y}, @var{info} =} escolhe_pontos (@var{m}, @var{vx}, @var{vy}, @var{z}, @var{grau})
## Objetivo: Escolher os pontos para interpolação polinomial
## Entrada:
##    m -> Número de pontos dados
##    vx -> Vetor com abscissas (em ordem crescente)
##    vy -> Vetor com ordenadas
##    z -> Valor a interpolar
##    grau -> Grau máximo do polinômio
## Saida:
##    x -> Abscissas escolhidas
##    y -> Ordenadas escolhidas
##    info -> info = 1 -> grau < 1 ou número de pontos < 2 ou números de pontos < grau + 1
##            info = 2 -> Abscissas não ordenadas
##            info = 3 -> Tentativa de extrapolação
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-18

function [x, y, info] = escolhe_pontos (m, vx, vy, z, grau)
  if grau < 1 || m < 2 || m < grau + 1
    info = 1;
    return;
  endif
  ordenado = true;
  indice(1) = 1;
  for j = 2 : m
    ordenado = ordenado && vx(j - 1) < vx(j);
    indice(j) = j;
  endfor
  if ordenado == false
    info = 2;
    return;
  endif
  if z < vx(1) || z > vx(m)
    info = 3;
    return;
  endif
  info = 0;
  np = grau + 1;
  inf = 1;
  sup = m;
  while true
    if sup - inf <= 1 
      break;
    endif
    ind = round((inf + sup) / 2);
    if vx(ind) > z
      sup = ind;
      else
        inf = ind;
    endif
  endwhile
  limite = inf;
  if np > 2
    if limite ~= 1
      ind = indice(1);
      indice(1) = indice(limite);
      indice(limite) = ind;
      ind = indice(2);
      indice(2) = indice(limite + 1);
      indice(limite + 1) = ind;
    endif
    for i = 3 : np
      menor = abs(vx(indice(i))- z);
      k = i;
      for j = i + 1 : m
        aux = abs(vx(indice(j))- z);
        if aux < menor
          menor = aux;
          k = j;
        endif
      endfor
      ind = indice(i);
      indice(i) = indice(k);
      indice(k) = ind;
      if indice(i) < limite
        limite = indice(i);
      endif
    endfor
  endif
  for i = 1 : np
    x(i) = vx(limite - 1 + i);
    y(i) = vy(limite - 1 + i);
  endfor    
  
endfunction
