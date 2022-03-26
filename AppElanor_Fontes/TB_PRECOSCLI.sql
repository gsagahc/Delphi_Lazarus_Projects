         /******************************************************************************/
/*                 Generated by IBExpert 05/01/2020 04:16:40                  */
/******************************************************************************/

/******************************************************************************/
/*        Following SET SQL DIALECT is just for the Database Comparer         */
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/


CREATE GENERATOR GEN_TB_PRECOSCLI_ID;

CREATE TABLE TB_PRECOSCLI (
    ID_PRECOSCLI  INTEGER,
    ID_RODUTO         INTEGER,
    TBPRCLI_PRECO     NUMERIC(10,3),
    ID_CLIENTE        INTEGER
);




/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: NEW_TABLE_BI */
CREATE OR ALTER TRIGGER TB_PRECOSCLI_BI FOR TB_PRECOSCLI
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_precoscli is null) then
    new.id_precoscli = gen_id(gen_tb_precoscli_id,1);
end
^

SET TERM ; ^



/******************************************************************************/
/*                                 Privileges                                 */
/******************************************************************************/


