# ⚔️ APS — Lógica de Primeira Ordem: Warcraft III

**Disciplina:** Lógica e Matemática Discreta – 2025.2  
**Tema:** Modelagem do Universo de Warcraft III em Lógica de Primeira Ordem  
**Autor:** Yuri & Matheus  
**Instituição:** Insper

---

## 📘 Descrição

Este projeto modela o universo épico do jogo **Warcraft III: Reign of Chaos** utilizando **Lógica de Primeira Ordem (LPO)** e implementando a base de conhecimento em **Prolog**.

### 🎮 O que é modelado:

- **⚔️ Heróis e Vilões:** Arthas, Thrall, Jaina, Illidan, Mal'Ganis
- **🗡️ Artefatos Mágicos:** Frostmourne (espada amaldiçoada), Tome of Power
- **💀 Transformações:** A queda de Arthas e sua transformação em Lich King
- **🔪 Traições:** O assassinato do Rei Terenas por seu próprio filho
- **⚔️ Facções:** Scourge (mortos-vivos), Humanos, Orcs, Night Elves, Demônios
- **🌍 Raças:** Humans, Orcs, Night Elves, Undead, Demons

O sistema permite **inferências automáticas**, deduzindo conhecimento implícito através de regras lógicas, como:
- Quem foi corrompido pela Frostmourne?
- Quem se tornou o Lich King?
- Quem é traidor?
- Quais são as inimizades entre personagens?

---

## 🧩 Estrutura do Repositório
```
APS-Discreta/
├── war3.pl                   # Base de conhecimento - Warcraft III
├── testes_war3.pl            # Testes automatizados
├── relatorio.md              # Relatório completo com fórmulas LPO
├── README.md                 # Este arquivo
└── screenshots/              # Prints das consultas no SWI-Prolog
```

## ▶️ Como Executar

### Pré-requisitos
- **SWI-Prolog** instalado: https://www.swi-prolog.org/Download.html

### Método 1: Testes Automatizados (Recomendado) ⚡

Execute todos os testes de uma vez:
```powershell
swipl -s testes_war3.pl
```

Ou, se estiver na pasta do projeto:
```powershell
& "C:\Program Files\swipl\bin\swipl.exe" -s testes_war3.pl
```

### Método 2: Modo Interativo 🎮

**1. Abrir o interpretador:**
```powershell
swipl -s war3.pl
```

**2. Fazer consultas manualmente:**
```prolog
?- hero(X).           % listar todos os heróis
?- traitor(arthas).   % verificar se Arthas é traidor
?- halt.              % sair
```

---

## 💻 Exemplos de Uso

### 🎮 Consultas Básicas

```prolog
🔹 Ver todos os heróis
?- hero(X).
X = arthas ;
X = jaina ;
X = thrall ;
X = illidan.

🔹 Listar todas as raças
?- human(X).
X = arthas ;
X = jaina.

?- orc(X).
X = thrall.

?- nightelf(X).
X = maiev ;
X = tyrande.
```

### ⚔️ A Queda de Arthas

```prolog
🔹 Verificar quem empunha Frostmourne
?- wields(X, frostmourne).
X = arthas.

🔹 Verificar quem foi corrompido
?- corrupted_by(X, frostmourne).
X = arthas.        % corrompido pela espada!

🔹 Ver quem se tornou Lich Figure
?- became(X, lich_figure).
X = arthas.        % transformado!

🔹 Ver quem se tornou Lich King
?- became(X, lich_king).
X = arthas.        % o rei morto-vivo!
```

### � Traição e Morte

```prolog
�🔹 Descobrir traidores
?- traitor(X).
X = arthas.        % matou o próprio pai!

🔹 Ver quem matou quem
?- killed(X, Y).
X = arthas, Y = king_terenas.

🔹 Verificar quem comanda o Scourge
?- commands(X, scourge).
X = arthas.        % líder dos mortos-vivos
```

### 🌟 Artefatos e Poder

```prolog
🔹 Listar todos os artefatos
?- artifact(X).
X = frostmourne ;
X = tome_of_power.

🔹 Ver quem busca poder
?- seeks(X, tome_of_power).
X = illidan.

🔹 Verificar inimizades
?- enemy_of(X, Y).
X = illidan, Y = nightelves.
```

### 😈 Demônios vs Heróis

```prolog
🔹 Ver quem NÃO é herói
?- not_hero(X).
X = malganis.      % demônios não são heróis!

🔹 Verificar se alguém é demônio
?- demon(X).
X = malganis.
```

## 📄 Regras Lógicas Implementadas

| # | Regra | Fórmula LPO | Código Prolog |
|---|-------|-------------|---------------|
| 1 | Corrupção por Frostmourne | `∀x (Wields(x, frostmourne) → Corrupted(x))` | `corrupted_by(X, frostmourne) :- wields(X, frostmourne).` |
| 2 | Corrompido vira Lich | `∀x (Corrupted(x, frostmourne) → Became(x, lich_figure))` | `became(X, lich_figure) :- corrupted_by(X, frostmourne).` |
| 3 | Matar rei = traidor | `∀x (∃y (Killed(x,y) ∧ King(y)) → Traitor(x))` | `traitor(X) :- killed(X, Y), king(Y).` |
| 4 | Demônio não é herói | `∀x (Demon(x) → ¬Hero(x))` | `not_hero(X) :- demon(X).` |
| 5 | Líder comanda | `∀x,y (Leader_of(x,y) → Commands(x,y))` | `commands(X,Y) :- leader_of(X,Y).` |
| 6 | Lich que lidera = Lich King | `∀x (Became(x, lich_figure) ∧ Leader_of(x, scourge) → Became(x, lich_king))` | `became(X, lich_king) :- became(X, lich_figure), leader_of(X, scourge).` |
| 7 | Buscar tomo = inimigo dos Night Elves | `∀x (Seeks(x, tome_of_power) → Enemy_of(x, nightelves))` | `enemy_of(illidan, nightelves) :- seeks(illidan, tome_of_power).` |

---

## 📊 A Tragédia de Arthas: Cadeia de Deduções

### ⚔️ **Como Arthas se torna o Lich King**
```
📖 PARTE 1: A Corrupção
──────────────────────
Fato inicial: wields(arthas, frostmourne)
              ↓ Regra 1: Quem empunha Frostmourne fica corrompido
        corrupted_by(arthas, frostmourne)
              ↓ Regra 2: Corrompidos viram Lich Figure
        became(arthas, lich_figure)

📖 PARTE 2: A Ascensão ao Poder
──────────────────────────────
Fatos: became(arthas, lich_figure) ∧ leader_of(arthas, scourge)
              ↓ Regra 6: Lich Figure que lidera Scourge vira Lich King
        became(arthas, lich_king)  👑💀

📖 PARTE 3: A Traição
────────────────────
Fatos: killed(arthas, king_terenas) ∧ king(king_terenas)
              ↓ Regra 3: Quem mata um rei é traidor
        traitor(arthas)  🔪

🎭 CONCLUSÃO: Arthas é simultaneamente:
   - Corrompido pela Frostmourne ✓
   - Lich King (rei dos mortos-vivos) ✓
   - Traidor (matou o próprio pai) ✓
   - Comandante do Scourge ✓
```
## 🎯 Conceitos de Lógica Demonstrados

### ✅ Quantificadores
- **Universal (∀):** "Quem empunha Frostmourne fica corrompido"
- **Existencial (∃):** "Se mata algum rei, é traidor"

### ✅ Operadores Lógicos
- **Implicação (→):** Todas as regras condicionais (corrupção → transformação)
- **Conjunção (∧):** Múltiplas condições (ex: `lich_figure ∧ leader_of → lich_king`)
- **Negação (¬):** "Demônio não é herói"

### ✅ Tipos de Regras
- **Transitividade:** Corrupção → Lich Figure → Lich King
- **Composição:** Duas condições necessárias para Lich King
- **Classificação:** Diferentes raças e tipos de personagens

### ✅ Inferência Lógica
- **Modus Ponens:** Se P → Q e P é verdade, então Q é verdade
- **Cadeia de inferências:** Múltiplas regras aplicadas sequencialmente
- **Closed World Assumption:** O que não está declarado é falso (ex: Jaina não é corrupta)

---

## 🛠️ Tecnologias

- **Linguagem:** Prolog (SWI-Prolog 9.x)
- **Paradigma:** Programação Lógica
- **Sistema:** Windows PowerShell

---

## 🎮 Sobre Warcraft III

**Warcraft III: Reign of Chaos** é um jogo de estratégia em tempo real desenvolvido pela Blizzard Entertainment (2002). A história de Arthas Menethil, príncipe de Lordaeron que se torna o Lich King, é uma das narrativas mais trágicas e icônicas dos videogames.

Este projeto demonstra como **Lógica de Primeira Ordem** pode modelar narrativas complexas e suas consequências lógicas.

---

## 📚 Referências

1. **SWI-Prolog Documentation** - https://www.swi-prolog.org
2. **Logic and Automated Reasoning** - Fitting, M.
3. **Prolog Programming for Artificial Intelligence** - Bratko, I.
4. **Warcraft III: Reign of Chaos** - Blizzard Entertainment, 2002
5. **Material da disciplina** - Lógica e Matemática Discreta, Insper 2025.2

---

## 👨‍💻 Autor

**Yuri**  
Insper - Ciência da Computação  
Lógica e Matemática Discreta - 2025.2

---

## 🧾 Licença

Este projeto é de uso **acadêmico**.  
Sinta-se livre para estudar, modificar e compartilhar, desde que cite o autor original.

---

## 📝 Notas Finais

### ✅ Status do Projeto
- ✅ Todas as regras lógicas implementadas e funcionais
- ✅ Testes automatizados com saída formatada
- ✅ Cadeia de deduções completa (Arthas → Lich King)
- ✅ Negação por falha implementada (demônios não são heróis)
- ✅ Documentação completa

### 🎯 Resultados Esperados
Ao executar `swipl -s testes_war3.pl`, você verá:
- 4 heróis identificados
- A transformação completa de Arthas
- 1 traidor (Arthas)
- Todas as raças e facções
- Inimizades derivadas logicamente

### 🔮 Possíveis Extensões
- Adicionar mais personagens (Uther, Ner'zhul, Archimonde)
- Modelar batalhas e conflitos
- Implementar linha do tempo de eventos
- Adicionar regras de alianças e traições múltiplas

**Status:** ✅ **Completo e Funcional**

Para mais detalhes técnicos e fórmulas completas de LPO, consulte o arquivo `relatorio.md`.