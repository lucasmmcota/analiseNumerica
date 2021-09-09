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
## @deftypefn {} {@var{b}, @var{r2}, @var{s2}, @var{AICc}, @var{info} =} regressao_linear_en (@var{n}, @var{v}, @var{p}, @var{ii}, @var{x}, @var{y})
## Objetivo: Estimar parâmetros de quadrados mínimos da equação de regressão linear múltipla via equações normais
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

function [b, r2, s2, AICc, info] = regressao_linear_en (n, v, p, ii, x, y)
  [MatX, info] = matriz_explicativas(n, v, p, ii, x);
  if info ~= 0
    return;
  endif
  for i = 1 : p
    for j = 1 : i;
      soma = 0;
      for k = 1 : n
        soma = soma + MatX(k, i) * MatX(k, j);
      endfor
      Sxx(i, j) = soma; % matriz dos coeficientes
      if i ~= j
        Sxx(j, i) = soma;
      endif
    endfor
    soma = 0;
    for k = 1 : n
      soma = soma + MatX(k, i) * y(k);
    endfor
    Sxy(i) = soma; % vetor dos termos independentes
  endfor
  [L, Det, info] = cholesky(Sxx);
  if info ~= 0
    info = 4;
    return;
  endif
  t = substituicoes_sucessivas(L, Sxy);
  for i = 1 : p
    for j = 1 : i
      U(j, i) = L(i, j); % U = transposta de L
    endfor
  endfor
  b = substituicoes_retroativas(U, t);
  info = 0;
  S = 0;
  Sy2 = 0;
  for i = 1 : n
    u = 0;
    for j = 1 : p
      u = u + MatX(i, j) * b(j);
    endfor
    S = S + (y(i) - u)^2;
    Sy2 = Sy2 + y(i)^2;
  endfor
  if ii == 1
    r2 = 1 - S / (Sy2 - Sxy(1)^2 / n);
  else
    r2 = 1 - S / Sy2;
  endif
  s2 = S / (n - p);
  AICc = n * log(S / n) + 2 * p * n / (n - p - 1);
  Sxx
  Sxy = Sxy'
endfunction
