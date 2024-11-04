-- Exemplo de uso do sistema onde as ações no backend dão trigger as querys
--no banco de dados

-- Cenário
-- Emissão de atestado após conclusão da consulta
-- Observação:
--  Realizo no momento atual a falta do campo responsavel pelo sintoma
-- do paciente;
--  Campos como quantidade de dias do atestado deve vim do backend.

-- Emissão de atestado (filtro pelo id da consulta)
SELECT 
    CONCAT('Atestado Médico', '\n',
           'Eu, ', medico.nome_medico, ', CRM: 12345, atesto que ', paciente.nome_paciente, 
           ' esteve sob meus cuidados e apresenta sintomas (adicionar campo depois). Atestado válido por 5 dias (parametro configurado no backend).',
           '\nData: ', CURRENT_DATE) AS atestado
FROM registroMedico
JOIN consulta ON registroMedico.id_consultaFK = consulta.id_consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
JOIN medico ON consulta.id_medicoFK = medico.id_medico
WHERE consulta.id_consulta = 3;  -- Substitua pelo ID consulta realizada