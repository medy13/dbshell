\echo ------------------CCTS_ONLINE_RESULT_BAK----------------
select now();
\timing
delete from CCTS_ONLINE_RESULT_BAK_GPTMP;
insert into CCTS_ONLINE_RESULT_BAK_GPTMP (CMD_TYPE,SEQUENCE_NO) select CMD_TYPE,SEQUENCE_NO from CCTS_ONLINE_RESULT_BAK_INC_EXT;
delete from CCTS_ONLINE_RESULT_BAK_GPTMP_TODAY using CCTS_ONLINE_RESULT_BAK_GPTMP where CCTS_ONLINE_RESULT_BAK_GPTMP.SEQUENCE_NO=CCTS_ONLINE_RESULT_BAK_GPTMP_TODAY.SEQUENCE_NO ;
insert into CCTS_ONLINE_RESULT_BAK_GPTMP_TODAY (CMD_TYPE,SEQUENCE_NO,FORM_TYPE,ENTRY_ID,CCTS_CODE,CREATE_DATE,COMMENTS,G_NO,CODE_TS,G_NAME,G_MODEL,PROC_TYPE,DERIVE_CODE,RSK_NO,PROC_IDEA,NOTE,P_DEPT) select CMD_TYPE,SEQUENCE_NO,FORM_TYPE,ENTRY_ID,CCTS_CODE,CREATE_DATE,COMMENTS,G_NO,CODE_TS,G_NAME,G_MODEL,PROC_TYPE,DERIVE_CODE,RSK_NO,PROC_IDEA,NOTE,P_DEPT from CCTS_ONLINE_RESULT_BAK_INC_EXT;
delete from CCTS_ONLINE_RESULT_BAK_GPTMP;
\timing