\echo ------------------PES_CANCEL----------------
select now();
\timing
insert into PES_CANCEL_GPTMP (CMD_TYPE,ENTRY_ID) select CMD_TYPE,ENTRY_ID from PES_CANCEL_INC_EXT;

delete from PES_CANCEL using PES_CANCEL_GPTMP where PES_CANCEL_GPTMP.ENTRY_ID=PES_CANCEL.ENTRY_ID ;

insert into PES_CANCEL(ENTRY_ID,I_E_FLAG,G_NO,NOTE_NO,NOTE_TYPE,TRADE_CODE,TRADE_NAME,OWNER_CODE,OWNER_NAME,DISTRICT_CODE,TRADE_COUNTRY,TRADE_MODE,DECL_CUSTOM,CODE_TS,G_NAME,G_MODEL,QTY,UNIT,DECL_TOTAL,TRADE_CURR,G_DATE,STAT) select ENTRY_ID,I_E_FLAG,G_NO,NOTE_NO,NOTE_TYPE,TRADE_CODE,TRADE_NAME,OWNER_CODE,OWNER_NAME,DISTRICT_CODE,TRADE_COUNTRY,TRADE_MODE,DECL_CUSTOM,CODE_TS,G_NAME,G_MODEL,QTY,UNIT,DECL_TOTAL,TRADE_CURR,G_DATE,STAT from PES_CANCEL_INC_EXT where CMD_TYPE='I';

delete from PES_CANCEL_GPTMP;

\timing
