\echo -----------------------BAK_EMS_DEDUCT_CLR------------------------
select now();
\timing
delete from BAK_EMS_DEDUCT_CLR using BAK_EMS_DEDUCT_CLR_GPTMP_TODAY where BAK_EMS_DEDUCT_CLR.EMS_NO=BAK_EMS_DEDUCT_CLR_GPTMP_TODAY.EMS_NO AND BAK_EMS_DEDUCT_CLR.IMG_NO=BAK_EMS_DEDUCT_CLR_GPTMP_TODAY.IMG_NO AND BAK_EMS_DEDUCT_CLR.ENTRY_ID=BAK_EMS_DEDUCT_CLR_GPTMP_TODAY.ENTRY_ID AND BAK_EMS_DEDUCT_CLR.ENTRY_G_NO=BAK_EMS_DEDUCT_CLR_GPTMP_TODAY.ENTRY_G_NO ;
insert into BAK_EMS_DEDUCT_CLR (EMS_NO,IMG_NO,ENTRY_ID,ENTRY_G_NO,EXG_NO,EXG_VERSION,IN_QTY,DEC_CM,DEC_DM,DEC_CM_QTY,DEC_DM_QTY,I_E_FLAG,TRADE_MODE,TRAF_MODE,VERIFY_MODE,JOU_MARK) select EMS_NO,IMG_NO,ENTRY_ID,ENTRY_G_NO,EXG_NO,EXG_VERSION,IN_QTY,DEC_CM,DEC_DM,DEC_CM_QTY,DEC_DM_QTY,I_E_FLAG,TRADE_MODE,TRAF_MODE,VERIFY_MODE,JOU_MARK from BAK_EMS_DEDUCT_CLR_GPTMP_TODAY  where CMD_TYPE='I';
\timing