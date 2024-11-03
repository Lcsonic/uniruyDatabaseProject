-- Exemplo de uso do sistema onde as ações no backend dão trigger as querys
--no banco de dados

-- Cenário:
-- Consulta marcada, realizada e paga.

-- Fluxo de Ações
-- Cadastro de Paciente: Maria se cadastra no sistema.
-- Cadastro de Médico: Um novo médico é adicionado ao sistema.
-- Agendamento de Consulta: Maria agenda uma consulta com o novo médico.
-- Consulta Realizada: Maria comparece à consulta.
-- Registro Médico: O médico registra as informações relevantes após a consulta.
-- Pagamento: Maria realiza o pagamento pela consulta.

-- 1. Cadastro de um novo paciente
INSERT INTO paciente (nome_paciente, data_nascimento_paciente, endereco_paciente, telefone_paciente, email_paciente, historico_medico_paciente)
VALUES 
('Matheus Fonsceca', '1985-07-22', 'Rua B, 456, Jardim', '11987651234', 'matheus.123Fon@email.com', 'Nenhum histórico relevante');

-- 2. Cadastro de um novo médico
INSERT INTO medico (nome_medico, especialidade_medico, telefone_medico, email_medico)
VALUES 
('Dra. Clara Lima', 'Dermatologia', '11999887766', 'clara.lima@hospital.com');

-- 3. Agendamento de uma nova consulta
INSERT INTO consulta (id_pacienteFK, id_medicoFK, data_consulta, horario_consulta, status_consulta)
VALUES 
(3, 3, '2024-11-05', '2024-11-05 15:00:00', 'Agendada');  -- Maria agendou uma consulta com Dra. Clara

-- 4. Consulta realizada (após a data da consulta)
-- Simulando que a consulta foi realizada
UPDATE consulta
SET status_consulta = 'Realizada'
WHERE id_consulta = 5;  -- Substitua pelo ID correto se necessário

-- 5. Registro médico para a consulta realizada
INSERT INTO registroMedico (id_consultaFK, prescricao_registro, observacao_registro)
VALUES 
(5, 'Creme hidratante recomendado para a pele', 'Orientação sobre cuidados com a pele fornecida.');

-- 6. Pagamento da consulta realizada
INSERT INTO pagamento (id_consultaFK, valor_pagamento, data_pagamento, pago)
VALUES 
(5, 200.00, '2024-11-05', TRUE);  -- Pagamento feito por Maria para a consulta com Dra. Clara

-- 7. Listar informações da consulta de Maria após todo o processo
SELECT consulta.id_consulta, consulta.data_consulta, consulta.horario_consulta, consulta.status_consulta,
       paciente.nome_paciente, medico.nome_medico, registroMedico.prescricao_registro, pagamento.valor_pagamento
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico
LEFT JOIN registroMedico ON consulta.id_consulta = registroMedico.id_consultaFK
LEFT JOIN pagamento ON consulta.id_consulta = pagamento.id_consultaFK
WHERE paciente.nome_paciente = 'Matheus Fonsceca';
