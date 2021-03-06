\echo ------------------EGS_DEDUCT----------------
select now();
\timing
insert into EGS_DEDUCT_GPTMP (CMD_TYPE,DECL_NO, DECL_G_NO, CLR_NO, CLR_G_NO) select CMD_TYPE,DECL_NO, DECL_G_NO, CLR_NO, CLR_G_NO from EGS_DEDUCT_INC_EXT;

delete from EGS_DEDUCT using EGS_DEDUCT_GPTMP where EGS_DEDUCT_GPTMP.DECL_NO=EGS_DEDUCT.DECL_NO AND EGS_DEDUCT_GPTMP.DECL_G_NO=EGS_DEDUCT.DECL_G_NO AND EGS_DEDUCT_GPTMP.CLR_NO=EGS_DEDUCT.CLR_NO AND EGS_DEDUCT_GPTMP.CLR_G_NO=EGS_DEDUCT.CLR_G_NO ;

insert into EGS_DEDUCT(DECL_NO,DECL_G_NO,CLR_NO,CLR_G_NO,CLR_QTY,CLR_MODE,CLR_DATE,CLR_ER,NOTES) select DECL_NO,DECL_G_NO,CLR_NO,CLR_G_NO,CLR_QTY,CLR_MODE,CLR_DATE,CLR_ER,NOTES from EGS_DEDUCT_INC_EXT where CMD_TYPE='I';

delete from EGS_DEDUCT_GPTMP;

\timing
