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
## @deftypefn {} {@var{Integral}, @var{info} =} gauss_legendre_dupla (@var{ax}, @var{bx}, @var{nx}, @var{ay}, @var{by}, @var{ny})
## Objetivo: Cálculo de integral dupla pelas fórmulas de Gauss-Legendre
## Entrada:
##    ax -> Limite inferior em x
##    bx -> Limite superior em x
##    nx -> Número de pontos em x
##    ay -> Limite inferior em y
##    by -> Limite superior em x
##    ny -> Número de pontos em y
## Saída:
##    Integral -> Valor da integral
##    info -> Informação sobre consistência e convergência
##            info = 0 -> parâmetros são consistentes e todos os zeros convergiram
##            info = -1 -> nx < 1 ou ny < 1
##            info = k -> 'k' zeros não convergiram
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-30

function [Integral, info] = gauss_legendre_dupla (ax, bx, nx, ay, by, ny)
  Integral = 0;
  info = 0;
  % cálculo das abscissas e pesos
  [T, alfa, info] = gauss_legendre_AbsPes(nx);
  if info ~= 0
    return;
  endif
  if ny == nx
    for j = 1 : ny
      beta(j) = alfa(j);
      U(j) = T(j);
    endfor
  else
    [U, beta, info] = gauss_legendre_AbsPes(ny);
    if info ~= 0
      return;
    endif
  endif
  % cálculo da integral dupla
  bax = (bx - ax) / 2;
  bay = (by - ay) / 2;
  for i = 1 : nx
    x = ax + bax * (T(i) + 1);
    soma = 0;
    for j = 1 : ny
      y = ay + bay * (U(j) + 1);
      fxy = (x^2 + y^2) * e^(2 * x - y); % avaliar a função integrando em x, y
      soma = soma + beta(j) * fxy;
    endfor
    Integral = Integral + alfa(i) * soma;
  endfor
  Integral = bax * bay * Integral;
  
endfunction
