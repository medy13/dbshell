\echo ------------------PRE_IM_FASCICLE_LIST----------------
select now();
\timing
insert into PRE_IM_FASCICLE_LIST_GPTMP (CMD_TYPE,FASCICLE_NO, CONTR_ITEM) select CMD_TYPE,FASCICLE_NO, CONTR_ITEM from PRE_IM_FASCICLE_LIST_INC_EXT;

delete from PRE_IM_FASCICLE_LIST using PRE_IM_FASCICLE_LIST_GPTMP where PRE_IM_FASCICLE_LIST_GPTMP.FASCICLE_NO=PRE_IM_FASCICLE_LIST.FASCICLE_NO AND PRE_IM_FASCICLE_LIST_GPTMP.CONTR_ITEM=PRE_IM_FASCICLE_LIST.CONTR_ITEM ;

insert into PRE_IM_FASCICLE_LIST(MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY) select MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY from PRE_IM_FASCICLE_LIST_INC_EXT where CMD_TYPE='I';

delete from PRE_IM_FASCICLE_LIST_GPTMP;

\timing