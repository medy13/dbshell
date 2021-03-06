\echo ------------------PRE_INVESTER_REL----------------
select now();
\timing
insert into PRE_INVESTER_REL_GPTMP (CMD_TYPE,PRE_TRADE_CO, INV_NO) select CMD_TYPE,PRE_TRADE_CO, INV_NO from PRE_INVESTER_REL_INC_EXT;

delete from PRE_INVESTER_REL using PRE_INVESTER_REL_GPTMP where PRE_INVESTER_REL_GPTMP.PRE_TRADE_CO=PRE_INVESTER_REL.PRE_TRADE_CO AND PRE_INVESTER_REL_GPTMP.INV_NO=PRE_INVESTER_REL.INV_NO ;

insert into PRE_INVESTER_REL(PRE_TRADE_CO,INV_NO,INV_CO,INV_MOD,INV_FUND,ACT_FUND,INV_DATE,INV_COUNTRY) select PRE_TRADE_CO,INV_NO,INV_CO,INV_MOD,INV_FUND,ACT_FUND,INV_DATE,INV_COUNTRY from PRE_INVESTER_REL_INC_EXT where CMD_TYPE='I';

delete from PRE_INVESTER_REL_GPTMP;

\timing
