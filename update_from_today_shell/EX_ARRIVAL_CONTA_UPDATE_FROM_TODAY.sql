\echo -----------------------EX_ARRIVAL_CONTA------------------------
select now();
\timing
delete from EX_ARRIVAL_CONTA using EX_ARRIVAL_CONTA_GPTMP_TODAY where EX_ARRIVAL_CONTA.CONTA_ID=EX_ARRIVAL_CONTA_GPTMP_TODAY.CONTA_ID AND EX_ARRIVAL_CONTA.BILL_NO=EX_ARRIVAL_CONTA_GPTMP_TODAY.BILL_NO AND EX_ARRIVAL_CONTA.REC_NO=EX_ARRIVAL_CONTA_GPTMP_TODAY.REC_NO ;
insert into EX_ARRIVAL_CONTA (CONTA_ID,BILL_NO,REC_NO,RECV_DATE,CONTA_MODEL,CONTA_STATUS,SEAL_NO,TARE_WEIGHT,TOTAL_CARGO,TOTAL_MEASURE,TOTAL_PACK_NO,TOTAL_WEIGHT,IN_PORT_FLAG,IN_PORT_ADDR,IN_PORT_DATE,D_PORT_CODE,PLACE,ENTRY_ID,CHK_DATE,CHK_ER) select CONTA_ID,BILL_NO,REC_NO,RECV_DATE,CONTA_MODEL,CONTA_STATUS,SEAL_NO,TARE_WEIGHT,TOTAL_CARGO,TOTAL_MEASURE,TOTAL_PACK_NO,TOTAL_WEIGHT,IN_PORT_FLAG,IN_PORT_ADDR,IN_PORT_DATE,D_PORT_CODE,PLACE,ENTRY_ID,CHK_DATE,CHK_ER from EX_ARRIVAL_CONTA_GPTMP_TODAY  where CMD_TYPE='I';
\timing