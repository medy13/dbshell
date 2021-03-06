\echo ------------------PAPERLESS_SELFSAVE_CERT----------------
select now();
\timing
insert into PAPERLESS_SELFSAVE_CERT_GPTMP (CMD_TYPE,ENTRY_ID) select CMD_TYPE,ENTRY_ID from PAPERLESS_SELFSAVE_CERT_INC_EXT;

delete from PAPERLESS_SELFSAVE_CERT using PAPERLESS_SELFSAVE_CERT_GPTMP where PAPERLESS_SELFSAVE_CERT_GPTMP.ENTRY_ID=PAPERLESS_SELFSAVE_CERT.ENTRY_ID ;

insert into PAPERLESS_SELFSAVE_CERT(ENTRY_ID,I_E_FLAG,DECL_PORT,REL_TIME,AGENT_CODE,TRADE_CO,TRADE_NAME,AGENT_NAME,PRINT_TIME,PROC_MARK,D_DATE) select ENTRY_ID,I_E_FLAG,DECL_PORT,REL_TIME,AGENT_CODE,TRADE_CO,TRADE_NAME,AGENT_NAME,PRINT_TIME,PROC_MARK,D_DATE from PAPERLESS_SELFSAVE_CERT_INC_EXT where CMD_TYPE='I';

delete from PAPERLESS_SELFSAVE_CERT_GPTMP;

\timing
