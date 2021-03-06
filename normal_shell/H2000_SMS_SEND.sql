\echo ------------------H2000_SMS_SEND----------------
select now();
\timing
insert into H2000_SMS_SEND_GPTMP (CMD_TYPE,SEQUENCE_NO, FORM_ID, SYSTEM_ID, POS_ID, OP_TIME, PHONE_NO) select CMD_TYPE,SEQUENCE_NO, FORM_ID, SYSTEM_ID, POS_ID, OP_TIME, PHONE_NO from H2000_SMS_SEND_INC_EXT;

delete from H2000_SMS_SEND using H2000_SMS_SEND_GPTMP where H2000_SMS_SEND_GPTMP.SEQUENCE_NO=H2000_SMS_SEND.SEQUENCE_NO AND H2000_SMS_SEND_GPTMP.FORM_ID=H2000_SMS_SEND.FORM_ID AND H2000_SMS_SEND_GPTMP.SYSTEM_ID=H2000_SMS_SEND.SYSTEM_ID AND H2000_SMS_SEND_GPTMP.POS_ID=H2000_SMS_SEND.POS_ID AND H2000_SMS_SEND_GPTMP.OP_TIME=H2000_SMS_SEND.OP_TIME AND H2000_SMS_SEND_GPTMP.PHONE_NO=H2000_SMS_SEND.PHONE_NO ;

insert into H2000_SMS_SEND(SEQUENCE_NO,FORM_ID,CUSTOMS_CODE,SYSTEM_ID,POS_ID,OP_TIME,PHONE_NO,MSG_TEXT,PROC_FLAG,NOTES) select SEQUENCE_NO,FORM_ID,CUSTOMS_CODE,SYSTEM_ID,POS_ID,OP_TIME,PHONE_NO,MSG_TEXT,PROC_FLAG,NOTES from H2000_SMS_SEND_INC_EXT where CMD_TYPE='I';

delete from H2000_SMS_SEND_GPTMP;

\timing
