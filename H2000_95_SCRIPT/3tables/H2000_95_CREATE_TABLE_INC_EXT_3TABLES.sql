\timing

select now(); 

\echo --------------STF_CORP_RECORD------------
drop external table IF EXISTS STF_CORP_RECORD_INC_EXT;

create external table STF_CORP_RECORD_INC_EXT
(
  CMD_TYPE    VARCHAR(1),
  ENTRY_ID       VARCHAR(18)  ,
  STF_CORP_ID    VARCHAR(32),
  MANUAL_CORP_NO VARCHAR(30),
  I_E_FLAG       VARCHAR(1),
  UNIT_CODE      VARCHAR(10),
  STF_CORP_DATE1 TIMESTAMP,
  STF_CORP_ER1   VARCHAR(16),
  STF_CORP_DATE2 TIMESTAMP,
  STF_CORP_ER2   VARCHAR(8),
  ROOM_CORP_NO   VARCHAR(64),
  NOTE_TEXT      VARCHAR(255)
)
LOCATION( 
'gpfdist://mdw-1:8081/STF_CORP_RECORD.txt',
'gpfdist://mdw-2:8081/STF_CORP_RECORD.txt',
'gpfdist://mdw-3:8081/STF_CORP_RECORD.txt',
'gpfdist://mdw-4:8081/STF_CORP_RECORD.txt')
Format  'CSV'
(
DELIMITER  '|'
NULL  ''
QUOTE  '"'
ESCAPE  '"'
)
ENCODING  'UTF8'
LOG errors into error_table segment reject limit 10000;


\echo --------------TB_PCS------------
drop external table IF EXISTS TB_PCS_INC_EXT;

create external table TB_PCS_INC_EXT
(
  CMD_TYPE    VARCHAR(1),
  SEQ_NO        NUMERIC(9),
  PCS_NO_S      VARCHAR(13)  ,
  TRADE_NAME    VARCHAR(255),
  TRADE_CO      VARCHAR(10),
  G_NAME        VARCHAR(255),
  G_MODEL       VARCHAR(255),
  G_NAME_ENG    VARCHAR(255),
  G_NAME_OTR    VARCHAR(255),
  PROT_NO       VARCHAR(20),
  STATUS        VARCHAR(1),
  G_DESCRIPTION VARCHAR(2000),
  CODE_TS       VARCHAR(16),
  NOTE          VARCHAR(2000),
  AGENT_IC_CODE VARCHAR(32),
  AGENT_IC_NAME VARCHAR(255),
  TRADE_IC_CODE VARCHAR(32),
  TRADE_IC_NAME VARCHAR(32),
  AGENT_NAME    VARCHAR(255),
  AGENT_CO      VARCHAR(32),
  AGENT_TEL     VARCHAR(20),
  INPUT_DATE    TIMESTAMP,
  CGAC_CO       VARCHAR(8),
  VALID_DATE    TIMESTAMP
)
LOCATION( 
'gpfdist://mdw-1:8081/TB_PCS.txt',
'gpfdist://mdw-2:8081/TB_PCS.txt',
'gpfdist://mdw-3:8081/TB_PCS.txt',
'gpfdist://mdw-4:8081/TB_PCS.txt')
Format  'CSV'
(
DELIMITER  '|'
NULL  ''
QUOTE  '"'
ESCAPE  '"'
)
ENCODING  'UTF8'
LOG errors into error_table segment reject limit 10000;


\echo --------------TB_PCS_HIS------------
drop external table IF EXISTS TB_PCS_HIS_INC_EXT;

create external table TB_PCS_HIS_INC_EXT
(
  CMD_TYPE    VARCHAR(1),
  SEQ_NO        NUMERIC(9),
  PCS_NO_S      VARCHAR(13)  ,
  TRADE_NAME    VARCHAR(255),
  TRADE_CO      VARCHAR(10),
  G_NAME        VARCHAR(255),
  G_MODEL       VARCHAR(255),
  G_NAME_ENG    VARCHAR(255),
  G_NAME_OTR    VARCHAR(255),
  PROT_NO       VARCHAR(20),
  STATUS        VARCHAR(1),
  G_DESCRIPTION VARCHAR(2000),
  CODE_TS       VARCHAR(16),
  NOTE          VARCHAR(2000),
  AGENT_IC_CODE VARCHAR(32),
  AGENT_IC_NAME VARCHAR(255),
  TRADE_IC_CODE VARCHAR(32),
  TRADE_IC_NAME VARCHAR(32),
  AGENT_NAME    VARCHAR(255),
  AGENT_CO      VARCHAR(32),
  AGENT_TEL     VARCHAR(20),
  INPUT_DATE    TIMESTAMP,
  CGAC_CO       VARCHAR(8),
  VALID_DATE    TIMESTAMP
)
LOCATION( 
'gpfdist://mdw-1:8081/TB_PCS_HIS.txt',
'gpfdist://mdw-2:8081/TB_PCS_HIS.txt',
'gpfdist://mdw-3:8081/TB_PCS_HIS.txt',
'gpfdist://mdw-4:8081/TB_PCS_HIS.txt')
Format  'CSV'
(
DELIMITER  '|'
NULL  ''
QUOTE  '"'
ESCAPE  '"'
)
ENCODING  'UTF8'
LOG errors into error_table segment reject limit 10000;




select now(); 

