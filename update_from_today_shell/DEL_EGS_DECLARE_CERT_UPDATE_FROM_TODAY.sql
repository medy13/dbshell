\echo -----------------------DEL_EGS_DECLARE_CERT------------------------
select now();
\timing
delete from DEL_EGS_DECLARE_CERT using DEL_EGS_DECLARE_CERT_GPTMP_TODAY where DEL_EGS_DECLARE_CERT.DECL_NO=DEL_EGS_DECLARE_CERT_GPTMP_TODAY.DECL_NO AND DEL_EGS_DECLARE_CERT.CERT_CODE=DEL_EGS_DECLARE_CERT_GPTMP_TODAY.CERT_CODE AND DEL_EGS_DECLARE_CERT.CERT_NO=DEL_EGS_DECLARE_CERT_GPTMP_TODAY.CERT_NO ;
insert into DEL_EGS_DECLARE_CERT (DECL_NO,CERT_CODE,CERT_NO) select DECL_NO,CERT_CODE,CERT_NO from DEL_EGS_DECLARE_CERT_GPTMP_TODAY  where CMD_TYPE='I';
\timing