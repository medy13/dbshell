\echo ------------------BAK_DCG_BILL_LIST----------------
select now();
\timing
insert into BAK_DCG_BILL_LIST_GPTMP (CMD_TYPE,BILL_NO, G_TYPE, G_NO) select CMD_TYPE,BILL_NO, G_TYPE, G_NO from BAK_DCG_BILL_LIST_INC_EXT;

delete from BAK_DCG_BILL_LIST using BAK_DCG_BILL_LIST_GPTMP where BAK_DCG_BILL_LIST_GPTMP.BILL_NO=BAK_DCG_BILL_LIST.BILL_NO AND BAK_DCG_BILL_LIST_GPTMP.G_TYPE=BAK_DCG_BILL_LIST.G_TYPE AND BAK_DCG_BILL_LIST_GPTMP.G_NO=BAK_DCG_BILL_LIST.G_NO ;

insert into BAK_DCG_BILL_LIST(BILL_NO,G_TYPE,G_NO,DCG_G_NO,QTY,CHECK_DATE,COP_QTY,COP_UNIT,G_MARK) select BILL_NO,G_TYPE,G_NO,DCG_G_NO,QTY,CHECK_DATE,COP_QTY,COP_UNIT,G_MARK from BAK_DCG_BILL_LIST_INC_EXT where CMD_TYPE='I';

delete from BAK_DCG_BILL_LIST_GPTMP;

\timing
