--1. Listar alunos ordenados por nome e data de nascimento
SELECT nome, data_nascimento
    FROM aluno
    ORDER BY nome ASC, data_nascimento DESC;

--2. Listar professores e suas especialidades em ordem decrescente
SELECT nome, especialidade
    FROM professor
    ORDER BY nome DESC;

--3. Listar disciplinas ordenadas por carga horária
SELECT nome, carga_horaria
    FROM disciplina
    ORDER BY carga_horaria DESC;

--4. Contar o número de alunos em cada status de matrícula
SELECT 
    status,
    COUNT(*) AS Numero_de_Alunos
FROM 
    matricula
GROUP BY 
    status;

--5. Listar cursos com a soma total da carga horária de suas disciplinas
SELECT 
    c.nome AS Nome_Curso,
    SUM(d.carga_horaria) AS Carga_Horaria_Total
FROM 
    curso c
JOIN 
    disciplina d ON c.id_curso = d.id_curso
GROUP BY 
    c.nome;

--6. Contar quantos professores estão lecionando mais de 3 turmas
SELECT
    p.nome AS Nome_Professor,
    COUNT(t.id_turma) AS Turma_Total
FROM
    professor p
JOIN
    turma t ON p.id_professor = t.id_professor
GROUP BY
    p.nome
HAVING 
    COUNT(t.id_turma) > 3;

--7. Listar os alunos matriculados em mais de uma disciplina
SELECT
    a.nome AS Nome_Aluno,
    COUNT(m.id_disciplina) AS Numero_Disciplina
FROM
    aluno a
JOIN
    matricula m ON a.id_aluno = m.id_aluno
GROUP BY
    a.nome
HAVING
    COUNT(m.id_disciplina) > 1
ORDER BY
    Numero_Disciplina DESC;

--8. Listar cursos com mais de 2000 horas de carga horária
SELECT
    c.nome,
    SUM(d.carga_horaria) AS soma_carga_horaria
FROM
    curso c
JOIN
    disciplina d ON c.id_curso = d.id_curso
GROUP BY
    c.nome
HAVING
    SUM(d.carga_horaria) > 2000;
SELECT * FROM curso;
SELECT * FROM disciplina;

--9. Contar o número total de turmas e listar por professor
SELECT
    p.nome,
    COUNT(t.id_turma) AS numero_de_turmas
FROM
    professor p
JOIN
    turma t ON p.id_professor = t.id_professor
GROUP BY
    p.nome
ORDER BY
    COUNT(t.id_turma) DESC;

--10. Listar disciplinas e a média da carga horária por curso
SELECT
    c.nome AS nome_da_disciplina,
    AVG(d.carga_horaria) AS media_de_carga_horaria
FROM
    curso c
JOIN
    disciplina d ON c.id_curso = d.id_curso
GROUP BY
    c.nome;

--11. Exibir os alunos e seus respectivos status de matrícula, ordenados pelo status e pela data de matrícula
SELECT
    a.nome,
    m.status,
    m.data_matricula
FROM
    aluno a
JOIN
    matricula m ON a.id_aluno = m.id_aluno
ORDER BY
    m.status ASC, m.data_matricula DESC;

--12. Exibir a idade dos alunos ordenados da maior para a menor idade
SELECT
    nome,
    data_nascimento,
    FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade
FROM
    aluno
ORDER BY
    data_nascimento asc;

--13. Exibir as disciplinas e o número de alunos matriculados em cada uma
SELECT
    d.nome AS nome_da_disciplina,
    COUNT(m.id_aluno) AS numero_de_matriculas
FROM
    disciplina d
JOIN
    matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY
    d.nome
ORDER BY
    COUNT(m.id_aluno) DESC;

--14. Listar as turmas com o nome dos professores e disciplinas, ordenadas por horário
SELECT
    p.nome AS nome_do_professor,
    d.nome AS nome_da_materia,
    t.horario
FROM
    professor p
JOIN
    turma t ON p.id_professor = t.id_professor
JOIN
    disciplina d ON t.id_disciplina = d.id_disciplina
ORDER BY
    t.horario ASC;

--15. Contar quantas disciplinas têm carga horária superior a 80 horas
SELECT
    nome,
    carga_horaria
FROM
    disciplina
WHERE
    carga_horaria > 80;
SELECT * FROM disciplina;

--16. Listar os cursos e a quantidade de disciplinas que cada curso possui
SELECT
    c.nome AS nome_do_curso,
    COUNT(d.id_disciplina) AS numero_de_disciplinas
FROM
    curso c
JOIN
    disciplina d ON c.id_curso = d.id_curso
GROUP BY
    c.nome;

--17. Exibir os professores que têm mais de 2 disciplinas com carga horária superior a 100 horas
SELECT
    p.nome AS nome_do_professor,
    COUNT(d.id_disciplina) AS numero_de_disciplinas
FROM
    professor p
JOIN
    turma t ON p.id_professor = t.id_professor
JOIN
    disciplina d ON t.id_disciplina = d.id_disciplina
WHERE
    d.carga_horaria > 100
GROUP BY
    p.nome
HAVING
    COUNT(d.id_disciplina) > 2

--18. Listar disciplinas que tenham pelo menos 5 alunos matriculados
SELECT
    d.nome AS nome_da_disciplina,
    COUNT(m.id_aluno) AS numero_de_alunos
FROM
    disciplina d
JOIN
    matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY
    d.nome
HAVING
    COUNT(m.id_aluno) >= 5;

--19. Exibir o número de alunos por status, ordenando pelos status com mais alunos
SELECT
    status,
    COUNT(id_aluno) AS numero_de_alunos
FROM
    matricula
GROUP BY
    status
ORDER BY
    COUNT(id_aluno) DESC;

--20. Listar professores e a soma da carga horária das disciplinas que lecionam
SELECT
    p.nome AS nome_do_professor,
    SUM(d.carga_horaria) AS carga_horaria_total
FROM
    professor p
JOIN
    turma t ON p.id_professor = t.id_professor
JOIN
    disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY
    p.nome
ORDER BY
    SUM(d.carga_horaria) DESC;