\echo ------------------CDL_LICENSE_DEDUCT----------------
select now();
\timing
insert into CDL_LICENSE_DEDUCT_GPTMP (CMD_TYPE,LIST_NO, G_NO, TRADE_CO, OP_TIME) select CMD_TYPE,LIST_NO, G_NO, TRADE_CO, OP_TIME from CDL_LICENSE_DEDUCT_INC_EXT;

delete from CDL_LICENSE_DEDUCT using CDL_LICENSE_DEDUCT_GPTMP where CDL_LICENSE_DEDUCT_GPTMP.LIST_NO=CDL_LICENSE_DEDUCT.LIST_NO AND CDL_LICENSE_DEDUCT_GPTMP.G_NO=CDL_LICENSE_DEDUCT.G_NO AND CDL_LICENSE_DEDUCT_GPTMP.TRADE_CO=CDL_LICENSE_DEDUCT.TRADE_CO AND CDL_LICENSE_DEDUCT_GPTMP.OP_TIME=CDL_LICENSE_DEDUCT.OP_TIME ;

insert into CDL_LICENSE_DEDUCT(LIST_NO,G_NO,TRADE_CO,QTY_ORI,QTY,DEDUCT_MODE,OP_TIME,OP_ER) select LIST_NO,G_NO,TRADE_CO,QTY_ORI,QTY,DEDUCT_MODE,OP_TIME,OP_ER from CDL_LICENSE_DEDUCT_INC_EXT where CMD_TYPE='I';

delete from CDL_LICENSE_DEDUCT_GPTMP;

\timing