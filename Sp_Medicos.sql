CREATE PROCEDURE sp_Medicos
	@OP CHAR(1),--I -> Inserir, U -> Atualizar, D -> Deletar, S -> Selecionar, E -> Selecionar campo expecifico	
	@CODM INT = null,
    @NOME VARCHAR(40) = null,
    @IDADE TINYINT= null,
    @ESPECIALIDADE CHAR(20) = null,
	@RG NUMERIC(10,0) = null,
	@CIDADE VARCHAR(30) = null,
	@NROA INT = NULL
AS
BEGIN
	IF (@OP = 'I')
		BEGIN
			INSERT INTO Medicos (codm,nome,idade,especialidade,RG,cidade,nroa) values (@CODM,@NOME,@IDADE,@ESPECIALIDADE,@RG
			,@CIDADE,@NROA)
			PRINT 'Medico inserido com sucesso'
		END
	ELSE IF(@OP = 'U')
		BEGIN
			IF(@NROA IN (select a.nroa from Ambulatorios a))
				BEGIN
					UPDATE Medicos SET nome = @NOME, idade = @IDADE, especialidade = @ESPECIALIDADE, RG = @RG,cidade = @CIDADE
					,nroa = @NROA where codm = @CODM
					PRINT 'Medico atualizado com sucesso'
				END
			ELSE
				BEGIN
					PRINT 'Ambulatorio Inexistente'
				END	
		END
    ELSE IF (@OP = 'D')
		BEGIN
			DELETE FROM Medicos where codm = @CODM
			PRINT 'Funcionario deletado com sucesso'
		END
	ELSE IF (@OP = 'S')
		BEGIN
			SELECT * FROM Medicos
		END
	ELSE IF (@OP = 'E')
		BEGIN
			SELECT * FROM Medicos where codm = @CODM
		END
	ELSE
		BEGIN
			PRINT 'Opção Incorreta'
		END
END