\echo ------------------MANIFEST_EXCH_LOG----------------
select now();
\timing
delete from MANIFEST_EXCH_LOG_GPTMP;
insert into MANIFEST_EXCH_LOG_GPTMP (CMD_TYPE,CUSTOMS_CODE, SHIP_ID, VOYAGE_NO, BILL_NO, I_E_DATE) select CMD_TYPE,CUSTOMS_CODE, SHIP_ID, VOYAGE_NO, BILL_NO, I_E_DATE from MANIFEST_EXCH_LOG_INC_EXT;
delete from MANIFEST_EXCH_LOG_GPTMP_TODAY using MANIFEST_EXCH_LOG_GPTMP where MANIFEST_EXCH_LOG_GPTMP.CUSTOMS_CODE=MANIFEST_EXCH_LOG_GPTMP_TODAY.CUSTOMS_CODE AND MANIFEST_EXCH_LOG_GPTMP.SHIP_ID=MANIFEST_EXCH_LOG_GPTMP_TODAY.SHIP_ID AND MANIFEST_EXCH_LOG_GPTMP.VOYAGE_NO=MANIFEST_EXCH_LOG_GPTMP_TODAY.VOYAGE_NO AND MANIFEST_EXCH_LOG_GPTMP.BILL_NO=MANIFEST_EXCH_LOG_GPTMP_TODAY.BILL_NO AND MANIFEST_EXCH_LOG_GPTMP.I_E_DATE=MANIFEST_EXCH_LOG_GPTMP_TODAY.I_E_DATE ;
insert into MANIFEST_EXCH_LOG_GPTMP_TODAY (CMD_TYPE,CUSTOMS_CODE,VOYAGE_NO,SHIP_ID,BILL_NO,I_E_DATE,I_E_FLAG,TRAF_MODE,SHIP_NAME_EN,NOTICE_DATE,FILE_NAME,MANTFEST_NO,OP_MODE,MODIFY_TIMES,NEW_CHANNEL,SUR_NOTICE_DATE,SUR_FILE_NAME,SUR_ER,INSE_NOTICE_DATE,INSE_FILE_NAME,INSE_CHANNEL,EXCH_NOTICE_DATE,EXCH_FILE_NAME,EXCH_OP_TACHE,EXCH_ER,CHK_NOTICE_DATE,CHK_FILE_NAME,CHK_OP_TACHE,CHK_ER,REL_NOTICE_DATE,REL_FILE_NAME,REL_OP_TACHE,REL_ER,NOTES) select CMD_TYPE,CUSTOMS_CODE,VOYAGE_NO,SHIP_ID,BILL_NO,I_E_DATE,I_E_FLAG,TRAF_MODE,SHIP_NAME_EN,NOTICE_DATE,FILE_NAME,MANTFEST_NO,OP_MODE,MODIFY_TIMES,NEW_CHANNEL,SUR_NOTICE_DATE,SUR_FILE_NAME,SUR_ER,INSE_NOTICE_DATE,INSE_FILE_NAME,INSE_CHANNEL,EXCH_NOTICE_DATE,EXCH_FILE_NAME,EXCH_OP_TACHE,EXCH_ER,CHK_NOTICE_DATE,CHK_FILE_NAME,CHK_OP_TACHE,CHK_ER,REL_NOTICE_DATE,REL_FILE_NAME,REL_OP_TACHE,REL_ER,NOTES from MANIFEST_EXCH_LOG_INC_EXT;
delete from MANIFEST_EXCH_LOG_GPTMP;
\timing
