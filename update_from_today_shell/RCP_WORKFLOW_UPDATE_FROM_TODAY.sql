\echo -----------------------RCP_WORKFLOW------------------------
select now();
\timing
delete from RCP_WORKFLOW using RCP_WORKFLOW_GPTMP_TODAY where RCP_WORKFLOW.LEVYNO=RCP_WORKFLOW_GPTMP_TODAY.LEVYNO AND RCP_WORKFLOW.TRANSFER_NUM=RCP_WORKFLOW_GPTMP_TODAY.TRANSFER_NUM AND RCP_WORKFLOW.PROCESS_STATUS=RCP_WORKFLOW_GPTMP_TODAY.PROCESS_STATUS AND RCP_WORKFLOW.PROCESS_DATE=RCP_WORKFLOW_GPTMP_TODAY.PROCESS_DATE ;
insert into RCP_WORKFLOW (LEVYNO,TRANSFER_NUM,PROCESS_STATUS,PROCESS_DATE,ENTRY_ID,NOTE) select LEVYNO,TRANSFER_NUM,PROCESS_STATUS,PROCESS_DATE,ENTRY_ID,NOTE from RCP_WORKFLOW_GPTMP_TODAY  where CMD_TYPE='I';
\timing