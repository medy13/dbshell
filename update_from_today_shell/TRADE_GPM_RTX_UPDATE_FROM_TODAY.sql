\echo -----------------------TRADE_GPM_RTX------------------------
select now();
\timing
delete from TRADE_GPM_RTX using TRADE_GPM_RTX_GPTMP_TODAY where TRADE_GPM_RTX.TRADE_MODE=TRADE_GPM_RTX_GPTMP_TODAY.TRADE_MODE AND TRADE_GPM_RTX.SIGN_TYPE=TRADE_GPM_RTX_GPTMP_TODAY.SIGN_TYPE AND TRADE_GPM_RTX.SIGN_MODE=TRADE_GPM_RTX_GPTMP_TODAY.SIGN_MODE ;
insert into TRADE_GPM_RTX (TRADE_MODE,SIGN_TYPE,SIGN_MODE) select TRADE_MODE,SIGN_TYPE,SIGN_MODE from TRADE_GPM_RTX_GPTMP_TODAY  where CMD_TYPE='I';
\timing