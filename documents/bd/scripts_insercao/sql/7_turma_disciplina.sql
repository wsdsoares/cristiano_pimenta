select distinct 'INSERT INTO `portalatenas`.`turma_disciplina`
(`fk_codsemestre`,
`fk_codturma`,
`fk_coddisciplina`,
`curso_codcurso`)
VALUES
('
+char(39)+codperlet+char(39)+char(44)
+char(39)+codtur+char(39)+char(44)
+char(39)+codmat+char(39)+char(44)
+char(39)+convert(varchar,codcur)+char(39)
+');'

from umatturma
where codperlet = '1-2015'
and codcur = 5

