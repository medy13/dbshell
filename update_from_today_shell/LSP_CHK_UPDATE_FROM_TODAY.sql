\echo -----------------------LSP_CHK------------------------
select now();
\timing
delete from LSP_CHK using LSP_CHK_GPTMP_TODAY where LSP_CHK.LSP_ID=LSP_CHK_GPTMP_TODAY.LSP_ID AND LSP_CHK.LSP_TYPE=LSP_CHK_GPTMP_TODAY.LSP_TYPE AND LSP_CHK.I_E_FLAG=LSP_CHK_GPTMP_TODAY.I_E_FLAG AND LSP_CHK.ENTRY_ID=LSP_CHK_GPTMP_TODAY.ENTRY_ID AND LSP_CHK.G_NO=LSP_CHK_GPTMP_TODAY.G_NO ;
insert into LSP_CHK (LSP_ID,LSP_TYPE,I_E_FLAG,ENTRY_ID,G_NO,CREATE_DATE,RMB_PRICE,USD_PRICE,G_QTY,G_UNIT,QTY_1,UNIT_1,CHK_MARK) select LSP_ID,LSP_TYPE,I_E_FLAG,ENTRY_ID,G_NO,CREATE_DATE,RMB_PRICE,USD_PRICE,G_QTY,G_UNIT,QTY_1,UNIT_1,CHK_MARK from LSP_CHK_GPTMP_TODAY  where CMD_TYPE='I';
\timing
