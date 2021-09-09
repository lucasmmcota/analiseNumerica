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
## @deftypefn {} {@var{NumMax} =} fourier (@var{n}, @var{c}, @var{a}, @var{b})
## Objetivo: Determinar o número máximo de raízes reais no intervalo [a, b] pelo Teorema de Fourier
## Entrada:
##    n -> Grau
##    c -> Coeficientes do polinômio
##    a e b -> Limites do intervalo
## Saída:
##    NumMax -> Número máximo de raízes reais no intervalo
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function NumMax = fourier (n, c, a, b)
  n1 = n + 1;
  n2 = n + 2;
  for i = 1 : n
    DerPol(i) = c(i);
  endfor
  % avaliar polinômio em a e b
  DerPol_a = horner(c, a);
  DerPol_b = horner(c, b);
  % cálculo das derivadas e seus valores em a e b
  for i = 1 : n
    for j = 1 : n1 - i
      DerPol(j) = DerPol(j) * (n2 - i - j);
    endfor
    DerPol_a(i + 1) = horner(DerPol, a);
    DerPol_b(i + 1) = horner(DerPol, b);
  endfor
  % variações de sinais nos coeficientes do polinômio e suas derivadas em a e b
  VarSinal_a = troca_sinais(n1, DerPol_a);
  VarSinal_b = troca_sinais(n1, DerPol_b);
  NumMax = VarSinal_a - VarSinal_b;

endfunction
