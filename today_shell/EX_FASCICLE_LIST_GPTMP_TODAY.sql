\echo ------------------EX_FASCICLE_LIST----------------
select now();
\timing
delete from EX_FASCICLE_LIST_GPTMP;
insert into EX_FASCICLE_LIST_GPTMP (CMD_TYPE,FASCICLE_NO, CONTR_ITEM) select CMD_TYPE,FASCICLE_NO, CONTR_ITEM from EX_FASCICLE_LIST_INC_EXT;
delete from EX_FASCICLE_LIST_GPTMP_TODAY using EX_FASCICLE_LIST_GPTMP where EX_FASCICLE_LIST_GPTMP.FASCICLE_NO=EX_FASCICLE_LIST_GPTMP_TODAY.FASCICLE_NO AND EX_FASCICLE_LIST_GPTMP.CONTR_ITEM=EX_FASCICLE_LIST_GPTMP_TODAY.CONTR_ITEM ;
insert into EX_FASCICLE_LIST_GPTMP_TODAY (CMD_TYPE,MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY) select CMD_TYPE,MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY from EX_FASCICLE_LIST_INC_EXT;
delete from EX_FASCICLE_LIST_GPTMP;
\timing