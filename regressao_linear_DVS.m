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
## @deftypefn {} {@var{b}, @var{r2}, @var{s2}, @var{AICc}, @var{info} =} regressao_linear_DVS (@var{n}, @var{v}, @var{p}, @var{ii}, @var{x}, @var{y})
## Objetivo: Estimar parâmetros de quadrados mínimos da equação de regressão linear múltipla via decomposição em valores singulares reduzida
## Entrada:
##    n -> Número de pontos
##    v -> Número de variáveis explicativas
##    p -> Número de parâmetros do modelo
##    ii -> Indicação de interseção
##    x -> Variáveis explicativas originais
##    y -> Variáveis respostas
## Saida:
##    b -> Estimadores dos parâmetros
##    r2 -> Coeficiente determinação
##    s2 -> Quadrado médio residual
##    AICc -> Critério de informação de Akaike
##    info -> info = 0 -> sem erro
##            info = 1 -> p < v
##            info = 2 -> ii ~= 1 e ii~= 0
##            info = 3 -> modelo não permitido
##                        (v ~= 1 ou v > p)
##                        (v <= 1 ou v + ii ~= p)
##            info = 4 -> Matriz das equações normais não é definida positiva
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-09-20

function [b, r2, s2, AICc, info] = regressao_linear_DVS (n, v, p, ii, x, y)
  [MatX, info] = matriz_explicativas(n, v, p, ii, x);
  if info ~= 0
    return;
  endif
  Epsilon = precisao_maquina;
  [U, Sigma, V] = svd(MatX);
  if Sigma(p, p) < n * Epsilon
    info == 4
    return;
  endif
  for i = 1 : p
    soma = 0;
    for j = 1 : n
      soma = soma + U(j, i) * y(j);
    endfor
    c(i) = soma / Sigma(i, i);
  endfor
  for i = 1 : p
    soma = 0;
    for j = 1 : p
      soma = soma + V(i, j) * c(j);
    endfor
    b(i) = soma;
  endfor
  info = 0;
  S = 0;
  Sy = 0;
  Sy2 = 0;
  for i = 1 : n
    u = 0;
    for j = 1 : p
      u = u + MatX(i, j) * b(j);
    endfor
    S = S + (y(i) - u)^2;
    Sy = Sy + y(i);
    Sy2 = Sy2 + y(i)^2;
  endfor
  if ii == 1
    r2 = 1 - S / (Sy2 - Sy^2 / n);
  else
    r2 = 1 - S / Sy2;
  endif
  s2 = S / (n - p);
  AICc = n * log(S / n) + 2 * p * n / (n - p - 1);
  Sigma
endfunction
