\echo ------------------BAK_EX_FASCICLE_LIST----------------
select now();
\timing
delete from BAK_EX_FASCICLE_LIST_GPTMP;
insert into BAK_EX_FASCICLE_LIST_GPTMP (CMD_TYPE,FASCICLE_NO, CONTR_ITEM) select CMD_TYPE,FASCICLE_NO, CONTR_ITEM from BAK_EX_FASCICLE_LIST_INC_EXT;
delete from BAK_EX_FASCICLE_LIST_GPTMP_TODAY using BAK_EX_FASCICLE_LIST_GPTMP where BAK_EX_FASCICLE_LIST_GPTMP.FASCICLE_NO=BAK_EX_FASCICLE_LIST_GPTMP_TODAY.FASCICLE_NO AND BAK_EX_FASCICLE_LIST_GPTMP.CONTR_ITEM=BAK_EX_FASCICLE_LIST_GPTMP_TODAY.CONTR_ITEM ;
insert into BAK_EX_FASCICLE_LIST_GPTMP_TODAY (CMD_TYPE,MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY) select CMD_TYPE,MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY from BAK_EX_FASCICLE_LIST_INC_EXT;
delete from BAK_EX_FASCICLE_LIST_GPTMP;
\timing
