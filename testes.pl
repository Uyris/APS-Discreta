% testes.pl - Arquivo para testar as consultas

:- [empresa].

:- initialization(main).

main :-
    writeln('=== FUNCIONARIOS ==='),
    setof(X, funcionario(X), Funcionarios),
    forall(member(X, Funcionarios), format('Funcionario: ~w~n', [X])),
    nl,
    
    writeln('=== QUEM TRABALHA EM QUAIS PROJETOS ==='),
    setof([X,P], trabalha_em(X, P), Trabalhos),
    forall(member([X,P], Trabalhos), format('~w trabalha em ~w~n', [X, P])),
    nl,
    
    writeln('=== GERENTES ==='),
    setof(X, P^gerente(X), Gerentes),
    forall(member(X, Gerentes), format('Gerente: ~w~n', [X])),
    nl,
    
    writeln('=== QUEM LIDERA QUAIS PROJETOS ==='),
    setof([X,P], lidera(X, P), Lideres),
    forall(member([X,P], Lideres), format('~w lidera ~w~n', [X, P])),
    nl,
    
    writeln('=== RESPONSAVEIS SOBRE PROJETOS ==='),
    setof([X,P], Y^responsavel_sobre(X, P), Responsaveis),
    forall(member([X,P], Responsaveis), format('~w eh responsavel sobre ~w~n', [X, P])),
    nl,
    
    writeln('=== ELEGIVEIS PARA HORAS EXTRAS ==='),
    setof(X, N^elegivel_horas_extras(X), Elegiveis),
    forall(member(X, Elegiveis), format('~w eh elegivel para horas extras~n', [X])),
    nl,
    
    writeln('=== SUPERVISOES NAO CIRCULARES ==='),
    setof([X,Y], nao_supervisiona_circular(X, Y), Supervisoes),
    forall(member([X,Y], Supervisoes), format('~w supervisiona ~w (nao circular)~n', [X, Y])),
    nl,
    
    halt.
