\echo -----------------------RSK_INSTR_PROC_REL------------------------
select now();
\timing
delete from RSK_INSTR_PROC_REL using RSK_INSTR_PROC_REL_GPTMP_TODAY where RSK_INSTR_PROC_REL.RSK_NO=RSK_INSTR_PROC_REL_GPTMP_TODAY.RSK_NO AND RSK_INSTR_PROC_REL.RSK_POS=RSK_INSTR_PROC_REL_GPTMP_TODAY.RSK_POS ;
insert into RSK_INSTR_PROC_REL (RSK_NO,RSK_POS,RSK_REQUEST_STR,RSK_PROC_TYPE_STR,INFO_REQUEST_DETAIL) select RSK_NO,RSK_POS,RSK_REQUEST_STR,RSK_PROC_TYPE_STR,INFO_REQUEST_DETAIL from RSK_INSTR_PROC_REL_GPTMP_TODAY  where CMD_TYPE='I';
\timing
