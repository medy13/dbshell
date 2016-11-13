\echo ------------------RSK_WORKFLOW----------------
select now();
\timing
delete from RSK_WORKFLOW_GPTMP;
insert into RSK_WORKFLOW_GPTMP (CMD_TYPE,ENTRY_ID, EXAM_REC_ID) select CMD_TYPE,ENTRY_ID, EXAM_REC_ID from RSK_WORKFLOW_INC_EXT;
delete from RSK_WORKFLOW_GPTMP_TODAY using RSK_WORKFLOW_GPTMP where RSK_WORKFLOW_GPTMP.ENTRY_ID=RSK_WORKFLOW_GPTMP_TODAY.ENTRY_ID AND RSK_WORKFLOW_GPTMP.EXAM_REC_ID=RSK_WORKFLOW_GPTMP_TODAY.EXAM_REC_ID ;
insert into RSK_WORKFLOW_GPTMP_TODAY (CMD_TYPE,ENTRY_ID,EXAM_REC_ID,CHK_CUSTOMS_CODE,INPUT_DATE,EXAM_PRINT,EXAM_CONTA_FLAG,PRINT_TIME,EXAM_E_TIME,ALC_DATE,MAC_TIME,EXAM_TIME,EXAM_PROC_TIME,LAST_RESULT_TIME,EXAM_CONTA_PERIOD,EXAM_CHK_PERIOD,EXAM_PROC_PERIOD) select CMD_TYPE,ENTRY_ID,EXAM_REC_ID,CHK_CUSTOMS_CODE,INPUT_DATE,EXAM_PRINT,EXAM_CONTA_FLAG,PRINT_TIME,EXAM_E_TIME,ALC_DATE,MAC_TIME,EXAM_TIME,EXAM_PROC_TIME,LAST_RESULT_TIME,EXAM_CONTA_PERIOD,EXAM_CHK_PERIOD,EXAM_PROC_PERIOD from RSK_WORKFLOW_INC_EXT;
delete from RSK_WORKFLOW_GPTMP;
\timing