# 📸 Screenshots - Guia de Captura

## Como gerar as screenshots para o projeto

### Screenshots necessários:

1. **screenshot_01_carregamento.png**
   - Captura do SWI-Prolog carregando o arquivo empresa.pl
   - Comando: `swipl -s empresa.pl`

2. **screenshot_02_funcionarios.png**
   - Consulta: `?- funcionario(X).`
   - Mostra: ana, bruno, carla, diego

3. **screenshot_03_trabalha_em.png**
   - Consulta: `?- trabalha_em(X, P).`
   - Mostra: bruno em beta, carla em alpha

4. **screenshot_04_gerentes.png**
   - Consulta: `?- gerente(X).`
   - Mostra: ana, carla

5. **screenshot_05_lidera.png**
   - Consulta: `?- lidera(X, P).`
   - Mostra: carla lidera alpha

6. **screenshot_06_responsavel.png**
   - Consulta: `?- responsavel_sobre(X, P).`
   - Mostra: ana responsável por beta

7. **screenshot_07_horas_extras.png**
   - Consulta: `?- elegivel_horas_extras(X).`
   - Mostra: bruno

8. **screenshot_08_supervisao.png**
   - Consulta: `?- nao_supervisiona_circular(X, Y).`
   - Mostra: ana supervisiona bruno e diego

9. **screenshot_09_deducao_carla.png**
   - Sequência de consultas mostrando como Carla se torna gerente:
   ```prolog
   ?- senior(carla).
   ?- trabalha_em_base(carla, alpha).
   ?- lidera(carla, alpha).
   ?- gerente(carla).
   ```

10. **screenshot_10_testes_completos.png**
    - Execução do arquivo testes.pl
    - Comando: `swipl -s testes.pl`

## 🎯 Como capturar

### Opção 1: Manual
1. Abra o SWI-Prolog: `swipl -s empresa.pl`
2. Execute cada consulta
3. Use Print Screen ou Snipping Tool (Win + Shift + S)
4. Salve na pasta screenshots/

### Opção 2: Executar e printar os resultados
Execute o arquivo testes.pl e capture a saída completa:
```powershell
& "C:\Program Files\swipl\bin\swipl.exe" -s testes.pl
```

## 📝 Dicas
- Use fundo escuro para melhor visualização
- Certifique-se que o prompt `?-` está visível
- Inclua o resultado completo de cada consulta
- Nomeie os arquivos conforme a lista acima
