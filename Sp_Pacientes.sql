CREATE PROCEDURE sp_Pacientes
	@OP CHAR(1),--I -> Inserir, U -> Atualizar, D -> Deletar, S -> Selecionar, E -> Selecionar campo expecifico	
	@CODP INT = null,
    @NOME VARCHAR(40) = null,
    @IDADE TINYINT= null,
	@CIDADE VARCHAR(30) = null,
	@RG NUMERIC(10,0) = null,
	@PROBLEMA VARCHAR(20) = NULL
AS
BEGIN
	IF (@OP = 'I')
		BEGIN
			INSERT INTO Pacientes (codp,nome,idade,cidade,rg,problema) values (@CODP,@NOME,@IDADE,@CIDADE,@RG,@PROBLEMA)
			PRINT 'Paciente inserido com sucesso'
		END
	ELSE IF(@OP = 'U')
		BEGIN
			UPDATE Pacientes SET nome = @NOME, idade = @IDADE, cidade = @CIDADE, RG = @RG, problema = @PROBLEMA where codp = @CODP
			PRINT 'Paciente atualizado com sucesso'
		END
    ELSE IF (@OP = 'D')
		BEGIN
			DELETE FROM Pacientes where codp = @CODP
			PRINT 'Paciente deletado com sucesso'
		END
	ELSE IF (@OP = 'S')
		BEGIN
			SELECT * FROM Pacientes
		END
	ELSE IF (@OP = 'E')
		BEGIN
			SELECT * FROM Pacientes where codp = @CODP
		END
	ELSE
		BEGIN
			PRINT 'Opção Incorreta'
		END
END