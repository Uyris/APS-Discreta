% war3.pl -- base de conhecimento minimal para APS
% -----------------------------------------------

% Fatos (tipos e identidade)
human(arthas).
human(jaina).

hero(arthas).
hero(jaina).
hero(thrall).
hero(illidan).

orc(thrall).

nightelf(maiev).
nightelf(tyrande).

undead(kelthuzad).
demon(malganis).

king(king_terenas).
killed(arthas, king_terenas).

artifact(frostmourne).
artifact(tome_of_power).

wields(arthas, frostmourne).
seeks(illidan, tome_of_power).

leader_of(arthas, scourge).

% -----------------------------------------------
% Regras (tradução das fórmulas)
% -----------------------------------------------

% Quem empunha Frostmourne fica corrompido
corrupted_by(X, frostmourne) :- wields(X, frostmourne).

% Corrompidos tornam-se lich_figure
became(X, lich_figure) :- corrupted_by(X, frostmourne).

% Se mata um rei, é traidor
traitor(X) :- killed(X, Y), king(Y).

% Demônios não são heróis (negação por falha)
not_hero(X) :- demon(X).

% Liderança implica comando
commands(X, scourge) :- leader_of(X, scourge).

% Regra composta: se tornou lich_figure e lidera scourge -> tornou-se lich_king
became(X, lich_king) :- became(X, lich_figure), leader_of(X, scourge).

% Exemplo de conflito: quem busca o tomo tem problema com nightelves
enemy_of(illidan, nightelves) :- seeks(illidan, tome_of_power).
