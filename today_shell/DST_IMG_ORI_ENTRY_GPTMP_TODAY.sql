\echo ------------------DST_IMG_ORI_ENTRY----------------
select now();
\timing
delete from DST_IMG_ORI_ENTRY_GPTMP;
insert into DST_IMG_ORI_ENTRY_GPTMP (CMD_TYPE,PRE_NO, G_NO, ORIGIN_COUNTRY, ENTRY_ID, ENTRY_G_NO) select CMD_TYPE,PRE_NO, G_NO, ORIGIN_COUNTRY, ENTRY_ID, ENTRY_G_NO from DST_IMG_ORI_ENTRY_INC_EXT;
delete from DST_IMG_ORI_ENTRY_GPTMP_TODAY using DST_IMG_ORI_ENTRY_GPTMP where DST_IMG_ORI_ENTRY_GPTMP.PRE_NO=DST_IMG_ORI_ENTRY_GPTMP_TODAY.PRE_NO AND DST_IMG_ORI_ENTRY_GPTMP.G_NO=DST_IMG_ORI_ENTRY_GPTMP_TODAY.G_NO AND DST_IMG_ORI_ENTRY_GPTMP.ORIGIN_COUNTRY=DST_IMG_ORI_ENTRY_GPTMP_TODAY.ORIGIN_COUNTRY AND DST_IMG_ORI_ENTRY_GPTMP.ENTRY_ID=DST_IMG_ORI_ENTRY_GPTMP_TODAY.ENTRY_ID AND DST_IMG_ORI_ENTRY_GPTMP.ENTRY_G_NO=DST_IMG_ORI_ENTRY_GPTMP_TODAY.ENTRY_G_NO ;
insert into DST_IMG_ORI_ENTRY_GPTMP_TODAY (CMD_TYPE,DST_SEQ_NO,PRE_NO,REL_NO,G_NO,ORIGIN_COUNTRY,ENTRY_ID,ENTRY_G_NO,TRADE_PRICE,TRADE_CURR,MODIFY_MARK,G_QTY,G_UNIT) select CMD_TYPE,DST_SEQ_NO,PRE_NO,REL_NO,G_NO,ORIGIN_COUNTRY,ENTRY_ID,ENTRY_G_NO,TRADE_PRICE,TRADE_CURR,MODIFY_MARK,G_QTY,G_UNIT from DST_IMG_ORI_ENTRY_INC_EXT;
delete from DST_IMG_ORI_ENTRY_GPTMP;
\timing