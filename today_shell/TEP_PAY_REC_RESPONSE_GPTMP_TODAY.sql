\echo ------------------TEP_PAY_REC_RESPONSE----------------
select now();
\timing
delete from TEP_PAY_REC_RESPONSE_GPTMP;
insert into TEP_PAY_REC_RESPONSE_GPTMP (CMD_TYPE,RESPONSE_DATE, TRANS_NO) select CMD_TYPE,RESPONSE_DATE, TRANS_NO from TEP_PAY_REC_RESPONSE_INC_EXT;
delete from TEP_PAY_REC_RESPONSE_GPTMP_TODAY using TEP_PAY_REC_RESPONSE_GPTMP where TEP_PAY_REC_RESPONSE_GPTMP.RESPONSE_DATE=TEP_PAY_REC_RESPONSE_GPTMP_TODAY.RESPONSE_DATE AND TEP_PAY_REC_RESPONSE_GPTMP.TRANS_NO=TEP_PAY_REC_RESPONSE_GPTMP_TODAY.TRANS_NO ;
insert into TEP_PAY_REC_RESPONSE_GPTMP_TODAY (CMD_TYPE,RESPONSE_DATE,TRANS_NO,RESPONSE_TIME,REC_CODE,MEMO) select CMD_TYPE,RESPONSE_DATE,TRANS_NO,RESPONSE_TIME,REC_CODE,MEMO from TEP_PAY_REC_RESPONSE_INC_EXT;
delete from TEP_PAY_REC_RESPONSE_GPTMP;
\timing
