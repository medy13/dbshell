\echo ------------------IM_APPL_CLOSE----------------
select now();
\timing
insert into IM_APPL_CLOSE_GPTMP (CMD_TYPE,MANUAL_NO, CONTR_ITEM) select CMD_TYPE,MANUAL_NO, CONTR_ITEM from IM_APPL_CLOSE_INC_EXT;

delete from IM_APPL_CLOSE using IM_APPL_CLOSE_GPTMP where IM_APPL_CLOSE_GPTMP.MANUAL_NO=IM_APPL_CLOSE.MANUAL_NO AND IM_APPL_CLOSE_GPTMP.CONTR_ITEM=IM_APPL_CLOSE.CONTR_ITEM ;

insert into IM_APPL_CLOSE(MANUAL_NO,CONTR_ITEM,CODE_TS,G_NAME,G_MODEL,FACT_QTY,T_IN_QTY,T_EX_QTY,USED_QTY,REMAIN_QTY,PROC_MODE,CORR_MANUAL_NO) select MANUAL_NO,CONTR_ITEM,CODE_TS,G_NAME,G_MODEL,FACT_QTY,T_IN_QTY,T_EX_QTY,USED_QTY,REMAIN_QTY,PROC_MODE,CORR_MANUAL_NO from IM_APPL_CLOSE_INC_EXT where CMD_TYPE='I';

delete from IM_APPL_CLOSE_GPTMP;

\timing
