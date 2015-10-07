select distinct 'INSERT INTO `portalatenas`.`turma`
(`codturma`,
`descricao`)
VALUES
('+char(39)+codtur+char(39)+char(44)
+char(39)+isnull(nometurma,'NULL')+char(39)+');' from umatturma where codperlet= '2-2015' 