% war3.pl -- base de conhecimento minimal para APS
% fatos (tipos e identidade)
human(arthas).
hero(arthas).
king(king_terenas).
killed(arthas, king_terenas).

human(jaina).
hero(jaina).

orc(thrall).
hero(thrall).

nightelf(maiev).
nightelf(tyrande).

undead(kelthuzad).
demon(malganis).

artifact(frostmourne).
artifact(tome_of_power).
wields(arthas, frostmourne).
seeks(illidan, tome_of_power).

% regras (tradução das fórmulas)
% quem empunha Frostmourne fica corrompido
corrupted_by(X, frostmourne) :- wields(X, frostmourne).

% corrompidos tornam-se lich_figure
became(X, lich_figure) :- corrupted_by(X, frostmourne).

% se mata um rei, é traidor
traitor(X) :- killed(X, Y), king(Y).

% demonios não são heróis (negação por falha)
% (em Prolog, podemos declarar: se demon, não hero)
not_hero(X) :- demon(X).
% opcional: heroidade conflitante trata-se por fatos/consultas

% liderança implica comando
commands(X, scourge) :- leader_of(X, scourge).
leader_of(arthas, scourge).

% regra composta: se tornou lich_figure e lidera scourge -> became lich_king
became(X, lich_king) :- became(X, lich_figure), leader_of(X, scourge).

% exemplo de conflito: quem busca o tomo tem problema com nightelves (representado como regra defeasible)
enemy_of(illidan, nightelves) :- seeks(illidan, tome_of_power).

% conhecimento adicional (fatos)
hero(illidan).