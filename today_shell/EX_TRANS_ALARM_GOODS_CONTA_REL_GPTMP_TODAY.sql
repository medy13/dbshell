\echo ------------------EX_TRANS_ALARM_GOODS_CONTA_REL----------------
select now();
\timing
delete from EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP;
insert into EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP (CMD_TYPE,PRE_NO, RECORD_NUMBER, G_NO, CONTA_NO) select CMD_TYPE,PRE_NO, RECORD_NUMBER, G_NO, CONTA_NO from EX_TRANS_ALARM_GOODS_CONTA_REL_INC_EXT;
delete from EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY using EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP where EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP.PRE_NO=EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY.PRE_NO AND EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP.RECORD_NUMBER=EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY.RECORD_NUMBER AND EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP.G_NO=EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY.G_NO AND EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP.CONTA_NO=EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY.CONTA_NO ;
insert into EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP_TODAY (CMD_TYPE,PRE_NO,RECORD_NUMBER,G_NO,CONTA_NO,CONTA_GOODS_COUNT,CONTA_GOODS_WEIGHT) select CMD_TYPE,PRE_NO,RECORD_NUMBER,G_NO,CONTA_NO,CONTA_GOODS_COUNT,CONTA_GOODS_WEIGHT from EX_TRANS_ALARM_GOODS_CONTA_REL_INC_EXT;
delete from EX_TRANS_ALARM_GOODS_CONTA_REL_GPTMP;
\timing