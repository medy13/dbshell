\echo ------------------ENTRY_AUTOREL_ERR_LOG----------------
select now();
\timing
insert into ENTRY_AUTOREL_ERR_LOG_GPTMP (CMD_TYPE,ENTRY_ID, DEL_TIME) select CMD_TYPE,ENTRY_ID, DEL_TIME from ENTRY_AUTOREL_ERR_LOG_INC_EXT;

delete from ENTRY_AUTOREL_ERR_LOG using ENTRY_AUTOREL_ERR_LOG_GPTMP where ENTRY_AUTOREL_ERR_LOG_GPTMP.ENTRY_ID=ENTRY_AUTOREL_ERR_LOG.ENTRY_ID AND ENTRY_AUTOREL_ERR_LOG_GPTMP.DEL_TIME=ENTRY_AUTOREL_ERR_LOG.DEL_TIME ;

insert into ENTRY_AUTOREL_ERR_LOG(ENTRY_ID,DEL_TIME,DEL_OP_ID,I_E_FLAG,DECL_PORT,TRADE_CO,TRADE_NAME,AGENT_CODE,AGENT_NAME,CREATE_DATE,DESCRIPTION) select ENTRY_ID,DEL_TIME,DEL_OP_ID,I_E_FLAG,DECL_PORT,TRADE_CO,TRADE_NAME,AGENT_CODE,AGENT_NAME,CREATE_DATE,DESCRIPTION from ENTRY_AUTOREL_ERR_LOG_INC_EXT where CMD_TYPE='I';

delete from ENTRY_AUTOREL_ERR_LOG_GPTMP;

\timing
