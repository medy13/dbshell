\echo -----------------------BWS_DCR_BILL_LIST------------------------
select now();
\timing
delete from BWS_DCR_BILL_LIST using BWS_DCR_BILL_LIST_GPTMP_TODAY where BWS_DCR_BILL_LIST.BWS_NO=BWS_DCR_BILL_LIST_GPTMP_TODAY.BWS_NO AND BWS_DCR_BILL_LIST.DCR_TIMES=BWS_DCR_BILL_LIST_GPTMP_TODAY.DCR_TIMES AND BWS_DCR_BILL_LIST.G_TYPE=BWS_DCR_BILL_LIST_GPTMP_TODAY.G_TYPE AND BWS_DCR_BILL_LIST.G_NO=BWS_DCR_BILL_LIST_GPTMP_TODAY.G_NO ;
insert into BWS_DCR_BILL_LIST (BWS_NO,DCR_TIMES,G_TYPE,G_NO,CUSTOMS_CODE,TRANS_MODE,DECLARE_DATE,TRANS_DATE,DU_CODE,NOTE) select BWS_NO,DCR_TIMES,G_TYPE,G_NO,CUSTOMS_CODE,TRANS_MODE,DECLARE_DATE,TRANS_DATE,DU_CODE,NOTE from BWS_DCR_BILL_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing
