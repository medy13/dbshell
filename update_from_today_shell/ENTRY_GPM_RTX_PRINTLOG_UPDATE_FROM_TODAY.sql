\echo -----------------------ENTRY_GPM_RTX_PRINTLOG------------------------
select now();
\timing
delete from ENTRY_GPM_RTX_PRINTLOG using ENTRY_GPM_RTX_PRINTLOG_GPTMP_TODAY where ENTRY_GPM_RTX_PRINTLOG.ENTRY_ID=ENTRY_GPM_RTX_PRINTLOG_GPTMP_TODAY.ENTRY_ID AND ENTRY_GPM_RTX_PRINTLOG.PRINT_TYPE=ENTRY_GPM_RTX_PRINTLOG_GPTMP_TODAY.PRINT_TYPE AND ENTRY_GPM_RTX_PRINTLOG.PRINT_DATE=ENTRY_GPM_RTX_PRINTLOG_GPTMP_TODAY.PRINT_DATE ;
insert into ENTRY_GPM_RTX_PRINTLOG (ENTRY_ID,PRINT_TYPE,PRINT_DATE,PRINT_ER) select ENTRY_ID,PRINT_TYPE,PRINT_DATE,PRINT_ER from ENTRY_GPM_RTX_PRINTLOG_GPTMP_TODAY  where CMD_TYPE='I';
\timing
