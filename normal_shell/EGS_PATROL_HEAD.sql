\echo ------------------EGS_PATROL_HEAD----------------
select now();
\timing
insert into EGS_PATROL_HEAD_GPTMP (CMD_TYPE,PAT_NO) select CMD_TYPE,PAT_NO from EGS_PATROL_HEAD_INC_EXT;

delete from EGS_PATROL_HEAD using EGS_PATROL_HEAD_GPTMP where EGS_PATROL_HEAD_GPTMP.PAT_NO=EGS_PATROL_HEAD.PAT_NO ;

insert into EGS_PATROL_HEAD(PAT_NO,PAT_VALUE,MASTER_CUSTOMS,DECL_DATE,END_DATE,EGS_NO,EGS_NAME,PATROLER,NOTES,EXE_MARK) select PAT_NO,PAT_VALUE,MASTER_CUSTOMS,DECL_DATE,END_DATE,EGS_NO,EGS_NAME,PATROLER,NOTES,EXE_MARK from EGS_PATROL_HEAD_INC_EXT where CMD_TYPE='I';

delete from EGS_PATROL_HEAD_GPTMP;

\timing
