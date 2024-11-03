
-- Tabela Paciente
CREATE TABLE paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_paciente VARCHAR(100) NOT NULL,
    data_nascimento_paciente DATE NOT NULL,
    endereco_paciente VARCHAR(255) NOT NULL,
    telefone_paciente VARCHAR(20),
    email_paciente VARCHAR(100) NOT NULL,
    historico_medico_paciente TEXT
);

-- Tabela Medico
CREATE TABLE medico (
    id_medico SERIAL PRIMARY KEY,
    nome_medico VARCHAR(100) NOT NULL,
    especialidade_medico VARCHAR(100) NOT NULL,
    telefone_medico VARCHAR(20) NOT NULL,
    email_medico VARCHAR(100) NOT NULL
);

-- Tabela Consulta
CREATE TABLE consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_pacienteFK INTEGER NOT NULL REFERENCES paciente(id_paciente),
    id_medicoFK INTEGER NOT NULL REFERENCES medico(id_medico),
    data_consulta DATE NOT NULL,
    horario_consulta TIMESTAMP NOT NULL,
    status_consulta VARCHAR(20) NOT NULL
);

-- Tabela Registro Médico
CREATE TABLE registroMedico (
    id_registro SERIAL PRIMARY KEY,
    id_consultaFK INTEGER NOT NULL REFERENCES consulta(id_consulta),
    prescricao_registro TEXT NOT NULL,
    observacao_registro TEXT NOT NULL
);

-- Tabela Pagamento
CREATE TABLE pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_consultaFK INTEGER NOT NULL REFERENCES consulta(id_consulta),
    valor_pagamento NUMERIC(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    pago BOOLEAN NOT NULL
);
