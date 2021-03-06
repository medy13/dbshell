\echo ------------------GUARANTEE_DEL_LOG----------------
select now();
\timing
insert into GUARANTEE_DEL_LOG_GPTMP (CMD_TYPE,GUA_ID, DEL_DATETIME) select CMD_TYPE,GUA_ID, DEL_DATETIME from GUARANTEE_DEL_LOG_INC_EXT;

delete from GUARANTEE_DEL_LOG using GUARANTEE_DEL_LOG_GPTMP where GUARANTEE_DEL_LOG_GPTMP.GUA_ID=GUARANTEE_DEL_LOG.GUA_ID AND GUARANTEE_DEL_LOG_GPTMP.DEL_DATETIME=GUARANTEE_DEL_LOG.DEL_DATETIME ;

insert into GUARANTEE_DEL_LOG(GUA_ID,ENTRY_ID,DECL_PORT,APP_REASON,GUAR_ER,REPRE_ER,ADDRESS,TELEPHONE,APPR_ER,D_DATE,I_E_FLAG,TRADE_CO,TRADE_NAME,CODE_TS,G_NAME,DUTY_VALUE,CUT_MODE,DUTY_MODE,GUAR_CURR,RE_ACCOUNT,PAYER_NAME,REGR_DATE,REGR_ER,LOG_DATE,ENTER_ER,PERIOD,DELAY_MARK,DELAY_DATE,DELAY_ER,DELAY_REASON,C_DATE,CANCEL_ER,PROC_MARK,C_REASON,UR_COUNT,UR_DATE,UR_ER,REMARK,PRINT_DATE,PRINT_ER,REGISTER_MODE,OP_ID,DEL_DATETIME,DEL_REASON,PAY_MODE,EPORT_ID,PAY_DATE,EXQ_DATE,BANK_NAME,BANK_ACCOUNT,GEN_DATE,BANK_CODE,BANK_ACCOUNT_NAME,PAYER_ACCOUNT_NO,PAYER_ACCOUNT_NAME,PAYER_BANK_NAME,PAYER_BANK_CODE) select GUA_ID,ENTRY_ID,DECL_PORT,APP_REASON,GUAR_ER,REPRE_ER,ADDRESS,TELEPHONE,APPR_ER,D_DATE,I_E_FLAG,TRADE_CO,TRADE_NAME,CODE_TS,G_NAME,DUTY_VALUE,CUT_MODE,DUTY_MODE,GUAR_CURR,RE_ACCOUNT,PAYER_NAME,REGR_DATE,REGR_ER,LOG_DATE,ENTER_ER,PERIOD,DELAY_MARK,DELAY_DATE,DELAY_ER,DELAY_REASON,C_DATE,CANCEL_ER,PROC_MARK,C_REASON,UR_COUNT,UR_DATE,UR_ER,REMARK,PRINT_DATE,PRINT_ER,REGISTER_MODE,OP_ID,DEL_DATETIME,DEL_REASON,PAY_MODE,EPORT_ID,PAY_DATE,EXQ_DATE,BANK_NAME,BANK_ACCOUNT,GEN_DATE,BANK_CODE,BANK_ACCOUNT_NAME,PAYER_ACCOUNT_NO,PAYER_ACCOUNT_NAME,PAYER_BANK_NAME,PAYER_BANK_CODE from GUARANTEE_DEL_LOG_INC_EXT where CMD_TYPE='I';

delete from GUARANTEE_DEL_LOG_GPTMP;

\timing
