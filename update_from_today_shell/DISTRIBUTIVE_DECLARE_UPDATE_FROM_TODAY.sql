\echo -----------------------DISTRIBUTIVE_DECLARE------------------------
select now();
\timing
delete from DISTRIBUTIVE_DECLARE using DISTRIBUTIVE_DECLARE_GPTMP_TODAY where DISTRIBUTIVE_DECLARE.DISTRIBUTIVE_NO=DISTRIBUTIVE_DECLARE_GPTMP_TODAY.DISTRIBUTIVE_NO ;
insert into DISTRIBUTIVE_DECLARE (DISTRIBUTIVE_NO,FORM_FLAG,DECL_PORT,ORIGIN_CUS_CODE,ORIGIN_CUS_PLACE,DEST_CUS_CODE,DEST_CUS_PLACE,AGENT_CODE,AGENT_NAME,TRANSIT_CODE,TRANSIT_NAME,TRANSIT_WAY,NOTE,DISTRIBUTIVE_MARK,I_E_FLAG,DISTRIBUTIVE_SURER,SURE_DATE,OUT_SURER,IN_SURER,FORE_ARRIVE_DATE,DIS_FLAG,SEAL_FLAG,LIMIT_HOUR,DECL_DATE,IN_DATE,PRINT_NUM,SEQ_NO) select DISTRIBUTIVE_NO,FORM_FLAG,DECL_PORT,ORIGIN_CUS_CODE,ORIGIN_CUS_PLACE,DEST_CUS_CODE,DEST_CUS_PLACE,AGENT_CODE,AGENT_NAME,TRANSIT_CODE,TRANSIT_NAME,TRANSIT_WAY,NOTE,DISTRIBUTIVE_MARK,I_E_FLAG,DISTRIBUTIVE_SURER,SURE_DATE,OUT_SURER,IN_SURER,FORE_ARRIVE_DATE,DIS_FLAG,SEAL_FLAG,LIMIT_HOUR,DECL_DATE,IN_DATE,PRINT_NUM,SEQ_NO from DISTRIBUTIVE_DECLARE_GPTMP_TODAY  where CMD_TYPE='I';
\timing