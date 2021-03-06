\echo ------------------CCTS_RSK_RESULT_BAK----------------
select now();
\timing
insert into CCTS_RSK_RESULT_BAK_GPTMP (CMD_TYPE,CCTS_CODE, CUSTOMS_CODE, OP_BAK_TIME) select CMD_TYPE,CCTS_CODE, CUSTOMS_CODE, OP_BAK_TIME from CCTS_RSK_RESULT_BAK_INC_EXT;

delete from CCTS_RSK_RESULT_BAK using CCTS_RSK_RESULT_BAK_GPTMP where CCTS_RSK_RESULT_BAK_GPTMP.CCTS_CODE=CCTS_RSK_RESULT_BAK.CCTS_CODE AND CCTS_RSK_RESULT_BAK_GPTMP.CUSTOMS_CODE=CCTS_RSK_RESULT_BAK.CUSTOMS_CODE AND CCTS_RSK_RESULT_BAK_GPTMP.OP_BAK_TIME=CCTS_RSK_RESULT_BAK.OP_BAK_TIME ;

insert into CCTS_RSK_RESULT_BAK(CCTS_CODE,CUSTOMS_CODE,RSK_TYPE,RSK_LEVEL,RSK_COMMENT,INPUT_ID,OP_TIME,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME) select CCTS_CODE,CUSTOMS_CODE,RSK_TYPE,RSK_LEVEL,RSK_COMMENT,INPUT_ID,OP_TIME,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME from CCTS_RSK_RESULT_BAK_INC_EXT where CMD_TYPE='I';

delete from CCTS_RSK_RESULT_BAK_GPTMP;

\timing
