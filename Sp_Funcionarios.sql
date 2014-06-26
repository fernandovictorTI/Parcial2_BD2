CREATE PROCEDURE sp_Funcionarios
	@OP CHAR(1),--I -> Inserir, U -> Atualizar, D -> Deletar, S -> Selecionar, E -> Selecionar campo expecifico	
	@CODF INT = null,
    @NOME VARCHAR(40) = null,
    @IDADE TINYINT= null,
    @RG NUMERIC(10,0) = null,
	@SALARIO NUMERIC(8,2) = null,
	@DEPARTAMENTO VARCHAR(30) = null,
	@TEMPOSERVICO TINYINT = null
AS
BEGIN
	IF (@OP = 'I')
		BEGIN
			INSERT INTO Funcionarios(codf,nome,idade,RG,salario,departamento,temposervico) VALUES 
			(@CODF,@NOME,@IDADE,@RG,@SALARIO,@DEPARTAMENTO,@TEMPOSERVICO)
			PRINT 'Funcionario inserido com sucesso'
		END
	ELSE IF(@OP = 'U')
		BEGIN
			UPDATE Funcionarios SET nome = @NOME,idade = @IDADE,RG = @RG, salario = @SALARIO, departamento = @DEPARTAMENTO
			,temposervico = @TEMPOSERVICO where codf = @CODF
			PRINT 'Funcionario atualizado com sucesso'
		END
    ELSE IF (@OP = 'D')
		BEGIN
			DELETE FROM Funcionarios where codf = @CODF
			PRINT 'Funcionario deletado com sucesso'
		END
	ELSE IF (@OP = 'S')
		BEGIN
			SELECT * FROM Funcionarios
		END
	ELSE IF (@OP = 'E')
		BEGIN
			SELECT * FROM Funcionarios where codf = @CODF
		END
	ELSE
		BEGIN
			PRINT 'Opção Incorreta'
		END
END