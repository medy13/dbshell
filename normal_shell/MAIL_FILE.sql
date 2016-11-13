\echo ------------------MAIL_FILE----------------
select now();
\timing
insert into MAIL_FILE_GPTMP (CMD_TYPE,NO) select CMD_TYPE,NO from MAIL_FILE_INC_EXT;

delete from MAIL_FILE using MAIL_FILE_GPTMP where MAIL_FILE_GPTMP.NO=MAIL_FILE.NO ;

insert into MAIL_FILE(NO,SEND_PORT,RECV_PORT,NOTE,PROCESS_MARK,RECV_NAME,RECV_DATE,CA_KEY,HASH_SIGN) select NO,SEND_PORT,RECV_PORT,NOTE,PROCESS_MARK,RECV_NAME,RECV_DATE,CA_KEY,HASH_SIGN from MAIL_FILE_INC_EXT where CMD_TYPE='I';

delete from MAIL_FILE_GPTMP;

\timing
