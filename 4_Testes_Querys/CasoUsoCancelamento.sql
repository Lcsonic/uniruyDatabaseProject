-- Exemplo de uso do sistema onde as ações no backend dão trigger as querys
--no banco de dados

-- Cenario:
-- Consulta é marcada, mas posteiormente cancelada

-- Fluxo de Ações para Consulta Cancelada
-- Agendamento de Consulta: Maria agenda uma nova consulta.
-- Cancelamento de Consulta: Maria decide cancelar a consulta.
-- Registro do Cancelamento: O sistema registra o status da consulta como cancelada.

-- 1. Cadastro de um novo paciente (se necessário)
INSERT INTO paciente (nome_paciente, data_nascimento_paciente, endereco_paciente, telefone_paciente, email_paciente, historico_medico_paciente)
VALUES 
('Davi Caua', '1985-07-22', 'Rua Acajutiba, 7, Jardim', '11987651234', 'davi.caua@email.com', 'Nenhum histórico relevante');

-- 2. Agendamento de uma nova consulta
INSERT INTO consulta (id_pacienteFK, id_medicoFK, data_consulta, horario_consulta, status_consulta)
VALUES 
(4, 3, '2024-11-10', '2024-11-10 09:00:00', 'Agendada');  -- Maria agendou uma consulta com Dra. Clara

-- 3. Cancelamento da consulta
UPDATE consulta
SET status_consulta = 'Cancelada'
WHERE id_consulta = 6;  -- Substitua pelo ID correto da nova consulta de Maria

-- 4. Listar informações da consulta de Maria após o cancelamento
SELECT consulta.id_consulta, consulta.data_consulta, consulta.horario_consulta, consulta.status_consulta,
       paciente.nome_paciente, medico.nome_medico
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico
WHERE paciente.nome_paciente = 'Davi Caua';
