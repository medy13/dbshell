\echo ------------------CDL_COMP_COMM_OP_LOG----------------
select now();
\timing
delete from CDL_COMP_COMM_OP_LOG_GPTMP;
insert into CDL_COMP_COMM_OP_LOG_GPTMP (CMD_TYPE,TRADE_CO, PROC_DATE, PROC_TYPE) select CMD_TYPE,TRADE_CO, PROC_DATE, PROC_TYPE from CDL_COMP_COMM_OP_LOG_INC_EXT;
delete from CDL_COMP_COMM_OP_LOG_GPTMP_TODAY using CDL_COMP_COMM_OP_LOG_GPTMP where CDL_COMP_COMM_OP_LOG_GPTMP.TRADE_CO=CDL_COMP_COMM_OP_LOG_GPTMP_TODAY.TRADE_CO AND CDL_COMP_COMM_OP_LOG_GPTMP.PROC_DATE=CDL_COMP_COMM_OP_LOG_GPTMP_TODAY.PROC_DATE AND CDL_COMP_COMM_OP_LOG_GPTMP.PROC_TYPE=CDL_COMP_COMM_OP_LOG_GPTMP_TODAY.PROC_TYPE ;
insert into CDL_COMP_COMM_OP_LOG_GPTMP_TODAY (CMD_TYPE,TRADE_CO,RECORDS_NO,PRE_RECORDS_NO,CUSTOMS_CODE,RECORDS_DATE,PROC_TYPE,PROC_ER,PROC_DATE,R_NOTES) select CMD_TYPE,TRADE_CO,RECORDS_NO,PRE_RECORDS_NO,CUSTOMS_CODE,RECORDS_DATE,PROC_TYPE,PROC_ER,PROC_DATE,R_NOTES from CDL_COMP_COMM_OP_LOG_INC_EXT;
delete from CDL_COMP_COMM_OP_LOG_GPTMP;
\timing
