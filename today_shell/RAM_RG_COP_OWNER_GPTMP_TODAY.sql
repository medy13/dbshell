\echo ------------------RAM_RG_COP_OWNER----------------
select now();
\timing
delete from RAM_RG_COP_OWNER_GPTMP;
insert into RAM_RG_COP_OWNER_GPTMP (CMD_TYPE,RAM_ID, TYPE, COP_NO, OWNER_NO) select CMD_TYPE,RAM_ID, TYPE, COP_NO, OWNER_NO from RAM_RG_COP_OWNER_INC_EXT;
delete from RAM_RG_COP_OWNER_GPTMP_TODAY using RAM_RG_COP_OWNER_GPTMP where RAM_RG_COP_OWNER_GPTMP.RAM_ID=RAM_RG_COP_OWNER_GPTMP_TODAY.RAM_ID AND RAM_RG_COP_OWNER_GPTMP.TYPE=RAM_RG_COP_OWNER_GPTMP_TODAY.TYPE AND RAM_RG_COP_OWNER_GPTMP.COP_NO=RAM_RG_COP_OWNER_GPTMP_TODAY.COP_NO AND RAM_RG_COP_OWNER_GPTMP.OWNER_NO=RAM_RG_COP_OWNER_GPTMP_TODAY.OWNER_NO ;
insert into RAM_RG_COP_OWNER_GPTMP_TODAY (CMD_TYPE,RAM_ID,TYPE,COP_NO,OWNER_NO,OWNER_NAME,COUNTRY,INVEST_RATE) select CMD_TYPE,RAM_ID,TYPE,COP_NO,OWNER_NO,OWNER_NAME,COUNTRY,INVEST_RATE from RAM_RG_COP_OWNER_INC_EXT;
delete from RAM_RG_COP_OWNER_GPTMP;
\timing