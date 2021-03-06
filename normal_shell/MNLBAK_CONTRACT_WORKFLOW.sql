\echo ------------------MNLBAK_CONTRACT_WORKFLOW----------------
select now();
\timing
insert into MNLBAK_CONTRACT_WORKFLOW_GPTMP (CMD_TYPE,MANUAL_NO, STEP_ID, PROC_DATE) select CMD_TYPE,MANUAL_NO, STEP_ID, PROC_DATE from MNLBAK_CONTRACT_WORKFLOW_INC_EXT;

delete from MNLBAK_CONTRACT_WORKFLOW using MNLBAK_CONTRACT_WORKFLOW_GPTMP where MNLBAK_CONTRACT_WORKFLOW_GPTMP.MANUAL_NO=MNLBAK_CONTRACT_WORKFLOW.MANUAL_NO AND MNLBAK_CONTRACT_WORKFLOW_GPTMP.STEP_ID=MNLBAK_CONTRACT_WORKFLOW.STEP_ID AND MNLBAK_CONTRACT_WORKFLOW_GPTMP.PROC_DATE=MNLBAK_CONTRACT_WORKFLOW.PROC_DATE ;

insert into MNLBAK_CONTRACT_WORKFLOW(MANUAL_NO,STEP_ID,PROC_DATE,PROC_ER,PROC_ID,PROC_POS,STATUS_STATE) select MANUAL_NO,STEP_ID,PROC_DATE,PROC_ER,PROC_ID,PROC_POS,STATUS_STATE from MNLBAK_CONTRACT_WORKFLOW_INC_EXT where CMD_TYPE='I';

delete from MNLBAK_CONTRACT_WORKFLOW_GPTMP;

\timing
