select 'INSERT INTO `portalatenas`.`curso`
(`codcurso`,
`nome`)
VALUES
('+char(39)+convert(varchar,codcur)+char(39)+char(44)
+char(39)+nome+char(39)+');' from ucursos 