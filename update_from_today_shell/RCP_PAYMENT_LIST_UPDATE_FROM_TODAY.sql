\echo -----------------------RCP_PAYMENT_LIST------------------------
select now();
\timing
delete from RCP_PAYMENT_LIST using RCP_PAYMENT_LIST_GPTMP_TODAY where RCP_PAYMENT_LIST.LEVYNO=RCP_PAYMENT_LIST_GPTMP_TODAY.LEVYNO AND RCP_PAYMENT_LIST.LISTNO=RCP_PAYMENT_LIST_GPTMP_TODAY.LISTNO ;
insert into RCP_PAYMENT_LIST (LEVYNO,LISTNO,CUSTOMSDATE) select LEVYNO,LISTNO,CUSTOMSDATE from RCP_PAYMENT_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing
