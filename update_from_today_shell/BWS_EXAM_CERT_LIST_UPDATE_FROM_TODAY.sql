\echo -----------------------BWS_EXAM_CERT_LIST------------------------
select now();
\timing
delete from BWS_EXAM_CERT_LIST using BWS_EXAM_CERT_LIST_GPTMP_TODAY where BWS_EXAM_CERT_LIST.BWS_EXAM_NO=BWS_EXAM_CERT_LIST_GPTMP_TODAY.BWS_EXAM_NO AND BWS_EXAM_CERT_LIST.G_NO=BWS_EXAM_CERT_LIST_GPTMP_TODAY.G_NO ;
insert into BWS_EXAM_CERT_LIST (BWS_EXAM_NO,G_NO,CERT_NO,PACK_NO,GROSS_WT,BILL_NO) select BWS_EXAM_NO,G_NO,CERT_NO,PACK_NO,GROSS_WT,BILL_NO from BWS_EXAM_CERT_LIST_GPTMP_TODAY  where CMD_TYPE='I';
\timing
