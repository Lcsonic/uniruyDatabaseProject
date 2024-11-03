-- Inserindo dados na tabela Paciente
INSERT INTO paciente (nome_paciente, data_nascimento_paciente, endereco_paciente, telefone_paciente, email_paciente, historico_medico_paciente)
VALUES 
('Lucas Silva', '1990-05-15', 'Rua A, 123, Centro', '11987654321', 'lucas.silva@email.com', 'Histórico de hipertensão leve'),
('Maria Oliveira', '1985-07-22', 'Rua B, 456, Jardim', '11987651234', 'maria.oliveira@email.com', 'Nenhum histórico relevante');

-- Inserindo dados na tabela Medico
INSERT INTO medico (nome_medico, especialidade_medico, telefone_medico, email_medico)
VALUES 
('Dr. João Santos', 'Cardiologia', '11988776655', 'joao.santos@hospital.com'),
('Dra. Ana Costa', 'Pediatria', '11987776655', 'ana.costa@hospital.com');

-- Inserindo dados na tabela Consulta
-- Primeiras consultas para os pacientes
INSERT INTO consulta (id_pacienteFK, id_medicoFK, data_consulta, horario_consulta, status_consulta)
VALUES 
(1, 1, '2024-10-15', '2024-10-15 10:30:00', 'Realizada'),  -- Consulta realizada para Lucas Silva com Dr. João
(2, 2, '2024-10-20', '2024-10-20 11:00:00', 'Agendada');   -- Consulta agendada para Maria Oliveira com Dra. Ana

-- Novas consultas para pacientes terem mais de uma consulta
INSERT INTO consulta (id_pacienteFK, id_medicoFK, data_consulta, horario_consulta, status_consulta)
VALUES 
(1, 1, '2024-10-10', '2024-10-10 09:00:00', 'Realizada'),  -- Primeira consulta adicional para Lucas Silva com Dr. João
(1, 2, '2024-10-22', '2024-10-22 14:00:00', 'Agendada'),   -- Segunda consulta adicional para Lucas Silva com Dra. Ana
(2, 2, '2024-09-15', '2024-09-15 08:30:00', 'Realizada'),  -- Primeira consulta adicional para Maria Oliveira com Dra. Ana
(2, 1, '2024-10-25', '2024-10-25 10:30:00', 'Agendada');   -- Segunda consulta adicional para Maria Oliveira com Dr. João

-- Inserindo dados na tabela Pagamento
-- Pagamentos para consultas realizadas e pagas
INSERT INTO pagamento (id_consultaFK, valor_pagamento, data_pagamento, pago)
VALUES 
(1, 150.00, '2024-10-15', TRUE),  -- Pagamento feito para consulta de Lucas Silva com Dr. João
(3, 120.00, '2024-10-10', TRUE),  -- Pagamento feito para consulta adicional de Lucas Silva
(5, 110.00, '2024-09-15', TRUE);  -- Pagamento feito para consulta adicional de Maria Oliveira

-- Inserindo dados na tabela Registro Médico
-- Registros médicos apenas para consultas realizadas e pagas
INSERT INTO registroMedico (id_consultaFK, prescricao_registro, observacao_registro)
VALUES 
(1, 'Prescrição de medicamentos para controle da pressão', 'Paciente deve retornar em 30 dias'),
(3, 'Recomendada atividade física moderada', 'Pressão controlada após tratamento'),
(5, 'Prescrito suplemento vitamínico', 'Paciente em estado saudável para a idade');
