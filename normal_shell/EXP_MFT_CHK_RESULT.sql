\echo ------------------EXP_MFT_CHK_RESULT----------------
select now();
\timing
insert into EXP_MFT_CHK_RESULT_GPTMP (CMD_TYPE,VOYAGE_NO, CUSTOMS_CODE) select CMD_TYPE,VOYAGE_NO, CUSTOMS_CODE from EXP_MFT_CHK_RESULT_INC_EXT;

delete from EXP_MFT_CHK_RESULT using EXP_MFT_CHK_RESULT_GPTMP where EXP_MFT_CHK_RESULT_GPTMP.VOYAGE_NO=EXP_MFT_CHK_RESULT.VOYAGE_NO AND EXP_MFT_CHK_RESULT_GPTMP.CUSTOMS_CODE=EXP_MFT_CHK_RESULT.CUSTOMS_CODE ;

insert into EXP_MFT_CHK_RESULT(VOYAGE_NO,CUSTOMS_CODE,CHK_MARK,CHK_DATE) select VOYAGE_NO,CUSTOMS_CODE,CHK_MARK,CHK_DATE from EXP_MFT_CHK_RESULT_INC_EXT where CMD_TYPE='I';

delete from EXP_MFT_CHK_RESULT_GPTMP;

\timing
