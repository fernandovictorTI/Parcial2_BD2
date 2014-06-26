CREATE PROCEDURE sp_Ambulatorios
	@OP CHAR(1),--I -> Inserir, U -> Atualizar, D -> Deletar, S -> Selecionar, E -> Selecionar campo expecifico
	@NROA INT = null,
	@ANDAR NUMERIC(3,0) = null,
	@CAPACIDADE SMALLINT = null
AS
BEGIN
	IF (@OP = 'I')
		BEGIN
			INSERT INTO Ambulatorios (NROA,ANDAR,CAPACIDADE) VALUES (@NROA,@ANDAR,@CAPACIDADE)
			PRINT 'Ambulatorio inserido com sucesso'
		END
	ELSE IF(@OP = 'U')
		BEGIN
			UPDATE Ambulatorios SET andar = @ANDAR, capacidade = @CAPACIDADE WHERE nroa = @NROA
			PRINT 'Ambulatorio atualizado com sucesso'
		END
    ELSE IF (@OP = 'D')
		BEGIN
			UPDATE Medicos SET nroa = NULL WHERE nroa = @NROA
			PRINT 'Atualizado ambulatorio do medico para null que atendia no ambulatorio a ser deletado'
			DELETE FROM Ambulatorios WHERE nroa = @NROA
			PRINT 'Ambulatorio deletado com sucesso'
		END
	ELSE IF (@OP = 'S')
		BEGIN
			SELECT * FROM Ambulatorios
		END
	ELSE IF (@OP = 'E')
		BEGIN
			SELECT * FROM Ambulatorios WHERE nroa = @NROA
		END
	ELSE
		BEGIN
			PRINT 'Opção Incorreta'
		END
END