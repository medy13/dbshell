\echo -----------------------ENTRY_CERTIFICATE_LOG------------------------
select now();
\timing
delete from ENTRY_CERTIFICATE_LOG using ENTRY_CERTIFICATE_LOG_GPTMP_TODAY where ENTRY_CERTIFICATE_LOG.ENTRY_ID=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.ENTRY_ID AND ENTRY_CERTIFICATE_LOG.DOCU_CODE=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.DOCU_CODE AND ENTRY_CERTIFICATE_LOG.CERT_CODE=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.CERT_CODE AND ENTRY_CERTIFICATE_LOG.OP_TIME=ENTRY_CERTIFICATE_LOG_GPTMP_TODAY.OP_TIME ;
insert into ENTRY_CERTIFICATE_LOG (ENTRY_ID,DOCU_CODE,CERT_CODE,OP_TIME) select ENTRY_ID,DOCU_CODE,CERT_CODE,OP_TIME from ENTRY_CERTIFICATE_LOG_GPTMP_TODAY  where CMD_TYPE='I';
\timing
