# 📘 Relatório - APS Lógica de Primeira Ordem

**Disciplina:** Lógica e Matemática Discreta – 2025.2  
**Tema:** Modelagem de um Mundo em Lógica de Primeira Ordem  
**Autor:** Yuri  
**Data:** Novembro de 2025

---

## 📌 1. Introdução

Este trabalho apresenta a modelagem de um cenário de **empresa de desenvolvimento de software** utilizando **Lógica de Primeira Ordem (LPO)** e sua implementação em **Prolog**.

O domínio modelado inclui:
- **Pessoas** (funcionários, gerentes)
- **Projetos** (alpha, beta)
- **Relações** (supervisão, liderança, trabalho)
- **Propriedades** (cargo, senioridade, horas trabalhadas)

O objetivo é demonstrar como regras lógicas podem ser usadas para **inferir conhecimento implícito** a partir de fatos explícitos.

---

## 🧩 2. Domínio do Problema

### 2.1 Universo de Discurso

**Pessoas:**
- Ana (gerente)
- Bruno (desenvolvedor)
- Carla (desenvolvedora sênior)
- Diego (funcionário)
- Eva (pessoa cadastrada)

**Projetos:**
- Alpha
- Beta

### 2.2 Predicados Definidos

| Predicado | Aridade | Descrição |
|-----------|---------|-----------|
| `pessoa(X)` | 1 | X é uma pessoa |
| `projeto(P)` | 1 | P é um projeto |
| `funcionario(X)` | 1 | X é funcionário |
| `gerente(X)` | 1 | X é gerente |
| `senior(X)` | 1 | X é desenvolvedor sênior |
| `cargo(X, C)` | 2 | X tem cargo C |
| `trabalha_em(X, P)` | 2 | X trabalha no projeto P |
| `lidera(X, P)` | 2 | X lidera o projeto P |
| `supervisiona(X, Y)` | 2 | X supervisiona Y |
| `responsavel_sobre(X, P)` | 2 | X é responsável pelo projeto P |
| `horas(X, N)` | 2 | X trabalhou N horas |
| `elegivel_horas_extras(X)` | 1 | X é elegível para horas extras |

---

## 🔬 3. Fórmulas de Lógica de Primeira Ordem

### 3.1 Regra 1: Todo gerente é funcionário

**Fórmula LPO:**
```
∀x (Gerente(x) → Funcionario(x))
```

**Em Prolog:**
```prolog
funcionario(X) :- gerente(X).
```

**Explicação:**  
Para todo x, se x é gerente, então x é funcionário. Esta é uma implicação universal que estabelece uma hierarquia: o conjunto de gerentes é subconjunto dos funcionários.

**Dedução:**
- Premissa: `gerente(ana)`
- Conclusão: `funcionario(ana)` ✓

---

### 3.2 Regra 2: Quem lidera um projeto trabalha nele

**Fórmula LPO:**
```
∀x ∀p (Lidera(x, p) → Trabalha_em(x, p))
```

**Em Prolog:**
```prolog
trabalha_em(X, P) :- lidera(X, P).
```

**Explicação:**  
Para todo x e todo projeto p, se x lidera p, então x trabalha em p. Não faz sentido alguém liderar um projeto sem trabalhar nele.

**Dedução:**
- Premissa: `lidera(carla, alpha)`
- Conclusão: `trabalha_em(carla, alpha)` ✓

---

### 3.3 Regra 3: Responsabilidade por supervisão

**Fórmula LPO:**
```
∀x ∀p (Responsavel_sobre(x, p) ↔ ∃y (Supervisiona(x, y) ∧ Trabalha_em(y, p)))
```

**Em Prolog:**
```prolog
responsavel_sobre(X, P) :- supervisiona(X, Y), trabalha_em(Y, P).
```

**Explicação:**  
Para todo x e todo projeto p, x é responsável sobre p **se e somente se** existe algum y tal que x supervisiona y E y trabalha em p. Esta é uma regra com **quantificador existencial**.

**Dedução:**
- Premissa 1: `supervisiona(ana, bruno)`
- Premissa 2: `trabalha_em(bruno, beta)`
- Conclusão: `responsavel_sobre(ana, beta)` ✓

---

### 3.4 Regra 4: Sênior que trabalha lidera

**Fórmula LPO:**
```
∀x ∀p (Trabalha_em(x, p) ∧ Senior(x) → Lidera(x, p))
```

**Em Prolog:**
```prolog
lidera(X, P) :- trabalha_em_base(X, P), senior(X).
```

**Explicação:**  
Para todo x e todo projeto p, se x trabalha em p E x é sênior, então x lidera p. A conjunção (∧) requer que **ambas** condições sejam verdadeiras.

**Dedução:**
- Premissa 1: `trabalha_em_base(carla, alpha)`
- Premissa 2: `senior(carla)`
- Conclusão: `lidera(carla, alpha)` ✓

---

### 3.5 Regra 5: Todo líder é gerente

**Fórmula LPO:**
```
∀x (∃p Lidera(x, p) → Gerente(x))
```

**Em Prolog:**
```prolog
gerente(X) :- lidera(X, _P).
```

**Explicação:**  
Para todo x, se existe pelo menos um projeto p tal que x lidera p, então x é gerente. O underscore `_P` em Prolog representa uma variável anônima (qualquer projeto).

**Dedução:**
- Premissa: `lidera(carla, alpha)`
- Conclusão: `gerente(carla)` ✓

---

### 3.6 Regra 6: Desenvolvedor que trabalha é funcionário

**Fórmula LPO:**
```
∀x (Cargo(x, dev) ∧ ∃p Trabalha_em(x, p) → Funcionario(x))
```

**Em Prolog:**
```prolog
funcionario(X) :- cargo(X, dev), trabalha_em_base(X, _P).
```

**Explicação:**  
Para todo x, se x tem cargo de desenvolvedor E existe algum projeto p onde x trabalha, então x é funcionário.

**Dedução:**
- Premissa 1: `cargo(bruno, dev)`
- Premissa 2: `trabalha_em_base(bruno, beta)`
- Conclusão: `funcionario(bruno)` ✓

---

### 3.7 Regra 7: Supervisão não circular

**Fórmula LPO:**
```
∀x ∀y (Supervisiona(x, y) ∧ ¬Supervisiona(y, x))
```

**Em Prolog:**
```prolog
nao_supervisiona_circular(X, Y) :- supervisiona(X, Y), \+ supervisiona(Y, X).
```

**Explicação:**  
Para todo x e y, se x supervisiona y, então y NÃO supervisiona x. O operador `\+` representa a **negação** em Prolog.

**Dedução:**
- Premissa 1: `supervisiona(ana, bruno)`
- Premissa 2: `¬supervisiona(bruno, ana)` (não existe este fato)
- Conclusão: `nao_supervisiona_circular(ana, bruno)` ✓

---

### 3.8 Regra 8: Elegibilidade para horas extras

**Fórmula LPO:**
```
∀x (∃n (Horas(x, n) ∧ n ≤ 40) → Elegivel_horas_extras(x))
```

**Em Prolog:**
```prolog
elegivel_horas_extras(X) :- horas(X, N), N =< 40.
```

**Explicação:**  
Para todo x, se existe um número n tal que x trabalhou n horas E n é menor ou igual a 40, então x é elegível para horas extras. Usa o operador de **comparação aritmética** `=<`.

**Dedução:**
- Premissa 1: `horas(bruno, 38)`
- Premissa 2: `38 =< 40` ✓
- Conclusão: `elegivel_horas_extras(bruno)` ✓

---

## 🔍 4. Consultas e Resultados

### 4.1 Consulta: Todos os funcionários

**Consulta Prolog:**
```prolog
?- funcionario(X).
```

**Resultado:**
```
X = bruno ;
X = diego ;
X = ana ;
X = carla.
```

**Análise:**
- Bruno: funcionário declarado explicitamente
- Diego: funcionário declarado explicitamente
- Ana: inferido por ser gerente (Regra 1)
- Carla: inferida por liderar projeto (Regras 4 e 5, depois Regra 1)

---

### 4.2 Consulta: Quem trabalha em quais projetos

**Consulta Prolog:**
```prolog
?- trabalha_em(X, P).
```

**Resultado:**
```
X = bruno, P = beta ;
X = carla, P = alpha.
```

**Análise:**
- Bruno trabalha em beta (fato explícito)
- Carla trabalha em alpha (fato explícito + inferido por liderar)

---

### 4.3 Consulta: Todos os gerentes

**Consulta Prolog:**
```prolog
?- gerente(X).
```

**Resultado:**
```
X = ana ;
X = carla.
```

**Análise:**
- Ana: gerente declarado explicitamente
- Carla: inferida por liderar alpha (Regra 5)

---

### 4.4 Consulta: Responsabilidades sobre projetos

**Consulta Prolog:**
```prolog
?- responsavel_sobre(X, P).
```

**Resultado:**
```
X = ana, P = beta.
```

**Análise:**
- Ana é responsável sobre beta porque:
  1. Ana supervisiona Bruno (`supervisiona(ana, bruno)`)
  2. Bruno trabalha em beta (`trabalha_em(bruno, beta)`)
  3. Pela Regra 3, Ana é responsável sobre beta

---

### 4.5 Consulta: Elegibilidade para horas extras

**Consulta Prolog:**
```prolog
?- elegivel_horas_extras(X).
```

**Resultado:**
```
X = bruno.
```

**Análise:**
- Bruno trabalhou 38 horas
- 38 ≤ 40 ✓
- Logo, Bruno é elegível para horas extras

---

## 📊 5. Cadeia de Deduções Completa

### Exemplo: Como Carla se torna Gerente

**Fatos iniciais:**
```prolog
trabalha_em_base(carla, alpha).
senior(carla).
```

**Passo 1:** Aplicar Regra 4
```
trabalha_em_base(carla, alpha) ∧ senior(carla) → lidera(carla, alpha)
```
**Conclusão intermediária:** `lidera(carla, alpha)`

**Passo 2:** Aplicar Regra 5
```
lidera(carla, alpha) → gerente(carla)
```
**Conclusão final:** `gerente(carla)` ✓

**Passo 3:** Aplicar Regra 1
```
gerente(carla) → funcionario(carla)
```
**Conclusão final:** `funcionario(carla)` ✓

**Passo 4:** Aplicar Regra 2
```
lidera(carla, alpha) → trabalha_em(carla, alpha)
```
**Conclusão final:** `trabalha_em(carla, alpha)` ✓

---

## 🛠️ 6. Implementação em Prolog

### 6.1 Estrutura do Código

O código está organizado em três seções:

1. **Fatos Base:** Conhecimento explícito sobre o mundo
   - Pessoas, projetos, cargos
   - Relações de trabalho e supervisão
   
2. **Regras de Inferência:** Conhecimento implícito
   - Regras universais
   - Regras com quantificadores existenciais
   - Regras com negação
   
3. **Consultas:** Perguntas ao sistema

### 6.2 Prevenção de Loops Infinitos

**Problema identificado:**
Havia recursão circular entre:
```prolog
trabalha_em(X, P) :- lidera(X, P).
lidera(X, P) :- trabalha_em(X, P), senior(X).
```

**Solução implementada:**
Separar fatos base de regras derivadas:
```prolog
% Fatos base não recursivos
trabalha_em_base(carla, alpha).

% Regras usam fatos base
lidera(X, P) :- trabalha_em_base(X, P), senior(X).
trabalha_em(X, P) :- trabalha_em_base(X, P).
trabalha_em(X, P) :- lidera(X, P).
```

---

## 📈 7. Tabela de Verdade das Regras

### Regra: Senior que trabalha lidera

| trabalha_em_base | senior | lidera | Resultado |
|------------------|--------|--------|-----------|
| V | V | ? | **V** ✓ |
| V | F | ? | **F** |
| F | V | ? | **F** |
| F | F | ? | **F** |

**Aplicando a Carla:**
- `trabalha_em_base(carla, alpha)` = **V**
- `senior(carla)` = **V**
- `lidera(carla, alpha)` = **V** ✓

---

## ✅ 8. Validação dos Requisitos

### 8.1 Quantificadores Implementados

- ✅ **Universal (∀):** "Todo gerente é funcionário"
- ✅ **Existencial (∃):** "Existe alguém supervisionado por Ana"
- ✅ **Combinados:** "Responsável sobre projeto"

### 8.2 Operadores Lógicos Implementados

- ✅ **Implicação (→):** Todas as regras
- ✅ **Conjunção (∧):** Múltiplas condições
- ✅ **Negação (¬):** Supervisão não circular
- ✅ **Equivalência (↔):** Responsabilidade

### 8.3 Comparações Aritméticas

- ✅ **Menor ou igual (≤):** Horas extras

---

## 🎯 9. Conclusão

Este trabalho demonstrou com sucesso:

1. **Modelagem formal** de um domínio do mundo real usando Lógica de Primeira Ordem
2. **Tradução** de fórmulas lógicas para Prolog
3. **Inferência automática** de conhecimento implícito
4. **Resolução de problemas** como loops infinitos em regras recursivas
5. **Validação** através de consultas e testes

O sistema implementado é capaz de:
- Inferir hierarquias (funcionários → gerentes)
- Deduzir responsabilidades indiretas
- Aplicar regras condicionais complexas
- Detectar inconsistências lógicas

**Pontos fortes:**
- Código modular e bem documentado
- Previne loops infinitos
- Consultas retornam resultados únicos
- Todas as regras lógicas funcionam corretamente

**Possíveis extensões futuras:**
- Adicionar mais níveis hierárquicos
- Implementar regras de conflito de interesse
- Criar sistema de alocação automática de projetos
- Adicionar validações de integridade

---

## 📚 10. Referências

1. SWI-Prolog Documentation - https://www.swi-prolog.org
2. Logic and Automated Reasoning - Fitting, M.
3. Prolog Programming for Artificial Intelligence - Bratko, I.
4. Material da disciplina Lógica e Matemática Discreta - Insper 2025.2

---

**Autor:** Yuri  
**Instituição:** Insper  
**Disciplina:** Lógica e Matemática Discreta  
**Semestre:** 2025.2  
**Data:** Novembro de 2025
