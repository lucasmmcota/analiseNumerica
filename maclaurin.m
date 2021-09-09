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
## @deftypefn {@var{smp} { =} maclaurin (@var{x}, @var{n})
##
## @seealso{}
## @end deftypefn

## Author: lucas <lucas@LAPTOP-A3UK4PD2>
## Created: 2020-09-01

function smp = maclaurin_sin(x, n)
% x = a vector with values around 0
% n = number of terms in the series 

% Start the series with 0
smp = 0;

% Consider all the possible derivatives
deriv = [0 1 0 -1]'; 

% Iterate n times (from 0 to n-1)
for i = 0 : n-1

    % Implement the Maclaurin expansion
    t(i+1, :) = deriv(1) * x.^(i) / factorial(i);

    % Find the derivative for the next term
    deriv = circshift(deriv, -1);

end

% Add-up the calculated terms
smp = sum(t); 
endfunction
