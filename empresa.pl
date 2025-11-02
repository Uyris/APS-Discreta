% empresa.pl
% Base de conhecimento APS - Lógica de Primeira Ordem -> Prolog

% pessoas / projetos
pessoa(ana).
pessoa(bruno).
pessoa(carla).
pessoa(diego).
pessoa(eva).

projeto(alpha).
projeto(beta).

% cargos / status
cargo(bruno, dev).
senior(carla).

% fatos base (não derivados de regras)
gerente_base(ana).
funcionario_base(bruno).
funcionario_base(diego).

trabalha_em_base(bruno, beta).
trabalha_em_base(carla, alpha).

lidera_base(carla, alpha).

horas(bruno, 38).

% Regras

% Fatos básicos podem ser consultados
gerente(X) :- gerente_base(X).
funcionario(X) :- funcionario_base(X).
trabalha_em(X, P) :- trabalha_em_base(X, P).
lidera(X, P) :- lidera_base(X, P).

% supervisoes (fatos concretos para possibilitar inferencias existenciais)
supervisiona(ana, bruno).
supervisiona(ana, diego).

% todo gerente é funcionário
funcionario(X) :- gerente(X).

% se lidera, trabalha no projeto
trabalha_em(X, P) :- lidera(X, P).

% se x supervisiona y e y trabalha em p, então x é responsável por p
responsavel_sobre(X, P) :- supervisiona(X, Y), trabalha_em(Y, P).

% se trabalha e é senior, então lidera
lidera(X, P) :- trabalha_em_base(X, P), senior(X).

% todo que lidera é gerente
gerente(X) :- lidera(X, _P).

% cargo dev + trabalha implica funcionario
funcionario(X) :- cargo(X, dev), trabalha_em_base(X, _P).

% não circularidade (consulta auxiliar)
nao_supervisiona_circular(X, Y) :- supervisiona(X, Y), \+ supervisiona(Y, X).

% elegível horas extras: se horas <= 40
elegivel_horas_extras(X) :- horas(X, N), N =< 40.
