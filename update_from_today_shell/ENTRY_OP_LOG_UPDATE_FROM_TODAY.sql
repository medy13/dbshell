\echo -----------------------ENTRY_OP_LOG------------------------
select now();
\timing
delete from ENTRY_OP_LOG using ENTRY_OP_LOG_GPTMP_TODAY where ENTRY_OP_LOG.ENTRY_ID=ENTRY_OP_LOG_GPTMP_TODAY.ENTRY_ID AND ENTRY_OP_LOG.OP_TIME=ENTRY_OP_LOG_GPTMP_TODAY.OP_TIME ;
insert into ENTRY_OP_LOG (ENTRY_ID,OP_TIME,OP_TYPE,OP_ER,SRV_PORT) select ENTRY_ID,OP_TIME,OP_TYPE,OP_ER,SRV_PORT from ENTRY_OP_LOG_GPTMP_TODAY  where CMD_TYPE='I';
\timing
