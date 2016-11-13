\echo ------------------RED_RECEIVE_RECEIPT----------------
select now();
\timing
delete from RED_RECEIVE_RECEIPT_GPTMP;
insert into RED_RECEIVE_RECEIPT_GPTMP (CMD_TYPE,CUT_ID, SEND_TIMES) select CMD_TYPE,CUT_ID, SEND_TIMES from RED_RECEIVE_RECEIPT_INC_EXT;
delete from RED_RECEIVE_RECEIPT_GPTMP_TODAY using RED_RECEIVE_RECEIPT_GPTMP where RED_RECEIVE_RECEIPT_GPTMP.CUT_ID=RED_RECEIVE_RECEIPT_GPTMP_TODAY.CUT_ID AND RED_RECEIVE_RECEIPT_GPTMP.SEND_TIMES=RED_RECEIVE_RECEIPT_GPTMP_TODAY.SEND_TIMES ;
insert into RED_RECEIVE_RECEIPT_GPTMP_TODAY (CMD_TYPE,CUT_ID,SEND_TIMES,SEND_CUSTOMS,REC_CUSTOMS_CODE,RECEIVE_DATE,TYPE,LINE,VERSION,FLAG,NOTE) select CMD_TYPE,CUT_ID,SEND_TIMES,SEND_CUSTOMS,REC_CUSTOMS_CODE,RECEIVE_DATE,TYPE,LINE,VERSION,FLAG,NOTE from RED_RECEIVE_RECEIPT_INC_EXT;
delete from RED_RECEIVE_RECEIPT_GPTMP;
\timing