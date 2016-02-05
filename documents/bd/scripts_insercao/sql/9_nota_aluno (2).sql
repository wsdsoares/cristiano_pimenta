SELECT 'INSERT INTO `portalatenas`.`nota_aluno`
(`etapa`,
`prova_trabalho`,
`nota`,
`data_atualizacao`,
`fk_codusuario`,
`fk_codsemestre`,
`fk_codturma`,
`fk_coddisciplina`)
VALUES
(
'
+char(39)+convert(varchar,codetp)+char(39)+char(44)
+char(39)+'P'+char(39)+char(44)
+char(39)+convert(varchar,p1)+char(39)+char(44)
+char(39)+CONVERT(char(10), GetDate(),126)+char(39)+char(44)
+char(39)+mataluno+char(39)+char(44)
+char(39)+perletivo+char(39)+char(44)
+char(39)+codtur+char(39)+char(44)
+char(39)+codmat+char(39)
+');'

FROM ealunotpr
WHERE perletivo = '1-2015'
	AND codcur = 5

union

SELECT 'INSERT INTO `portalatenas`.`nota_aluno`
(`etapa`,
`prova_trabalho`,
`nota`,
`data_atualizacao`,
`fk_codusuario`,
`fk_codsemestre`,
`fk_codturma`,
`fk_coddisciplina`)
VALUES
(
'
+char(39)+convert(varchar,codetp)+char(39)+char(44)
+char(39)+'T'+char(39)+char(44)
+char(39)+convert(varchar,p2)+char(39)+char(44)
+char(39)+CONVERT(char(10), GetDate(),126)+char(39)+char(44)
+char(39)+mataluno+char(39)+char(44)
+char(39)+perletivo+char(39)+char(44)
+char(39)+codtur+char(39)+char(44)
+char(39)+codmat+char(39)
+');'

FROM ealunotpr
WHERE perletivo = '1-2015'
	AND codcur = 5
	
