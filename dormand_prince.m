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
## @deftypefn {} {@var{VetX}, @var{VetY}, @var{DifY} =} dormand_prince (@var{a}, @var{b}, @var{y0}, @var{m})
## Objetivo: Resolver um PVI pelo m�todo incorporado de Dormand-Prince(5, 4)
## Entrada:
##    a -> Limite inferior
##    b -> Limite superior
##    y0 -> Valor inicial
##    m -> N�mero de subintervalos
## Sa�da:
##    VetX -> Abscissas
##    VetY -> Solu��o do PVI
##    DifY -> Diferen�as entre as aproxima��es y(i+1) de ordens 5 e 4
##
## @seealso{}
## @end deftypefn

## Author: Lucas Monteiro
## Created: 2020-10-02

function [VetX, VetY, DifY] = dormand_prince (a, b, y0, m)
  % coeficientes do m�todo
  a21 = 1 / 5;
  a31 = 3 / 40; a32 = 9 / 40;
  a41 = 44 / 45; a42 = -56 / 15; a43 = 32 / 9;
  a51 = 19372 / 6561; a52 = -25360 / 2187; a53 = 64448 / 6561; a54 = -212 / 729;
  a61 = 9017 / 3168; a62 = -355 / 33; a63 = 46732 / 5247; a64 = 49 / 176; a65 = -5103 / 18656;
  a71 = 35 / 384; a72 = 0; a73 = 500 / 1113; a74 = 125 / 192; a75 = -2187 / 6784; a76 = 11 / 84;
  
  bc1 = 5179 / 57600; bc3 = 7571 / 16695; bc4 = 393 / 640; bc5 = -92097 / 339200; bc6 = 187 / 2100; bc7 = 1 / 40;
  
  c2 = 1 / 5; c3 = 3 / 10; c4 = 4 / 5; c5 = 8 / 9; c6 = 1; c7 = 1;
  
  h = (b - a) / m;
  xt = a;
  yt = y0;
  VetX(1) = xt;
  VetY(1) = yt;
  DifY(1) = 0;
  
  for i = 1 : m
    x = xt; y = yt;
    k1 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c2 * h; y = yt + a21 * k1 * h;
    k2 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c3 * h; y = yt + (a31 * k1 + a32 * k2) * h;
    k3 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c4 * h; y = yt + (a41 * k1 + a42 * k2 + a43 * k3) * h;
    k4 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c5 * h; y = yt + (a51 * k1 + a52 * k2 + a53 * k3 + a54 * k4) * h;
    k5 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c6 * h; y = yt + (a61 * k1 + a62 * k2 + a63 * k3 + a64 * k4 + a65 * k5) * h;
    k6 = x - 2 * y + 1; % avaliar f(x, y)
    x = xt + c7 * h; y = yt + (a71 * k1 + a72 * k2 + a73 * k3 + a74 * k4 + a75 * k5 + a76 * k6) * h;
    k7 = x - 2 * y + 1; % avaliar f(x, y)
    xt = a + i * h;
    % aproxima��o de ordem 4: coeficientes bcj(=bj)
    y4t = yt + h * (bc1 * k1 + bc3 * k3 + bc4 * k4 + bc5 * k5 + bc6 * k6 + bc7 * k7);
    % aproxima��o de ordem 5: coeficientes bj = a7j
    yt = yt + h * (a71 * k1 + a73 * k3 + a74 * k4 + a75 * k5 + a76 * k6);
    VetX(i + 1) = xt;
    VetY(i + 1) = yt;
    DifY(i + 1) = yt - y4t;

  endfor
  
endfunction
