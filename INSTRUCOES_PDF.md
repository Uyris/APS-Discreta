# 📄 Como Converter o Relatório para PDF

## Opção 1: Usando Pandoc (Recomendado)

### Instalar Pandoc
```powershell
winget install pandoc
```

### Converter para PDF
```powershell
pandoc relatorio.md -o relatorio.pdf --pdf-engine=xelatex -V geometry:margin=1in
```

### Com formatação melhorada
```powershell
pandoc relatorio.md -o relatorio.pdf --pdf-engine=xelatex -V geometry:margin=1in -V fontsize=11pt --toc --toc-depth=2
```

## Opção 2: Usando VS Code + Extensão

1. Instale a extensão "Markdown PDF"
2. Abra o arquivo `relatorio.md`
3. Pressione `Ctrl+Shift+P`
4. Digite "Markdown PDF: Export (pdf)"
5. Selecione e aguarde a conversão

## Opção 3: Online (Rápido)

1. Acesse: https://www.markdowntopdf.com/
2. Ou: https://md2pdf.netlify.app/
3. Cole o conteúdo do relatorio.md
4. Clique em "Convert" e faça download

## Opção 4: GitHub (Gratuito)

1. Faça push do repositório para GitHub
2. O GitHub renderiza Markdown automaticamente
3. Use Print > Save as PDF no navegador

## 📋 Checklist Final

Antes de entregar, verifique:

- [ ] relatorio.pdf gerado e revisado
- [ ] Screenshots capturados e salvos na pasta screenshots/
- [ ] README.md atualizado
- [ ] Código empresa.pl sem erros
- [ ] Testes executando corretamente
- [ ] Commit e push no GitHub (opcional)

## 🎨 Dicas de Formatação

Se usar Pandoc, você pode adicionar um arquivo de estilo:

```yaml
---
title: "Relatório APS - Lógica de Primeira Ordem"
author: "Yuri"
date: "Novembro 2025"
geometry: margin=1in
fontsize: 11pt
---
```

Adicione isso no topo do relatorio.md antes da conversão.
