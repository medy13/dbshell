\echo -----------------------RCP_INCOME_HEAD_BAK------------------------
select now();
\timing
delete from RCP_INCOME_HEAD_BAK using RCP_INCOME_HEAD_BAK_GPTMP_TODAY where RCP_INCOME_HEAD_BAK.LEVYNO=RCP_INCOME_HEAD_BAK_GPTMP_TODAY.LEVYNO ;
insert into RCP_INCOME_HEAD_BAK (LEVYNO,BANKORGCODE,PAYEENAME,PAYEEORGCODE,PAYEECGACCODE,PAYEEACCT,PAYERNAME,PAYERCOUNTRYCODE,SWIFTBIC,PAYEEDATE,PAYEECNY,PAYEEAMT,CUSTOMSAMT,PREPAYEEAMT,REFUNDMENTAMT,BALANCEMODE,ACCOUNTPERIOD,BANKTRANO,ADDWORD) select LEVYNO,BANKORGCODE,PAYEENAME,PAYEEORGCODE,PAYEECGACCODE,PAYEEACCT,PAYERNAME,PAYERCOUNTRYCODE,SWIFTBIC,PAYEEDATE,PAYEECNY,PAYEEAMT,CUSTOMSAMT,PREPAYEEAMT,REFUNDMENTAMT,BALANCEMODE,ACCOUNTPERIOD,BANKTRANO,ADDWORD from RCP_INCOME_HEAD_BAK_GPTMP_TODAY  where CMD_TYPE='I';
\timing