\echo -----------------------RSK_TRADE_CO------------------------
select now();
\timing
delete from RSK_TRADE_CO using RSK_TRADE_CO_GPTMP_TODAY where RSK_TRADE_CO.CCTS_CODE=RSK_TRADE_CO_GPTMP_TODAY.CCTS_CODE ;
insert into RSK_TRADE_CO (CCTS_CODE,TRADE_CO,TRADE_NAME,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,I_E_FLAG) select CCTS_CODE,TRADE_CO,TRADE_NAME,BEGIN_DATE,END_DATE,CUSTOMS_CODE,INPUT_ID,AUTHORIZE_ID,OP_TIME,I_E_FLAG from RSK_TRADE_CO_GPTMP_TODAY  where CMD_TYPE='I';
\timing