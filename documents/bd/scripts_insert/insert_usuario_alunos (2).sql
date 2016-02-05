SELECT distinct ealunos.matricula AS codusuario
	,ealunos.nome AS nome
	,ealunos.email AS email
	,'e10adc3949ba59abbe56e057f20f883e' AS 'password'
	,'3' as fk_codperfil
FROM ealunos
	,umatricpl
WHERE umatricpl.mataluno = ealunos.matricula
	AND umatricpl.perletivo = '1-2015'
	and umatricpl.status = 'ma'
