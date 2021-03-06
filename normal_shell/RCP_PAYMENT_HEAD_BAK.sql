\echo ------------------RCP_PAYMENT_HEAD_BAK----------------
select now();
\timing
insert into RCP_PAYMENT_HEAD_BAK_GPTMP (CMD_TYPE,LEVYNO) select CMD_TYPE,LEVYNO from RCP_PAYMENT_HEAD_BAK_INC_EXT;

delete from RCP_PAYMENT_HEAD_BAK using RCP_PAYMENT_HEAD_BAK_GPTMP where RCP_PAYMENT_HEAD_BAK_GPTMP.LEVYNO=RCP_PAYMENT_HEAD_BAK.LEVYNO ;

insert into RCP_PAYMENT_HEAD_BAK(LEVYNO,BANKORGCODE,PAYERNAME,PAYERORGCODE,PAYERCGACCODE,PAYERACCT,PAYEENAME,PAYEECOUNTRYCODE,SWIFTBIC,PAYERDATE,PAYERCNY,PAYERAMT,CUSTOMSAMT,PREPAYERAMT,REFUNDMENTAMT,BALANCEMODE,ACCOUNTPERIOD,BANKTRANO,ADDWORD) select LEVYNO,BANKORGCODE,PAYERNAME,PAYERORGCODE,PAYERCGACCODE,PAYERACCT,PAYEENAME,PAYEECOUNTRYCODE,SWIFTBIC,PAYERDATE,PAYERCNY,PAYERAMT,CUSTOMSAMT,PREPAYERAMT,REFUNDMENTAMT,BALANCEMODE,ACCOUNTPERIOD,BANKTRANO,ADDWORD from RCP_PAYMENT_HEAD_BAK_INC_EXT where CMD_TYPE='I';

delete from RCP_PAYMENT_HEAD_BAK_GPTMP;

\timing
