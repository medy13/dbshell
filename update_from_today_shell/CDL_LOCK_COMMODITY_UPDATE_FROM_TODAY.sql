\echo -----------------------CDL_LOCK_COMMODITY------------------------
select now();
\timing
delete from CDL_LOCK_COMMODITY using CDL_LOCK_COMMODITY_GPTMP_TODAY where CDL_LOCK_COMMODITY.CODE_TS=CDL_LOCK_COMMODITY_GPTMP_TODAY.CODE_TS AND CDL_LOCK_COMMODITY.CONTROL_COUNTRY=CDL_LOCK_COMMODITY_GPTMP_TODAY.CONTROL_COUNTRY AND CDL_LOCK_COMMODITY.CUSTOMS_CODE=CDL_LOCK_COMMODITY_GPTMP_TODAY.CUSTOMS_CODE AND CDL_LOCK_COMMODITY.I_E_FLAG=CDL_LOCK_COMMODITY_GPTMP_TODAY.I_E_FLAG AND CDL_LOCK_COMMODITY.TRADE_MODE=CDL_LOCK_COMMODITY_GPTMP_TODAY.TRADE_MODE ;
insert into CDL_LOCK_COMMODITY (CODE_TS,CONTROL_COUNTRY,CUSTOMS_CODE,I_E_FLAG,TRADE_MODE,FIT_FLAG,LOCK_OP_ID,LOCK_DATE,UNLOCK_OP_ID,UNLOCK_DATE) select CODE_TS,CONTROL_COUNTRY,CUSTOMS_CODE,I_E_FLAG,TRADE_MODE,FIT_FLAG,LOCK_OP_ID,LOCK_DATE,UNLOCK_OP_ID,UNLOCK_DATE from CDL_LOCK_COMMODITY_GPTMP_TODAY  where CMD_TYPE='I';
\timing
