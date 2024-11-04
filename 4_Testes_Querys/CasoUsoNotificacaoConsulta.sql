-- Exemplo de uso do sistema onde as ações no backend dão trigger as querys
--no banco de dados

-- Cenário
-- Gerar Notificação de consulta no dia seguinte

-- Selecionar pacientes com consultas agendadas para o dia seguinte
SELECT paciente.nome_paciente, consulta.data_consulta, consulta.horario_consulta
FROM consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
WHERE consulta.data_consulta = CURRENT_DATE + INTERVAL '1 day' AND consulta.status_consulta = 'Agendada';

-- Retorna nada se não existir consultas no dia seguinte.

-- Esse cenário pode ser executado uma vez no dia pelo sistema
-- para armazenar em cache todas as consultas par ao proximo dia
-- e assim gerar notificações por alguma lógica do backend.