%===================== ATIVIDADE 1 - CAPITULO 2 ===============================
%
% Este script mostra o gráfico da função para o intervalo e o
% número de pontos desejados
%
%==============================================================================
  opcao = input("Digite a letra do exercício que voce quer o gráfico da função impressa: ");
  
  if opcao == "a"
    % LETRA A) y = 2x^2 + 1, [-8, 20], 100 PONTOS.
    x = -8 : 0.28 : 20;
    y = 2 * (x.^2) + 1;
    plot(x, y, "r.");
    else if opcao == "b"
      % LETRA B) y = cos^2(x) + sen^2(x), [-12, 14], 50 PONTOS
      x = -12 : 0.52 : 14;
      y = 1;
      plot(x, y, "r.");
      else if opcao == "c"
        % LETRA C) y = e^((x^3) + 5), [-20, -2], 10 PONTOS
        x = -20 : 1.8 : -2;
        y = e.^((x.^3) + 5);
        plot(x, y, "r*");
        else if opcao == "d"
          % LETRA D) y = log3(x^5 + 2), [10, 11], 200 PONTOS
          x = 10 : 0.005 : 11;
          y = log(x.^5 + 2)/log(3);
          plot(x, y, "r*");
          else if opcao == "e"
            % LETRA E) y = cos(3x^3 + pi) + x^3, [1, 13], 50 PONTOS
            x = 1 : 0.24 : 13;
            y = cos((3 * (x.^3)) + pi) + x.^3;
            plot(x, y, "r*");
            else 
              disp("Letra não existente !");
          endif
        endif 
      endif
    endif
  endif
  
   