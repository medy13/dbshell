\echo ------------------ENTRY_GPM_RTX_PRINTLOG----------------
select now();
\timing
insert into ENTRY_GPM_RTX_PRINTLOG_GPTMP (CMD_TYPE,ENTRY_ID, PRINT_TYPE, PRINT_DATE) select CMD_TYPE,ENTRY_ID, PRINT_TYPE, PRINT_DATE from ENTRY_GPM_RTX_PRINTLOG_INC_EXT;

delete from ENTRY_GPM_RTX_PRINTLOG using ENTRY_GPM_RTX_PRINTLOG_GPTMP where ENTRY_GPM_RTX_PRINTLOG_GPTMP.ENTRY_ID=ENTRY_GPM_RTX_PRINTLOG.ENTRY_ID AND ENTRY_GPM_RTX_PRINTLOG_GPTMP.PRINT_TYPE=ENTRY_GPM_RTX_PRINTLOG.PRINT_TYPE AND ENTRY_GPM_RTX_PRINTLOG_GPTMP.PRINT_DATE=ENTRY_GPM_RTX_PRINTLOG.PRINT_DATE ;

insert into ENTRY_GPM_RTX_PRINTLOG(ENTRY_ID,PRINT_TYPE,PRINT_DATE,PRINT_ER) select ENTRY_ID,PRINT_TYPE,PRINT_DATE,PRINT_ER from ENTRY_GPM_RTX_PRINTLOG_INC_EXT where CMD_TYPE='I';

delete from ENTRY_GPM_RTX_PRINTLOG_GPTMP;

\timing