\echo ------------------ENTRY_CERTIFICATE----------------
select now();
\timing
insert into ENTRY_CERTIFICATE_GPTMP (CMD_TYPE,ENTRY_ID, DOCU_CODE, CERT_CODE) select CMD_TYPE,ENTRY_ID, DOCU_CODE, CERT_CODE from ENTRY_CERTIFICATE_INC_EXT;

delete from ENTRY_CERTIFICATE using ENTRY_CERTIFICATE_GPTMP where ENTRY_CERTIFICATE_GPTMP.ENTRY_ID=ENTRY_CERTIFICATE.ENTRY_ID AND ENTRY_CERTIFICATE_GPTMP.DOCU_CODE=ENTRY_CERTIFICATE.DOCU_CODE AND ENTRY_CERTIFICATE_GPTMP.CERT_CODE=ENTRY_CERTIFICATE.CERT_CODE ;

insert into ENTRY_CERTIFICATE(ENTRY_ID,DOCU_CODE,CERT_CODE) select ENTRY_ID,DOCU_CODE,CERT_CODE from ENTRY_CERTIFICATE_INC_EXT where CMD_TYPE='I';

delete from ENTRY_CERTIFICATE_GPTMP;

\timing
