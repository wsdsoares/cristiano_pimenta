SELECT DISTINCT
'INSERT INTO `portalatenas`.`usuario`
(`codusuario`,
`nome`,
`email`,
`password`,
`fk_codperfil`)
VALUES
(
'
+char(39)+matricula+char(39)+char(44)
+char(39)+nome+char(39)+char(44)
+char(39)+isnull(email, '')+char(39)+char(44)	
+char(39)+'e10adc3949ba59abbe56e057f20f883e'+char(39)+char(44)	
+char(39)+'3'+char(39)+');'
	
FROM ealunos
	,umatricpl
WHERE mataluno = matricula
	AND perletivo = '1-2015'
	AND CODCUR = 5
