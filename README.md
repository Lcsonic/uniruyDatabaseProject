# uniruyDatabaseProject
Repositório para armazenar projeto final da disciplina de banco de dados ministrada por Célio na instituição UNIRUY

Aluno - Lucas Araújo Santos
Matrícula - 202304266921

Projeto -----
  Sistema de gerenciamento de consultas médicas

Descrição -----
  Agendamento de consultas, histórico de pacientes, registros médicos e controle de pagamentos.

Softwares utilizados
  Linguagem do banco: PostgreSQL versão 16
  Site para diagrama e modelagem: db.diagram.io
  Framework de gerenciamento de banco de dados: pgAdmin4

Esquema de Diretório do projeto

Abrir em um editor de código para o diagrama ficar formatado correto

  GerenciamentoConsultasMedicas/
  ├── Documentacao/
  │   ├── Requisitos.md
  │   ├── ModeloConceitual_ER.md
  │   ├── ModeloLogico.md
  │   ├── EspecificacaoTabelas.md
  │   └── RelatorioDescritivo.md
  ├── Diagrama/
  │   ├── conceitualER.png
  │   ├── logicoRelacional.png
  │   └── pdfs/
  │       ├── conceitualER.pdf
  │       └── logicoRelacional.pdf
  ├── scriptsSQL/
  │   ├── LeiaME.md
  │   ├── ExemploLeiaMe.JPG
  │   └── scripts/
  │       ├── createTables.sql
  │       ├── inserts.sql
  │       └── selects.sql
  └── Testes/
      ├── CasoUsoPadrao.sql
      └── CasoUsoCancelamento.sql


Disclaimer: Vale lembrar que esse é um modelo inicial do sistema e pode futuramente receber atualizações e futuras implementações.

Possiveis atualizações fora do escopo do tabalho:

  Marcar Exames:
    Exames só podem ser marcados caso consulta ja esteja realizada.

  
