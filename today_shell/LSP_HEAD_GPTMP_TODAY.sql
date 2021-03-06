\echo ------------------LSP_HEAD----------------
select now();
\timing
delete from LSP_HEAD_GPTMP;
insert into LSP_HEAD_GPTMP (CMD_TYPE,LSP_ID, LSP_TYPE, I_E_FLAG) select CMD_TYPE,LSP_ID, LSP_TYPE, I_E_FLAG from LSP_HEAD_INC_EXT;
delete from LSP_HEAD_GPTMP_TODAY using LSP_HEAD_GPTMP where LSP_HEAD_GPTMP.LSP_ID=LSP_HEAD_GPTMP_TODAY.LSP_ID AND LSP_HEAD_GPTMP.LSP_TYPE=LSP_HEAD_GPTMP_TODAY.LSP_TYPE AND LSP_HEAD_GPTMP.I_E_FLAG=LSP_HEAD_GPTMP_TODAY.I_E_FLAG ;
insert into LSP_HEAD_GPTMP_TODAY (CMD_TYPE,LSP_ID,LSP_TYPE,I_E_FLAG,EPORT_ID,LSP_DEPART_CODE,LSL_DEPART_NAME,DECL_PORT,OWNER_CODE,OWNER_ST_CODE,OWNER_NAME,TRADE_MODE,TRADE_MODE_NAME,CONTR_NO,TRAF_NAME,VOYAGE_NO,BILL_NO,TRADE_COUNTRY,TRADE_COUNTRY_NAME,DISTRICT_CODE,APPR_QTY,QTY_UNIT,APPR_PRICE,PRICE_CURR,OP_FLAG,SIGN_DATE,VALID_DATE,NOTES,SIGN_DATA,PROC_MARK,ENTRY_ID,VERIFY_ER,VERIFY_DATE,CLEAR_ER,CLEAR_DATE,REVOKE_ER,REVOKE_DATE,CREATE_DATE) select CMD_TYPE,LSP_ID,LSP_TYPE,I_E_FLAG,EPORT_ID,LSP_DEPART_CODE,LSL_DEPART_NAME,DECL_PORT,OWNER_CODE,OWNER_ST_CODE,OWNER_NAME,TRADE_MODE,TRADE_MODE_NAME,CONTR_NO,TRAF_NAME,VOYAGE_NO,BILL_NO,TRADE_COUNTRY,TRADE_COUNTRY_NAME,DISTRICT_CODE,APPR_QTY,QTY_UNIT,APPR_PRICE,PRICE_CURR,OP_FLAG,SIGN_DATE,VALID_DATE,NOTES,SIGN_DATA,PROC_MARK,ENTRY_ID,VERIFY_ER,VERIFY_DATE,CLEAR_ER,CLEAR_DATE,REVOKE_ER,REVOKE_DATE,CREATE_DATE from LSP_HEAD_INC_EXT;
delete from LSP_HEAD_GPTMP;
\timing
