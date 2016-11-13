\echo ------------------TRANSFER_FEE_LOG----------------
select now();
\timing
delete from TRANSFER_FEE_LOG_GPTMP;
insert into TRANSFER_FEE_LOG_GPTMP (CMD_TYPE,MANUAL_NO, RTN_MANUAL_NO, CREATE_DATE) select CMD_TYPE,MANUAL_NO, RTN_MANUAL_NO, CREATE_DATE from TRANSFER_FEE_LOG_INC_EXT;
delete from TRANSFER_FEE_LOG_GPTMP_TODAY using TRANSFER_FEE_LOG_GPTMP where TRANSFER_FEE_LOG_GPTMP.MANUAL_NO=TRANSFER_FEE_LOG_GPTMP_TODAY.MANUAL_NO AND TRANSFER_FEE_LOG_GPTMP.RTN_MANUAL_NO=TRANSFER_FEE_LOG_GPTMP_TODAY.RTN_MANUAL_NO AND TRANSFER_FEE_LOG_GPTMP.CREATE_DATE=TRANSFER_FEE_LOG_GPTMP_TODAY.CREATE_DATE ;
insert into TRANSFER_FEE_LOG_GPTMP_TODAY (CMD_TYPE,MANUAL_NO,RTN_MANUAL_NO,CREATE_DATE,TRANSFER_FEE) select CMD_TYPE,MANUAL_NO,RTN_MANUAL_NO,CREATE_DATE,TRANSFER_FEE from TRANSFER_FEE_LOG_INC_EXT;
delete from TRANSFER_FEE_LOG_GPTMP;
\timing