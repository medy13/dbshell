\echo -----------------------EX_TRANS_HIS_CONTA_REL------------------------
select now();
\timing
delete from EX_TRANS_HIS_CONTA_REL using EX_TRANS_HIS_CONTA_REL_GPTMP_TODAY where EX_TRANS_HIS_CONTA_REL.PRE_NO=EX_TRANS_HIS_CONTA_REL_GPTMP_TODAY.PRE_NO AND EX_TRANS_HIS_CONTA_REL.RECORD_NUMBER=EX_TRANS_HIS_CONTA_REL_GPTMP_TODAY.RECORD_NUMBER AND EX_TRANS_HIS_CONTA_REL.CONTA_NO=EX_TRANS_HIS_CONTA_REL_GPTMP_TODAY.CONTA_NO ;
insert into EX_TRANS_HIS_CONTA_REL (PRE_NO,RECORD_NUMBER,CONTA_NO,TRANS_NAME,TRANS_WEIGHT,CONTA_MODEL,SEAL_NO,SEAL_NUM,CONTA_CHECK_MARK,CONTA_CHK_ER,CONTA_CHK_TIME,EXAM_FLAG,CONTA1) select PRE_NO,RECORD_NUMBER,CONTA_NO,TRANS_NAME,TRANS_WEIGHT,CONTA_MODEL,SEAL_NO,SEAL_NUM,CONTA_CHECK_MARK,CONTA_CHK_ER,CONTA_CHK_TIME,EXAM_FLAG,CONTA1 from EX_TRANS_HIS_CONTA_REL_GPTMP_TODAY  where CMD_TYPE='I';
\timing