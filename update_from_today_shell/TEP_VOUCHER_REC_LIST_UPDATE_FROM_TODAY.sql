\echo -----------------------TEP_VOUCHER_REC_LIST------------------------
select now();
\timing
delete from TEP_VOUCHER_REC_LIST using TEP_VOUCHER_REC_LIST_GPTMP_TODAY where TEP_VOUCHER_REC_LIST.VOUCHER_RECEIVABLE_SEQ_NO=TEP_VOUCHER_REC_LIST_GPTMP_TODAY.VOUCHER_RECEIVABLE_SEQ_NO ;
insert into TEP_VOUCHER_REC_LIST (VOUCHER_RECEIVABLE_SEQ_NO,VOUCHER_PRODUCE_TIME,CUSTOMS_CODE,CUSTOMS_NAME) select VOUCHER_RECEIVABLE_SEQ_NO,VOUCHER_PRODUCE_TIME,CUSTOMS_CODE,CUSTOMS_NAME from TEP_VOUCHER_REC_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing
