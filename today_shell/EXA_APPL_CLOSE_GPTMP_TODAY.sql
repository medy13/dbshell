\echo ------------------EXA_APPL_CLOSE----------------
select now();
\timing
delete from EXA_APPL_CLOSE_GPTMP;
insert into EXA_APPL_CLOSE_GPTMP (CMD_TYPE,MANUAL_NO, CONTR_ITEM) select CMD_TYPE,MANUAL_NO, CONTR_ITEM from EXA_APPL_CLOSE_INC_EXT;
delete from EXA_APPL_CLOSE_GPTMP_TODAY using EXA_APPL_CLOSE_GPTMP where EXA_APPL_CLOSE_GPTMP.MANUAL_NO=EXA_APPL_CLOSE_GPTMP_TODAY.MANUAL_NO AND EXA_APPL_CLOSE_GPTMP.CONTR_ITEM=EXA_APPL_CLOSE_GPTMP_TODAY.CONTR_ITEM ;
insert into EXA_APPL_CLOSE_GPTMP_TODAY (CMD_TYPE,MANUAL_NO,CONTR_ITEM,CODE_TS,G_NAME,G_MODEL,G_QTY,DECL_PRICE,G_AMT,PROC_MODE,BOOK_NO) select CMD_TYPE,MANUAL_NO,CONTR_ITEM,CODE_TS,G_NAME,G_MODEL,G_QTY,DECL_PRICE,G_AMT,PROC_MODE,BOOK_NO from EXA_APPL_CLOSE_INC_EXT;
delete from EXA_APPL_CLOSE_GPTMP;
\timing
