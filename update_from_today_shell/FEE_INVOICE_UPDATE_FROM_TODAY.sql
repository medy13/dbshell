\echo -----------------------FEE_INVOICE------------------------
select now();
\timing
delete from FEE_INVOICE using FEE_INVOICE_GPTMP_TODAY where FEE_INVOICE.MANUAL_NO=FEE_INVOICE_GPTMP_TODAY.MANUAL_NO AND FEE_INVOICE.F_NO=FEE_INVOICE_GPTMP_TODAY.F_NO ;
insert into FEE_INVOICE (MANUAL_NO,F_NO,FEE_ID,CREATE_DATE,CHK_ER,TYPE_ER,TYPE_DATE,FINANCIAL_FLAG,FINANCIAL_DATE,BOOK_NO,FEE_AMT,NOTE_S) select MANUAL_NO,F_NO,FEE_ID,CREATE_DATE,CHK_ER,TYPE_ER,TYPE_DATE,FINANCIAL_FLAG,FINANCIAL_DATE,BOOK_NO,FEE_AMT,NOTE_S from FEE_INVOICE_GPTMP_TODAY  where CMD_TYPE='I';
\timing
