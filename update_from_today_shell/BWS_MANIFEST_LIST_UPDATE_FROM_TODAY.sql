\echo -----------------------BWS_MANIFEST_LIST------------------------
select now();
\timing
delete from BWS_MANIFEST_LIST using BWS_MANIFEST_LIST_GPTMP_TODAY where BWS_MANIFEST_LIST.BWS_MANIFEST_NO=BWS_MANIFEST_LIST_GPTMP_TODAY.BWS_MANIFEST_NO AND BWS_MANIFEST_LIST.G_NO=BWS_MANIFEST_LIST_GPTMP_TODAY.G_NO ;
insert into BWS_MANIFEST_LIST (BWS_MANIFEST_NO,G_NO,BILL_NO,MAIN_G_NAME,PACK_NO,BILL_GROSS_WT,CONTA_ID,SEAL_NO) select BWS_MANIFEST_NO,G_NO,BILL_NO,MAIN_G_NAME,PACK_NO,BILL_GROSS_WT,CONTA_ID,SEAL_NO from BWS_MANIFEST_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing