CREATE PROCEDURE sp_Consultas
	@OP CHAR(1),--I -> Inserir, U -> Atualizar, D -> Deletar, S -> Selecionar, E -> Selecionar campo expecifico	
	@CODM INT = null,
    @CODP INT = null,
    @DATA DATETIME = null,
    @HORA DATETIME = null
AS
BEGIN
	IF (@OP = 'I')
		BEGIN
			INSERT INTO Consultas(codm,codp,data,hora) VALUES (@CODM,@CODP,@DATA,@HORA)
			PRINT 'Consulta inserida com sucesso'
		END
	ELSE IF(@OP = 'U')
		BEGIN
			UPDATE Consultas SET data = @DATA, hora = @HORA WHERE codm = @CODM and codp = @CODP and data = @DATA and hora = @HORA
			PRINT 'Consulta atualizada com sucesso'
		END
    ELSE IF (@OP = 'D')
		BEGIN
			DELETE FROM Consultas WHERE codm = @CODM and codp = @CODP and data = @DATA and hora = @HORA
			PRINT 'Consulta deletada com sucesso'
		END
	ELSE IF (@OP = 'S')
		BEGIN
			SELECT * FROM Consultas
		END
	ELSE IF (@OP = 'E')
		BEGIN
			SELECT * FROM Consultas WHERE codm = @CODM and codp = @CODP and data = @DATA and hora = @HORA
		END
	ELSE
		BEGIN
			PRINT 'Opção Incorreta'
		END
END