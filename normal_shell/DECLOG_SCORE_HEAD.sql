\echo ------------------DECLOG_SCORE_HEAD----------------
select now();
\timing
insert into DECLOG_SCORE_HEAD_GPTMP (CMD_TYPE,DECL_CO, FORM_ID, SCORE_TIME) select CMD_TYPE,DECL_CO, FORM_ID, SCORE_TIME from DECLOG_SCORE_HEAD_INC_EXT;

delete from DECLOG_SCORE_HEAD using DECLOG_SCORE_HEAD_GPTMP where DECLOG_SCORE_HEAD_GPTMP.DECL_CO=DECLOG_SCORE_HEAD.DECL_CO AND DECLOG_SCORE_HEAD_GPTMP.FORM_ID=DECLOG_SCORE_HEAD.FORM_ID AND DECLOG_SCORE_HEAD_GPTMP.SCORE_TIME=DECLOG_SCORE_HEAD.SCORE_TIME ;

insert into DECLOG_SCORE_HEAD(DECL_CO,FORM_ID,AGENT_CODE,SCORE_STEP,ERROR_SCORE,SCORE_TIME,SCORE_PROC_ER,CUSTOMS_CODE,RETURN_REASON,RETURN_PROC_ER,RETURN_DATE) select DECL_CO,FORM_ID,AGENT_CODE,SCORE_STEP,ERROR_SCORE,SCORE_TIME,SCORE_PROC_ER,CUSTOMS_CODE,RETURN_REASON,RETURN_PROC_ER,RETURN_DATE from DECLOG_SCORE_HEAD_INC_EXT where CMD_TYPE='I';

delete from DECLOG_SCORE_HEAD_GPTMP;

\timing