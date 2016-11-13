\echo ------------------RSK_TRADE_CO_BAK----------------
select now();
\timing
insert into RSK_TRADE_CO_BAK_GPTMP (CMD_TYPE,CCTS_CODE, OP_BAK_TIME) select CMD_TYPE,CCTS_CODE, OP_BAK_TIME from RSK_TRADE_CO_BAK_INC_EXT;

delete from RSK_TRADE_CO_BAK using RSK_TRADE_CO_BAK_GPTMP where RSK_TRADE_CO_BAK_GPTMP.CCTS_CODE=RSK_TRADE_CO_BAK.CCTS_CODE AND RSK_TRADE_CO_BAK_GPTMP.OP_BAK_TIME=RSK_TRADE_CO_BAK.OP_BAK_TIME ;

insert into RSK_TRADE_CO_BAK(CCTS_CODE,TRADE_CO,TRADE_NAME,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,I_E_FLAG,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME) select CCTS_CODE,TRADE_CO,TRADE_NAME,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,I_E_FLAG,OP_BAK_TYPE,OP_BAK_CUSTOMS,OP_BAK_MAN,OP_BAK_TIME from RSK_TRADE_CO_BAK_INC_EXT where CMD_TYPE='I';

delete from RSK_TRADE_CO_BAK_GPTMP;

\timing