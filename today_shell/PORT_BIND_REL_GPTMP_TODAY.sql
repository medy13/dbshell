\echo ------------------PORT_BIND_REL----------------
select now();
\timing
delete from PORT_BIND_REL_GPTMP;
insert into PORT_BIND_REL_GPTMP (CMD_TYPE,BIND_NO, PRE_NO) select CMD_TYPE,BIND_NO, PRE_NO from PORT_BIND_REL_INC_EXT;
delete from PORT_BIND_REL_GPTMP_TODAY using PORT_BIND_REL_GPTMP where PORT_BIND_REL_GPTMP.BIND_NO=PORT_BIND_REL_GPTMP_TODAY.BIND_NO AND PORT_BIND_REL_GPTMP.PRE_NO=PORT_BIND_REL_GPTMP_TODAY.PRE_NO ;
insert into PORT_BIND_REL_GPTMP_TODAY (CMD_TYPE,BIND_NO,PRE_NO,REC_MARK,SPARE_FIELD) select CMD_TYPE,BIND_NO,PRE_NO,REC_MARK,SPARE_FIELD from PORT_BIND_REL_INC_EXT;
delete from PORT_BIND_REL_GPTMP;
\timing
