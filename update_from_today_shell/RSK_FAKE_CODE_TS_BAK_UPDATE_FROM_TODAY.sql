\echo -----------------------RSK_FAKE_CODE_TS_BAK------------------------
select now();
\timing
delete from RSK_FAKE_CODE_TS_BAK using RSK_FAKE_CODE_TS_BAK_GPTMP_TODAY where RSK_FAKE_CODE_TS_BAK.CCTS_CODE=RSK_FAKE_CODE_TS_BAK_GPTMP_TODAY.CCTS_CODE AND RSK_FAKE_CODE_TS_BAK.OP_BAK_TIME=RSK_FAKE_CODE_TS_BAK_GPTMP_TODAY.OP_BAK_TIME ;
insert into RSK_FAKE_CODE_TS_BAK (CCTS_CODE,CODE_TS,I_E_FLAG,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,SMUGGLE_TYPE,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME) select CCTS_CODE,CODE_TS,I_E_FLAG,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,SMUGGLE_TYPE,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME from RSK_FAKE_CODE_TS_BAK_GPTMP_TODAY  where CMD_TYPE='I';
\timing
