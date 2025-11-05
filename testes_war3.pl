% testes_war3.pl - Arquivo para testar as consultas do Warcraft 3

:- [war3].

:- initialization(main).

main :-
    writeln('=== HEROES ==='),
    setof(X, hero(X), Heroes),
    forall(member(X, Heroes), format('Hero: ~w~n', [X])),
    nl,
    
    writeln('=== HUMANS ==='),
    setof(X, human(X), Humans),
    forall(member(X, Humans), format('Human: ~w~n', [X])),
    nl,
    
    writeln('=== CORRUPTED BY FROSTMOURNE ==='),
    (setof(X, corrupted_by(X, frostmourne), Corrupted) ->
        forall(member(X, Corrupted), format('~w foi corrompido por Frostmourne~n', [X]))
    ;   writeln('Ninguem foi corrompido')),
    nl,
    
    writeln('=== BECAME LICH FIGURE ==='),
    (setof(X, became(X, lich_figure), LichFigures) ->
        forall(member(X, LichFigures), format('~w se tornou lich figure~n', [X]))
    ;   writeln('Ninguem se tornou lich figure')),
    nl,
    
    writeln('=== BECAME LICH KING ==='),
    (setof(X, became(X, lich_king), LichKings) ->
        forall(member(X, LichKings), format('~w se tornou Lich King~n', [X]))
    ;   writeln('Ninguem se tornou Lich King')),
    nl,
    
    writeln('=== TRAITORS ==='),
    (setof(X, traitor(X), Traitors) ->
        forall(member(X, Traitors), format('~w eh traidor~n', [X]))
    ;   writeln('Nenhum traidor encontrado')),
    nl,
    
    writeln('=== WHO KILLED WHOM ==='),
    (setof([X,Y], killed(X, Y), Kills) ->
        forall(member([X,Y], Kills), format('~w matou ~w~n', [X, Y]))
    ;   writeln('Nenhuma morte registrada')),
    nl,
    
    writeln('=== ARTIFACTS ==='),
    setof(X, artifact(X), Artifacts),
    forall(member(X, Artifacts), format('Artifact: ~w~n', [X])),
    nl,
    
    writeln('=== WHO WIELDS WHAT ==='),
    (setof([X,Y], wields(X, Y), Wields) ->
        forall(member([X,Y], Wields), format('~w empunha ~w~n', [X, Y]))
    ;   writeln('Ninguem empunha nada')),
    nl,
    
    writeln('=== WHO SEEKS WHAT ==='),
    (setof([X,Y], seeks(X, Y), Seeks) ->
        forall(member([X,Y], Seeks), format('~w busca ~w~n', [X, Y]))
    ;   writeln('Ninguem busca nada')),
    nl,
    
    writeln('=== LEADERS ==='),
    (setof([X,Y], leader_of(X, Y), Leaders) ->
        forall(member([X,Y], Leaders), format('~w lidera ~w~n', [X, Y]))
    ;   writeln('Nenhum lider encontrado')),
    nl,
    
    writeln('=== COMMANDS ==='),
    (setof([X,Y], commands(X, Y), Commands) ->
        forall(member([X,Y], Commands), format('~w comanda ~w~n', [X, Y]))
    ;   writeln('Ninguem comanda nada')),
    nl,
    
    writeln('=== NOT HEROES (DEMONS) ==='),
    (setof(X, not_hero(X), NotHeroes) ->
        forall(member(X, NotHeroes), format('~w NAO eh heroi~n', [X]))
    ;   writeln('Todos sao herois')),
    nl,
    
    writeln('=== ENEMIES ==='),
    (setof([X,Y], enemy_of(X, Y), Enemies) ->
        forall(member([X,Y], Enemies), format('~w eh inimigo de ~w~n', [X, Y]))
    ;   writeln('Nenhuma inimizade registrada')),
    nl,
    
    writeln('=== ALL RACES ==='),
    writeln('Orcs:'),
    (setof(X, orc(X), Orcs) ->
        forall(member(X, Orcs), format('  - ~w~n', [X]))
    ;   writeln('  Nenhum')),
    writeln('Night Elves:'),
    (setof(X, nightelf(X), NightElves) ->
        forall(member(X, NightElves), format('  - ~w~n', [X]))
    ;   writeln('  Nenhum')),
    writeln('Undead:'),
    (setof(X, undead(X), Undeads) ->
        forall(member(X, Undeads), format('  - ~w~n', [X]))
    ;   writeln('  Nenhum')),
    writeln('Demons:'),
    (setof(X, demon(X), Demons) ->
        forall(member(X, Demons), format('  - ~w~n', [X]))
    ;   writeln('  Nenhum')),
    nl,
    
    halt.
