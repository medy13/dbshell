\echo ------------------PRE_EX_CONTRACT_LIST----------------
select now();
\timing
insert into PRE_EX_CONTRACT_LIST_GPTMP (CMD_TYPE,MANUAL_NO, CONTR_ITEM) select CMD_TYPE,MANUAL_NO, CONTR_ITEM from PRE_EX_CONTRACT_LIST_INC_EXT;

delete from PRE_EX_CONTRACT_LIST using PRE_EX_CONTRACT_LIST_GPTMP where PRE_EX_CONTRACT_LIST_GPTMP.MANUAL_NO=PRE_EX_CONTRACT_LIST.MANUAL_NO AND PRE_EX_CONTRACT_LIST_GPTMP.CONTR_ITEM=PRE_EX_CONTRACT_LIST.CONTR_ITEM ;

insert into PRE_EX_CONTRACT_LIST(MANUAL_NO,CONTR_ITEM,CODE_TS,CLASS_MARK,G_NAME,G_MODEL,ORIGIN_COUNTRY,DUTY_MODE,DUTY_RATIO,LOCAL_CONTR,APPR_AMT,FACT_AMT,UNIT_PRICE,APPR_QTY,FACT_QTY,TRANSFER_QTY,UNIT_1,IN_COUNT,WORK_PAY,CURR_WORK,CONSUME_NOTE) select MANUAL_NO,CONTR_ITEM,CODE_TS,CLASS_MARK,G_NAME,G_MODEL,ORIGIN_COUNTRY,DUTY_MODE,DUTY_RATIO,LOCAL_CONTR,APPR_AMT,FACT_AMT,UNIT_PRICE,APPR_QTY,FACT_QTY,TRANSFER_QTY,UNIT_1,IN_COUNT,WORK_PAY,CURR_WORK,CONSUME_NOTE from PRE_EX_CONTRACT_LIST_INC_EXT where CMD_TYPE='I';

delete from PRE_EX_CONTRACT_LIST_GPTMP;

\timing
