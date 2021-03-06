\echo ------------------DCG_DEDUCT----------------
select now();
\timing
delete from DCG_DEDUCT_GPTMP;
insert into DCG_DEDUCT_GPTMP (CMD_TYPE,ENTRY_ID, DCG_NO, G_TYPE, ENTRY_G_NO) select CMD_TYPE,ENTRY_ID, DCG_NO, G_TYPE, ENTRY_G_NO from DCG_DEDUCT_INC_EXT;
delete from DCG_DEDUCT_GPTMP_TODAY using DCG_DEDUCT_GPTMP where DCG_DEDUCT_GPTMP.ENTRY_ID=DCG_DEDUCT_GPTMP_TODAY.ENTRY_ID AND DCG_DEDUCT_GPTMP.DCG_NO=DCG_DEDUCT_GPTMP_TODAY.DCG_NO AND DCG_DEDUCT_GPTMP.G_TYPE=DCG_DEDUCT_GPTMP_TODAY.G_TYPE AND DCG_DEDUCT_GPTMP.ENTRY_G_NO=DCG_DEDUCT_GPTMP_TODAY.ENTRY_G_NO ;
insert into DCG_DEDUCT_GPTMP_TODAY (CMD_TYPE,ENTRY_ID,DCG_NO,G_TYPE,ENTRY_G_NO,DCG_G_NO,EMS_NO,EMS_G_NO,QTY,VERIFY_DATE,VERIFY_ER) select CMD_TYPE,ENTRY_ID,DCG_NO,G_TYPE,ENTRY_G_NO,DCG_G_NO,EMS_NO,EMS_G_NO,QTY,VERIFY_DATE,VERIFY_ER from DCG_DEDUCT_INC_EXT;
delete from DCG_DEDUCT_GPTMP;
\timing
