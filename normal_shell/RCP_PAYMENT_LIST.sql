\echo ------------------RCP_PAYMENT_LIST----------------
select now();
\timing
insert into RCP_PAYMENT_LIST_GPTMP (CMD_TYPE,LEVYNO, LISTNO) select CMD_TYPE,LEVYNO, LISTNO from RCP_PAYMENT_LIST_INC_EXT;

delete from RCP_PAYMENT_LIST using RCP_PAYMENT_LIST_GPTMP where RCP_PAYMENT_LIST_GPTMP.LEVYNO=RCP_PAYMENT_LIST.LEVYNO AND RCP_PAYMENT_LIST_GPTMP.LISTNO=RCP_PAYMENT_LIST.LISTNO ;

insert into RCP_PAYMENT_LIST(LEVYNO,LISTNO,CUSTOMSDATE) select LEVYNO,LISTNO,CUSTOMSDATE from RCP_PAYMENT_LIST_INC_EXT where CMD_TYPE='I';

delete from RCP_PAYMENT_LIST_GPTMP;

\timing
