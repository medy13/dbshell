\echo -----------------------EGS_PATROL_HEAD------------------------
select now();
\timing
delete from EGS_PATROL_HEAD using EGS_PATROL_HEAD_GPTMP_TODAY where EGS_PATROL_HEAD.PAT_NO=EGS_PATROL_HEAD_GPTMP_TODAY.PAT_NO ;
insert into EGS_PATROL_HEAD (PAT_NO,PAT_VALUE,MASTER_CUSTOMS,DECL_DATE,END_DATE,EGS_NO,EGS_NAME,PATROLER,NOTES,EXE_MARK) select PAT_NO,PAT_VALUE,MASTER_CUSTOMS,DECL_DATE,END_DATE,EGS_NO,EGS_NAME,PATROLER,NOTES,EXE_MARK from EGS_PATROL_HEAD_GPTMP_TODAY  where CMD_TYPE='I';
\timing
