-- Exemplo de uso do sistema onde as ações no backend dão trigger as querys
--no banco de dados

-- Cenário
-- Gerar relatório de pagamentos

--  Campos como quantidade de dias do atestado deve vim do backend.-- Geração de relatório de pagamentos
SELECT pagamento.id_pagamento, paciente.nome_paciente, pagamento.valor_pagamento, pagamento.data_pagamento
FROM pagamento
JOIN consulta ON pagamento.id_consultaFK = consulta.id_consulta
JOIN paciente ON consulta.id_pacienteFK = paciente.id_paciente
WHERE pagamento.data_pagamento BETWEEN '2024-09-15' AND '2024-10-15';  -- Período desejado
