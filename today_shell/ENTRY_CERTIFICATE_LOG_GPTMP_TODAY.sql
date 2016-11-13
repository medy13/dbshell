\echo ------------------ENTRY_CERTIFICATE_LOG----------------
select now();
\timing
delete from ENTRY_CERTIFICATE_LOG_GPTMP;
insert into ENTRY_CERTIFICATE_LOG_GPTMP (CMD_TYPE,ENTRY_ID, DOCU_CODE, CERT_CODE, OP_TIME) select CMD_TYPE,ENTRY_ID, DOCU_CODE, CERT_CODE, OP_TIME from ENTRY_CERTIFICATE_LOG_INC_EXT;
delete from ENTRY_CERTIFICATE_LOG_GPTMP_TODAY using ENTRY_CERTIFICATE_LOG_GPTMP where ENTRY_CERTIFICATE_LOG_GPTMP.ENTRY_ID=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.ENTRY_ID AND ENTRY_CERTIFICATE_LOG_GPTMP.DOCU_CODE=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.DOCU_CODE AND ENTRY_CERTIFICATE_LOG_GPTMP.CERT_CODE=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.CERT_CODE AND ENTRY_CERTIFICATE_LOG_GPTMP.OP_TIME=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.OP_TIME ;
insert into ENTRY_CERTIFICATE_LOG_GPTMP_TODAY (CMD_TYPE,ENTRY_ID,DOCU_CODE,CERT_CODE,OP_TIME) select CMD_TYPE,ENTRY_ID,DOCU_CODE,CERT_CODE,OP_TIME from ENTRY_CERTIFICATE_LOG_INC_EXT;
delete from ENTRY_CERTIFICATE_LOG_GPTMP;
\timing