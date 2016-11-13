\echo ------------------CDL_ENTRY_HEAD----------------
select now();
\timing
insert into CDL_ENTRY_HEAD_GPTMP (CMD_TYPE,PRE_ENTRY_ID) select CMD_TYPE,PRE_ENTRY_ID from CDL_ENTRY_HEAD_INC_EXT;

delete from CDL_ENTRY_HEAD using CDL_ENTRY_HEAD_GPTMP where CDL_ENTRY_HEAD_GPTMP.PRE_ENTRY_ID=CDL_ENTRY_HEAD.PRE_ENTRY_ID ;

insert into CDL_ENTRY_HEAD(PRE_ENTRY_ID,ENTRY_ID,LIST_DATE,I_E_PORT,TRADE_CO,OWNER_CODE,TRADE_MODE,TRADE_COUNTRY,DESTINATION_PORT,TRAF_MODE,DECL_PORT,MANUAL_NO) select PRE_ENTRY_ID,ENTRY_ID,LIST_DATE,I_E_PORT,TRADE_CO,OWNER_CODE,TRADE_MODE,TRADE_COUNTRY,DESTINATION_PORT,TRAF_MODE,DECL_PORT,MANUAL_NO from CDL_ENTRY_HEAD_INC_EXT where CMD_TYPE='I';

delete from CDL_ENTRY_HEAD_GPTMP;

\timing