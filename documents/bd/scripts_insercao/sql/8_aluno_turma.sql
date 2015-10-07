select 'select concat( '+char(39)+' INSERT INTO `portalatenas`.`aluno_turma`
(`fk_codusuario`,
`fk_turma_disciplina`)
VALUES
('+
char(39)+CHAR(44)+char(39)+mataluno+char(39)+CHAR(44)+char(39)+char(44)
+char(39)+char(44)+char(39)+char(39)+',(select id_turma_disciplina from turma_disciplina where fk_coddisciplina ='+char(39)+codmat+char(39)+' and fk_codturma = '+char(39)+codtur+char(39)+'),'+char(39)+')'+char(39)

+');'
,MATALUNO
from 
umatalun
where
perletivo = '2-2015'
