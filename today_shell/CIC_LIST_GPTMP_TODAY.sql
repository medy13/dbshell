\echo ------------------CIC_LIST----------------
select now();
\timing
delete from CIC_LIST_GPTMP;
insert into CIC_LIST_GPTMP (CMD_TYPE,CPT_NO, ITEM_NO) select CMD_TYPE,CPT_NO, ITEM_NO from CIC_LIST_INC_EXT;
delete from CIC_LIST_GPTMP_TODAY using CIC_LIST_GPTMP where CIC_LIST_GPTMP.CPT_NO=CIC_LIST_GPTMP_TODAY.CPT_NO AND CIC_LIST_GPTMP.ITEM_NO=CIC_LIST_GPTMP_TODAY.ITEM_NO ;
insert into CIC_LIST_GPTMP_TODAY (CMD_TYPE,CPT_NO,ITEM_NO,CODE_TS,ORIGIN_COUNTRY,G_NAME,G_MODEL,COLOR,ENGINE_NO,CAR_COVER_NO,QTY_EXHAUST,QTY,PRICE,CURR,PACK_NO,MARK_NO,SPARE_FLAG,NOTE,FCT_DATE) select CMD_TYPE,CPT_NO,ITEM_NO,CODE_TS,ORIGIN_COUNTRY,G_NAME,G_MODEL,COLOR,ENGINE_NO,CAR_COVER_NO,QTY_EXHAUST,QTY,PRICE,CURR,PACK_NO,MARK_NO,SPARE_FLAG,NOTE,FCT_DATE from CIC_LIST_INC_EXT;
delete from CIC_LIST_GPTMP;
\timing