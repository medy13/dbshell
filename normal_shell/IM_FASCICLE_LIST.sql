\echo ------------------IM_FASCICLE_LIST----------------
select now();
\timing
insert into IM_FASCICLE_LIST_GPTMP (CMD_TYPE,FASCICLE_NO, CONTR_ITEM) select CMD_TYPE,FASCICLE_NO, CONTR_ITEM from IM_FASCICLE_LIST_INC_EXT;

delete from IM_FASCICLE_LIST using IM_FASCICLE_LIST_GPTMP where IM_FASCICLE_LIST_GPTMP.FASCICLE_NO=IM_FASCICLE_LIST.FASCICLE_NO AND IM_FASCICLE_LIST_GPTMP.CONTR_ITEM=IM_FASCICLE_LIST.CONTR_ITEM ;

insert into IM_FASCICLE_LIST(MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY) select MANUAL_NO,FASCICLE_NO,CONTR_ITEM,APPR_QTY,FACT_QTY from IM_FASCICLE_LIST_INC_EXT where CMD_TYPE='I';

delete from IM_FASCICLE_LIST_GPTMP;

\timing
