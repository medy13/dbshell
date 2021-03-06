\echo ------------------DCG_DEDUCT_LOG----------------
select now();
\timing
insert into DCG_DEDUCT_LOG_GPTMP (CMD_TYPE,ENTRY_ID, DCG_NO, CREATE_DATE, JOU_MARK) select CMD_TYPE,ENTRY_ID, DCG_NO, CREATE_DATE, JOU_MARK from DCG_DEDUCT_LOG_INC_EXT;

delete from DCG_DEDUCT_LOG using DCG_DEDUCT_LOG_GPTMP where DCG_DEDUCT_LOG_GPTMP.ENTRY_ID=DCG_DEDUCT_LOG.ENTRY_ID AND DCG_DEDUCT_LOG_GPTMP.DCG_NO=DCG_DEDUCT_LOG.DCG_NO AND DCG_DEDUCT_LOG_GPTMP.CREATE_DATE=DCG_DEDUCT_LOG.CREATE_DATE AND DCG_DEDUCT_LOG_GPTMP.JOU_MARK=DCG_DEDUCT_LOG.JOU_MARK ;

insert into DCG_DEDUCT_LOG(ENTRY_ID,DCG_NO,CREATE_DATE,JOU_MARK,NOTE,VERIFY_ER) select ENTRY_ID,DCG_NO,CREATE_DATE,JOU_MARK,NOTE,VERIFY_ER from DCG_DEDUCT_LOG_INC_EXT where CMD_TYPE='I';

delete from DCG_DEDUCT_LOG_GPTMP;

\timing
