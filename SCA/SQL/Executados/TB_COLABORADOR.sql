
/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/


CREATE GENERATOR GEN_TB_COLABORADOR_ID;

CREATE TABLE TB_COLABORADOR  (
    ID_COLAB          INTEGER,
    TBCOLAB_FONE      CHAR(10),
    TBCOLAB_NOME      VARCHAR(100),
    TBCOLAB_TIPO      VARCHAR(20),
    TBCOLAB_RG        CHAR(10),
    TBCOLAB_CPF       CHAR(10),
    TBCOLAB_REGISTRO  VARCHAR(10),
    TBCOLAB_ENDERECO  VARCHAR(100),
    TBCOLAB_BAIRRO    VARCHAR(50),
    TBCOLAB_CIDADE    VARCHAR(50),
    TBCOLAB_CEP       VARCHAR(10),
    TBCOLAB_IDSERV    INTEGER
);




/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: TB_COLABORADOR_BI */
CREATE OR ALTER TRIGGER TB_COLABORADOR_BI FOR TB_COLABORADOR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_colab is null) then
    new.id_colab = gen_id(gen_tb_colaborador_id,1);
end
^

SET TERM ; ^



/******************************************************************************/
/*                                 Privileges                                 */
/******************************************************************************/
