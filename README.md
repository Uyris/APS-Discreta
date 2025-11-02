# 🧠 APS — Lógica de Primeira Ordem (Prolog)

Disciplina: Lógica e Matemática Discreta – 2025.2
Tema: Modelagem de um Mundo em Lógica de Primeira Ordem
Autor: Yuri

## 📘 Descrição

Este projeto modela um cenário de empresa de desenvolvimento de software utilizando Lógica de Primeira Ordem (LPO) e implementa a base de conhecimento em Prolog.

A base inclui fatos e regras sobre funcionários, cargos, projetos, supervisão e liderança — permitindo inferências automáticas como:

Quem é gerente?

Quem supervisiona quem?

Quem é responsável por determinado projeto?

Quem é elegível para horas extras?

## 🧩 Estrutura do Repositório
```
.
├── empresa.pl           # Base de conhecimento em Prolog
├── relatorio.pdf        # Relatório com fórmulas, deduções e explicações
├── README.md            # Este arquivo
└── screenshots/         # Prints das consultas no SWI-Prolog
```

## ▶️ Como Executar


Inicie o interpretador:
```
swipl
```


Carregue a base de conhecimento:

?- [empresa].

💻 Exemplos de Uso

```
🔹 Consultar se alguém é gerente
?- gerente(ana).
true.

🔹 Consultar se alguém é funcionário (mesmo que só tenha sido declarado gerente)
?- funcionario(ana).
true.        % inferido pela regra "todo gerente é funcionário"

🔹 Ver quem lidera projetos
?- lidera(X, P).
X = carla,
P = alpha.

🔹 Descobrir se alguém é responsável por um projeto (via supervisão indireta)
?- responsavel_sobre(ana, P).
P = beta.

🔹 Consultar elegibilidade para horas extras
?- elegivel_horas_extras(bruno).
true.        % trabalha 38h

🔹 Consultar todos os supervisionados por Ana
?- supervisiona(ana, Quem).
Quem = bruno ;
Quem = diego.

🔹 Descobrir se há circularidade na supervisão
?- nao_supervisiona_circular(ana, diego).
true.
```

## 📄 Regras Principais Implementadas
- Regra	Descrição	Código / Fórmula
-	Todo gerente é funcionário	funcionario(X) :- gerente(X).
-	Gerente supervisiona pelo menos um funcionário	supervisiona(ana, bruno). supervisiona(ana, diego).
-	Quem lidera trabalha no projeto	trabalha_em(X,P) :- lidera(X,P).
-	Supervisão + trabalho → responsabilidade	responsavel_sobre(X,P) :- supervisiona(X,Y), trabalha_em(Y,P).
-	Sênior pode liderar o projeto	lidera(X,P) :- trabalha_em(X,P), senior(X).
-	Quem lidera é gerente	gerente(X) :- lidera(X,_).
-	Dev que trabalha é funcionário	funcionario(X) :- cargo(X,dev), trabalha_em(X,_).
10	Elegibilidade horas extras	elegivel_horas_extras(X) :- horas(X,N), N =< 40.
## 📊 Deduções Demonstradas
```
De gerente(ana)
Inferimos: ∃y (Funcionario(y) ∧ Supervisiona(ana,y))
(Ana supervisiona alguém)

De lidera(carla, alpha)
Inferimos: Gerente(carla)
(Todo líder é gerente)
```
## 📚 Créditos

Base de conhecimento e deduções por (Seu nome)

SWI-Prolog: https://www.swi-prolog.org

Trabalho acadêmico da disciplina Lógica e Matemática Discreta – Universidade Paulista / 2025.2

## 🧾 Licença

Este projeto é de uso acadêmico. Modifique e compartilhe livremente, desde que cite o autor original.

Quer que eu gere também o arquivo README.md pronto para download (em formato .md) junto com o relatorio.md para conversão em PDF?