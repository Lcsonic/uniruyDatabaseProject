-- 1. Listar todos os pacientes
SELECT * FROM paciente;

-- 2. Listar todos os médicos
SELECT * FROM medico;

-- 3. Listar todas as consultas com informações de paciente e médico
SELECT consulta.id_consulta, consulta.data_consulta, consulta.horario_consulta, consulta.status_consulta,
       paciente.nome_paciente, medico.nome_medico
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico;

-- 4. Listar todas as consultas realizadas e pagas
SELECT consulta.id_consulta, consulta.data_consulta, consulta.horario_consulta, consulta.status_consulta,
       paciente.nome_paciente, medico.nome_medico
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico
JOIN pagamento ON consulta.id_consulta = pagamento.id_consultaFK
WHERE consulta.status_consulta = 'Realizada' AND pagamento.pago = TRUE;

-- 5. Listar todos os registros médicos com informações do paciente e consulta
SELECT registroMedico.id_registro, registroMedico.prescricao_registro, registroMedico.observacao_registro,
       paciente.nome_paciente, consulta.data_consulta, consulta.horario_consulta
FROM registroMedico
JOIN consulta ON registroMedico.id_consultaFK = consulta.id_consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente;

-- 6. Listar todos os pagamentos com o status das consultas e informações de paciente
SELECT pagamento.id_pagamento, pagamento.valor_pagamento, pagamento.data_pagamento, pagamento.pago,
       consulta.status_consulta, paciente.nome_paciente
FROM pagamento
JOIN consulta ON pagamento.id_consultaFK = consulta.id_consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente;

-- 7. Listar consultas futuras (agendadas) com informações do paciente e do médico
SELECT consulta.id_consulta, consulta.data_consulta, consulta.horario_consulta, consulta.status_consulta,
       paciente.nome_paciente, medico.nome_medico
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico
WHERE consulta.status_consulta = 'Agendada';

-- 8. Contar o número de consultas por paciente
SELECT paciente.nome_paciente, COUNT(consulta.id_consulta) AS numero_de_consultas
FROM paciente
JOIN consulta ON paciente.id_paciente = consulta.id_pacienteFK
GROUP BY paciente.nome_paciente;