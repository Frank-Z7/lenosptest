/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.1.0.7.0

Source Server         : LEN
Source Server Version : 110200
Source Host           : localhost:1521
Source Schema         : LEN

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2019-02-27 22:47:09
*/


-- ----------------------------
-- Table structure for ACT_ASSIGNEE
-- ----------------------------
DROP TABLE "LEN"."ACT_ASSIGNEE";
CREATE TABLE "LEN"."ACT_ASSIGNEE"
(
    "ID"            NVARCHAR2(32) NOT NULL,
    "SID"           NVARCHAR2(32) NOT NULL,
    "ASSIGNEE"      NVARCHAR2(64) NULL,
    "ROLE_ID"       NVARCHAR2(32) NULL,
    "ASSIGNEE_TYPE" NUMBER(11) NOT NULL,
    "ACTIVTI_NAME"  NVARCHAR2(128) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_ASSIGNEE
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE "LEN"."ACT_EVT_LOG";
CREATE TABLE "LEN"."ACT_EVT_LOG"
(
    "LOG_NR_"       NUMBER(19) NOT NULL,
    "TYPE_"         NVARCHAR2(64) NULL,
    "PROC_DEF_ID_"  NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "EXECUTION_ID_" NVARCHAR2(64) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "TIME_STAMP_"   TIMESTAMP(6) NOT NULL,
    "USER_ID_"      NVARCHAR2(255) NULL,
    "DATA_"         BLOB NULL,
    "LOCK_OWNER_"   NVARCHAR2(255) NULL,
    "LOCK_TIME_"    TIMESTAMP(6) NULL,
    "IS_PROCESSED_" NUMBER(3) DEFAULT 0 NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE "LEN"."ACT_GE_BYTEARRAY";
CREATE TABLE "LEN"."ACT_GE_BYTEARRAY"
(
    "ID_"            NVARCHAR2(64) NOT NULL,
    "REV_"           NUMBER NULL,
    "NAME_"          NVARCHAR2(255) NULL,
    "DEPLOYMENT_ID_" NVARCHAR2(64) NULL,
    "BYTES_"         BLOB NULL,
    "GENERATED_"     NUMBER(1) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_GE_BYTEARRAY
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE "LEN"."ACT_GE_PROPERTY";
CREATE TABLE "LEN"."ACT_GE_PROPERTY"
(
    "NAME_"  NVARCHAR2(64) NOT NULL,
    "VALUE_" NVARCHAR2(300) NULL,
    "REV_"   NUMBER NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
INSERT INTO "LEN"."ACT_GE_PROPERTY"
VALUES ('schema.version', '5.22.0.0', '1');
INSERT INTO "LEN"."ACT_GE_PROPERTY"
VALUES ('schema.history', 'create(5.22.0.0)', '1');
INSERT INTO "LEN"."ACT_GE_PROPERTY"
VALUES ('next.dbid', '1', '1');

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_ACTINST";
CREATE TABLE "LEN"."ACT_HI_ACTINST"
(
    "ID_"                NVARCHAR2(64) NOT NULL,
    "PROC_DEF_ID_"       NVARCHAR2(64) NOT NULL,
    "PROC_INST_ID_"      NVARCHAR2(64) NOT NULL,
    "EXECUTION_ID_"      NVARCHAR2(64) NOT NULL,
    "ACT_ID_"            NVARCHAR2(255) NOT NULL,
    "TASK_ID_"           NVARCHAR2(64) NULL,
    "CALL_PROC_INST_ID_" NVARCHAR2(64) NULL,
    "ACT_NAME_"          NVARCHAR2(255) NULL,
    "ACT_TYPE_"          NVARCHAR2(255) NOT NULL,
    "ASSIGNEE_"          NVARCHAR2(255) NULL,
    "START_TIME_"        TIMESTAMP(6) NOT NULL,
    "END_TIME_"          TIMESTAMP(6) NULL,
    "DURATION_"          NUMBER(19) NULL,
    "TENANT_ID_"         NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_ACTINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_ATTACHMENT";
CREATE TABLE "LEN"."ACT_HI_ATTACHMENT"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "REV_"          NUMBER NULL,
    "USER_ID_"      NVARCHAR2(255) NULL,
    "NAME_"         NVARCHAR2(255) NULL,
    "DESCRIPTION_"  NVARCHAR2(2000) NULL,
    "TYPE_"         NVARCHAR2(255) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "URL_"          NVARCHAR2(2000) NULL,
    "CONTENT_ID_"   NVARCHAR2(64) NULL,
    "TIME_"         TIMESTAMP(6) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_COMMENT";
CREATE TABLE "LEN"."ACT_HI_COMMENT"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "TYPE_"         NVARCHAR2(255) NULL,
    "TIME_"         TIMESTAMP(6) NOT NULL,
    "USER_ID_"      NVARCHAR2(255) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "ACTION_"       NVARCHAR2(255) NULL,
    "MESSAGE_"      NVARCHAR2(2000) NULL,
    "FULL_MSG_"     BLOB NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_DETAIL";
CREATE TABLE "LEN"."ACT_HI_DETAIL"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "TYPE_"         NVARCHAR2(255) NOT NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "EXECUTION_ID_" NVARCHAR2(64) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "ACT_INST_ID_"  NVARCHAR2(64) NULL,
    "NAME_"         NVARCHAR2(255) NOT NULL,
    "VAR_TYPE_"     NVARCHAR2(64) NULL,
    "REV_"          NUMBER NULL,
    "TIME_"         TIMESTAMP(6) NOT NULL,
    "BYTEARRAY_ID_" NVARCHAR2(64) NULL,
    "DOUBLE_"       NUMBER NULL,
    "LONG_"         NUMBER(19) NULL,
    "TEXT_"         NVARCHAR2(2000) NULL,
    "TEXT2_"        NVARCHAR2(2000) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_DETAIL
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_IDENTITYLINK";
CREATE TABLE "LEN"."ACT_HI_IDENTITYLINK"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "GROUP_ID_"     NVARCHAR2(255) NULL,
    "TYPE_"         NVARCHAR2(255) NULL,
    "USER_ID_"      NVARCHAR2(255) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_PROCINST";
CREATE TABLE "LEN"."ACT_HI_PROCINST"
(
    "ID_"                        NVARCHAR2(64) NOT NULL,
    "PROC_INST_ID_"              NVARCHAR2(64) NOT NULL,
    "BUSINESS_KEY_"              NVARCHAR2(255) NULL,
    "PROC_DEF_ID_"               NVARCHAR2(64) NOT NULL,
    "START_TIME_"                TIMESTAMP(6) NOT NULL,
    "END_TIME_"                  TIMESTAMP(6) NULL,
    "DURATION_"                  NUMBER(19) NULL,
    "START_USER_ID_"             NVARCHAR2(255) NULL,
    "START_ACT_ID_"              NVARCHAR2(255) NULL,
    "END_ACT_ID_"                NVARCHAR2(255) NULL,
    "SUPER_PROCESS_INSTANCE_ID_" NVARCHAR2(64) NULL,
    "DELETE_REASON_"             NVARCHAR2(2000) NULL,
    "TENANT_ID_"                 NVARCHAR2(255) DEFAULT '' NULL,
    "NAME_"                      NVARCHAR2(255) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_PROCINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_TASKINST";
CREATE TABLE "LEN"."ACT_HI_TASKINST"
(
    "ID_"             NVARCHAR2(64) NOT NULL,
    "PROC_DEF_ID_"    NVARCHAR2(64) NULL,
    "TASK_DEF_KEY_"   NVARCHAR2(255) NULL,
    "PROC_INST_ID_"   NVARCHAR2(64) NULL,
    "EXECUTION_ID_"   NVARCHAR2(64) NULL,
    "PARENT_TASK_ID_" NVARCHAR2(64) NULL,
    "NAME_"           NVARCHAR2(255) NULL,
    "DESCRIPTION_"    NVARCHAR2(2000) NULL,
    "OWNER_"          NVARCHAR2(255) NULL,
    "ASSIGNEE_"       NVARCHAR2(255) NULL,
    "START_TIME_"     TIMESTAMP(6) NOT NULL,
    "CLAIM_TIME_"     TIMESTAMP(6) NULL,
    "END_TIME_"       TIMESTAMP(6) NULL,
    "DURATION_"       NUMBER(19) NULL,
    "DELETE_REASON_"  NVARCHAR2(2000) NULL,
    "PRIORITY_"       NUMBER NULL,
    "DUE_DATE_"       TIMESTAMP(6) NULL,
    "FORM_KEY_"       NVARCHAR2(255) NULL,
    "CATEGORY_"       NVARCHAR2(255) NULL,
    "TENANT_ID_"      NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_TASKINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE "LEN"."ACT_HI_VARINST";
CREATE TABLE "LEN"."ACT_HI_VARINST"
(
    "ID_"                NVARCHAR2(64) NOT NULL,
    "PROC_INST_ID_"      NVARCHAR2(64) NULL,
    "EXECUTION_ID_"      NVARCHAR2(64) NULL,
    "TASK_ID_"           NVARCHAR2(64) NULL,
    "NAME_"              NVARCHAR2(255) NOT NULL,
    "VAR_TYPE_"          NVARCHAR2(100) NULL,
    "REV_"               NUMBER NULL,
    "BYTEARRAY_ID_"      NVARCHAR2(64) NULL,
    "DOUBLE_"            NUMBER NULL,
    "LONG_"              NUMBER(19) NULL,
    "TEXT_"              NVARCHAR2(2000) NULL,
    "TEXT2_"             NVARCHAR2(2000) NULL,
    "CREATE_TIME_"       TIMESTAMP(6) NULL,
    "LAST_UPDATED_TIME_" TIMESTAMP(6) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_HI_VARINST
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE "LEN"."ACT_ID_GROUP";
CREATE TABLE "LEN"."ACT_ID_GROUP"
(
    "ID_"   NVARCHAR2(64) NOT NULL,
    "REV_"  NUMBER NULL,
    "NAME_" NVARCHAR2(255) NULL,
    "TYPE_" NVARCHAR2(255) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE "LEN"."ACT_ID_INFO";
CREATE TABLE "LEN"."ACT_ID_INFO"
(
    "ID_"        NVARCHAR2(64) NOT NULL,
    "REV_"       NUMBER NULL,
    "USER_ID_"   NVARCHAR2(64) NULL,
    "TYPE_"      NVARCHAR2(64) NULL,
    "KEY_"       NVARCHAR2(255) NULL,
    "VALUE_"     NVARCHAR2(255) NULL,
    "PASSWORD_"  BLOB NULL,
    "PARENT_ID_" NVARCHAR2(255) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_ID_INFO
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE "LEN"."ACT_ID_MEMBERSHIP";
CREATE TABLE "LEN"."ACT_ID_MEMBERSHIP"
(
    "USER_ID_"  NVARCHAR2(64) NOT NULL,
    "GROUP_ID_" NVARCHAR2(64) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_ID_MEMBERSHIP
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE "LEN"."ACT_ID_USER";
CREATE TABLE "LEN"."ACT_ID_USER"
(
    "ID_"         NVARCHAR2(64) NOT NULL,
    "REV_"        NUMBER NULL,
    "FIRST_"      NVARCHAR2(255) NULL,
    "LAST_"       NVARCHAR2(255) NULL,
    "EMAIL_"      NVARCHAR2(255) NULL,
    "PWD_"        NVARCHAR2(255) NULL,
    "PICTURE_ID_" NVARCHAR2(64) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_ID_USER
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE "LEN"."ACT_PROCDEF_INFO";
CREATE TABLE "LEN"."ACT_PROCDEF_INFO"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "PROC_DEF_ID_"  NVARCHAR2(64) NOT NULL,
    "REV_"          NUMBER NULL,
    "INFO_JSON_ID_" NVARCHAR2(64) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_PROCDEF_INFO
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE "LEN"."ACT_RE_DEPLOYMENT";
CREATE TABLE "LEN"."ACT_RE_DEPLOYMENT"
(
    "ID_"          NVARCHAR2(64) NOT NULL,
    "NAME_"        NVARCHAR2(255) NULL,
    "CATEGORY_"    NVARCHAR2(255) NULL,
    "TENANT_ID_"   NVARCHAR2(255) DEFAULT '' NULL,
    "DEPLOY_TIME_" TIMESTAMP(6) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE "LEN"."ACT_RE_MODEL";
CREATE TABLE "LEN"."ACT_RE_MODEL"
(
    "ID_"                           NVARCHAR2(64) NOT NULL,
    "REV_"                          NUMBER NULL,
    "NAME_"                         NVARCHAR2(255) NULL,
    "KEY_"                          NVARCHAR2(255) NULL,
    "CATEGORY_"                     NVARCHAR2(255) NULL,
    "CREATE_TIME_"                  TIMESTAMP(6) NULL,
    "LAST_UPDATE_TIME_"             TIMESTAMP(6) NULL,
    "VERSION_"                      NUMBER NULL,
    "META_INFO_"                    NVARCHAR2(2000) NULL,
    "DEPLOYMENT_ID_"                NVARCHAR2(64) NULL,
    "EDITOR_SOURCE_VALUE_ID_"       NVARCHAR2(64) NULL,
    "EDITOR_SOURCE_EXTRA_VALUE_ID_" NVARCHAR2(64) NULL,
    "TENANT_ID_"                    NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RE_MODEL
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE "LEN"."ACT_RE_PROCDEF";
CREATE TABLE "LEN"."ACT_RE_PROCDEF"
(
    "ID_"                     NVARCHAR2(64) NOT NULL,
    "REV_"                    NUMBER NULL,
    "CATEGORY_"               NVARCHAR2(255) NULL,
    "NAME_"                   NVARCHAR2(255) NULL,
    "KEY_"                    NVARCHAR2(255) NOT NULL,
    "VERSION_"                NUMBER NOT NULL,
    "DEPLOYMENT_ID_"          NVARCHAR2(64) NULL,
    "RESOURCE_NAME_"          NVARCHAR2(2000) NULL,
    "DGRM_RESOURCE_NAME_"     VARCHAR2(4000 BYTE) NULL,
    "DESCRIPTION_"            NVARCHAR2(2000) NULL,
    "HAS_START_FORM_KEY_"     NUMBER(1) NULL,
    "HAS_GRAPHICAL_NOTATION_" NUMBER(1) NULL,
    "SUSPENSION_STATE_"       NUMBER NULL,
    "TENANT_ID_"              NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_EVENT_SUBSCR";
CREATE TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
(
    "ID_"            NVARCHAR2(64) NOT NULL,
    "REV_"           NUMBER NULL,
    "EVENT_TYPE_"    NVARCHAR2(255) NOT NULL,
    "EVENT_NAME_"    NVARCHAR2(255) NULL,
    "EXECUTION_ID_"  NVARCHAR2(64) NULL,
    "PROC_INST_ID_"  NVARCHAR2(64) NULL,
    "ACTIVITY_ID_"   NVARCHAR2(64) NULL,
    "CONFIGURATION_" NVARCHAR2(255) NULL,
    "CREATED_"       TIMESTAMP(6) NOT NULL,
    "PROC_DEF_ID_"   NVARCHAR2(64) NULL,
    "TENANT_ID_"     NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_EVENT_SUBSCR
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_EXECUTION";
CREATE TABLE "LEN"."ACT_RU_EXECUTION"
(
    "ID_"               NVARCHAR2(64) NOT NULL,
    "REV_"              NUMBER NULL,
    "PROC_INST_ID_"     NVARCHAR2(64) NULL,
    "BUSINESS_KEY_"     NVARCHAR2(255) NULL,
    "PARENT_ID_"        NVARCHAR2(64) NULL,
    "PROC_DEF_ID_"      NVARCHAR2(64) NULL,
    "SUPER_EXEC_"       NVARCHAR2(64) NULL,
    "ACT_ID_"           NVARCHAR2(255) NULL,
    "IS_ACTIVE_"        NUMBER(1) NULL,
    "IS_CONCURRENT_"    NUMBER(1) NULL,
    "IS_SCOPE_"         NUMBER(1) NULL,
    "IS_EVENT_SCOPE_"   NUMBER(1) NULL,
    "SUSPENSION_STATE_" NUMBER NULL,
    "CACHED_ENT_STATE_" NUMBER NULL,
    "TENANT_ID_"        NVARCHAR2(255) DEFAULT '' NULL,
    "NAME_"             NVARCHAR2(255) NULL,
    "LOCK_TIME_"        TIMESTAMP(6) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_EXECUTION
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_IDENTITYLINK";
CREATE TABLE "LEN"."ACT_RU_IDENTITYLINK"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "REV_"          NUMBER NULL,
    "GROUP_ID_"     NVARCHAR2(255) NULL,
    "TYPE_"         NVARCHAR2(255) NULL,
    "USER_ID_"      NVARCHAR2(255) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "PROC_DEF_ID_"  NVARCHAR2(64) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_IDENTITYLINK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_JOB";
CREATE TABLE "LEN"."ACT_RU_JOB"
(
    "ID_"                  NVARCHAR2(64) NOT NULL,
    "REV_"                 NUMBER NULL,
    "TYPE_"                NVARCHAR2(255) NOT NULL,
    "LOCK_EXP_TIME_"       TIMESTAMP(6) NULL,
    "LOCK_OWNER_"          NVARCHAR2(255) NULL,
    "EXCLUSIVE_"           NUMBER(1) NULL,
    "EXECUTION_ID_"        NVARCHAR2(64) NULL,
    "PROCESS_INSTANCE_ID_" NVARCHAR2(64) NULL,
    "PROC_DEF_ID_"         NVARCHAR2(64) NULL,
    "RETRIES_"             NUMBER NULL,
    "EXCEPTION_STACK_ID_"  NVARCHAR2(64) NULL,
    "EXCEPTION_MSG_"       NVARCHAR2(2000) NULL,
    "DUEDATE_"             TIMESTAMP(6) NULL,
    "REPEAT_"              NVARCHAR2(255) NULL,
    "HANDLER_TYPE_"        NVARCHAR2(255) NULL,
    "HANDLER_CFG_"         NVARCHAR2(2000) NULL,
    "TENANT_ID_"           NVARCHAR2(255) DEFAULT '' NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_JOB
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_TASK";
CREATE TABLE "LEN"."ACT_RU_TASK"
(
    "ID_"               NVARCHAR2(64) NOT NULL,
    "REV_"              NUMBER NULL,
    "EXECUTION_ID_"     NVARCHAR2(64) NULL,
    "PROC_INST_ID_"     NVARCHAR2(64) NULL,
    "PROC_DEF_ID_"      NVARCHAR2(64) NULL,
    "NAME_"             NVARCHAR2(255) NULL,
    "PARENT_TASK_ID_"   NVARCHAR2(64) NULL,
    "DESCRIPTION_"      NVARCHAR2(2000) NULL,
    "TASK_DEF_KEY_"     NVARCHAR2(255) NULL,
    "OWNER_"            NVARCHAR2(255) NULL,
    "ASSIGNEE_"         NVARCHAR2(255) NULL,
    "DELEGATION_"       NVARCHAR2(64) NULL,
    "PRIORITY_"         NUMBER NULL,
    "CREATE_TIME_"      TIMESTAMP(6) NULL,
    "DUE_DATE_"         TIMESTAMP(6) NULL,
    "CATEGORY_"         NVARCHAR2(255) NULL,
    "SUSPENSION_STATE_" NUMBER NULL,
    "TENANT_ID_"        NVARCHAR2(255) DEFAULT '' NULL,
    "FORM_KEY_"         NVARCHAR2(255) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_TASK
-- ----------------------------

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE "LEN"."ACT_RU_VARIABLE";
CREATE TABLE "LEN"."ACT_RU_VARIABLE"
(
    "ID_"           NVARCHAR2(64) NOT NULL,
    "REV_"          NUMBER NULL,
    "TYPE_"         NVARCHAR2(255) NOT NULL,
    "NAME_"         NVARCHAR2(255) NOT NULL,
    "EXECUTION_ID_" NVARCHAR2(64) NULL,
    "PROC_INST_ID_" NVARCHAR2(64) NULL,
    "TASK_ID_"      NVARCHAR2(64) NULL,
    "BYTEARRAY_ID_" NVARCHAR2(64) NULL,
    "DOUBLE_"       NUMBER NULL,
    "LONG_"         NUMBER(19) NULL,
    "TEXT_"         NVARCHAR2(2000) NULL,
    "TEXT2_"        NVARCHAR2(2000) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of ACT_RU_VARIABLE
-- ----------------------------

-- ----------------------------
-- Table structure for BLOG_ARTICLE
-- ----------------------------
DROP TABLE "LEN"."BLOG_ARTICLE";
CREATE TABLE "LEN"."BLOG_ARTICLE"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "CODE"        NVARCHAR2(255) NOT NULL,
    "TITLE"       NVARCHAR2(255) NOT NULL,
    "FIRST_IMG"   NVARCHAR2(255) NULL,
    "CONTENT"     NCLOB NOT NULL,
    "READ_NUMBER" NUMBER(11) NOT NULL,
    "TOP_NUM"     NUMBER(11) NULL,
    "CREATE_BY"   NVARCHAR2(32) NOT NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_DATE" DATE NULL,
    "DEL_FLAG"    NUMBER(4) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."CODE" IS 'code';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."TITLE" IS '标题';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."FIRST_IMG" IS '列表缩略图';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."CONTENT" IS '文章内容';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."READ_NUMBER" IS '阅读次数';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."TOP_NUM" IS '次序(置顶功能)';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE"."DEL_FLAG" IS '0正常1删除';

-- ----------------------------
-- Records of BLOG_ARTICLE
-- ----------------------------
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('3887934708c54f49bc5a566f77e2a759', '76249265', 'hello，world',
        'http://localhost:8081/img/77e5338a-217c-4b07-a3fd-63f20411dfcb.png', '<p>你好，世界</p><p class="ql-align-center">&lt;img src="http://localhost:8081/img/1b805822-4d00-4695-acdd-90f68af6150e.jpg"&gt;</p><p>
</p><p><br></p><p class="ql-align-center"><img src="http://localhost:8081/img/77e5338a-217c-4b07-a3fd-63f20411dfcb.png"></p><p class="ql-align-center"><img src="http://localhost:8081/img/d899b4da-8ceb-4a9b-bbc5-68b36146c9d6.png"></p><p>&lt;img src="http://localhost:8081/img/1b805822-4d00-4695-acdd-90f68af6150e.jpg"&gt;</p><p><img src="http://localhost:8081/img/9d45bdb0-9ac6-4853-b3d5-6ff9f3a21590.png"></p><p><img src="http://localhost:8081/img/369f4fab-b26a-4ab5-9c35-4ee203f19fa5.png"></p><p>
</p><pre class="ql-syntax" spellcheck="false">JsonUtil json = new JsonUtil();
List&lt;BlogCategory&gt; categories = categoryService.selectAll();
categories.sort(Comparator.comparing(BlogCategory::getSequence));
json.setData(categories);
return json;
</pre>', '16', '0', 'acfc0e9232f54732a5d9ffe9071bf572', 'a4a743bffe9711e7b472201a068c6482',
        TO_DATE('2018-10-14 17:47:41', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-11-25 17:35:00', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('3887934708c54f49bc5a566f77e2a759', '76249265', 'hello，world',
        'http://localhost:8081/img/77e5338a-217c-4b07-a3fd-63f20411dfcb.png', '<p>你好，世界</p><p class="ql-align-center">&lt;img src="http://localhost:8081/img/1b805822-4d00-4695-acdd-90f68af6150e.jpg"&gt;</p><p>
</p><p><br></p><p class="ql-align-center"><img src="http://localhost:8081/img/77e5338a-217c-4b07-a3fd-63f20411dfcb.png"></p><p class="ql-align-center"><img src="http://localhost:8081/img/d899b4da-8ceb-4a9b-bbc5-68b36146c9d6.png"></p><p>&lt;img src="http://localhost:8081/img/1b805822-4d00-4695-acdd-90f68af6150e.jpg"&gt;</p><p><img src="http://localhost:8081/img/9d45bdb0-9ac6-4853-b3d5-6ff9f3a21590.png"></p><p><img src="http://localhost:8081/img/369f4fab-b26a-4ab5-9c35-4ee203f19fa5.png"></p><p>
</p><pre class="ql-syntax" spellcheck="false">JsonUtil json = new JsonUtil();
List&lt;BlogCategory&gt; categories = categoryService.selectAll();
categories.sort(Comparator.comparing(BlogCategory::getSequence));
json.setData(categories);
return json;
</pre>', '16', '0', 'acfc0e9232f54732a5d9ffe9071bf572', 'a4a743bffe9711e7b472201a068c6482',
        TO_DATE('2018-10-14 17:47:41', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-11-25 17:35:00', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('6e3fbd29b226452984428883d6e7a8a2', '53165934', '测试添加',
        'http://localhost:8081/img/536ac5c8-ee9a-4826-9977-be8983622e00.png',
        '<p class="ql-align-center"><strong><em>内容啦啦啦啦啦</em></strong><img src="http://localhost:8081/img/536ac5c8-ee9a-4826-9977-be8983622e00.png"></p><p class="ql-align-center"><br></p>',
        '15', '0', 'acfc0e9232f54732a5d9ffe9071bf572', 'a4a743bffe9711e7b472201a068c6482',
        TO_DATE('2018-11-19 22:57:25', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-11-25 18:55:34', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('89f445cbe3334a458a4126741170d1e1', 'ASDFG2', 'java基础1', null, 'Java基础知识', '130', '1',
        'acfc0e9232f54732a5d9ffe9071bf572', null, TO_DATE('2018-10-01 11:24:59', 'YYYY-MM-DD HH24:MI:SS'), null, '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('89f445cbe3334a458a4126751170d1e1', 'ASDFG1', 'java基础2', null, 'Java基础知识', '127', '1',
        'acfc0e9232f54732a5d9ffe9071bf572', null, TO_DATE('2018-10-01 11:23:59', 'YYYY-MM-DD HH24:MI:SS'), null, '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('89f445cbe3334a458a412691170d1e12', 'xcbbg', 'java基础3', null, '<p>Java基础知识</p>', '124', '0',
        'acfc0e9232f54732a5d9ffe9071bf572', 'a4a743bffe9711e7b472201a068c6482',
        TO_DATE('2018-10-01 11:22:59', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-11-25 22:16:19', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."BLOG_ARTICLE"
VALUES ('89f445cbe3334a458a4126951170d1e1', 'ASDFGC', 'java基础4', null, 'Java基础知识', '124', '1',
        'acfc0e9232f54732a5d9ffe9071bf572', null, TO_DATE('2018-10-01 11:21:59', 'YYYY-MM-DD HH24:MI:SS'), null, '0');

-- ----------------------------
-- Table structure for BLOG_ARTICLE_CATEGORY
-- ----------------------------
DROP TABLE "LEN"."BLOG_ARTICLE_CATEGORY";
CREATE TABLE "LEN"."BLOG_ARTICLE_CATEGORY"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "ARTICLE_ID"  NVARCHAR2(32) NOT NULL,
    "CATEGORY_ID" NVARCHAR2(32) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON TABLE "LEN"."BLOG_ARTICLE_CATEGORY" IS '文章标签表';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE_CATEGORY"."ARTICLE_ID" IS '文章id';
COMMENT
ON COLUMN "LEN"."BLOG_ARTICLE_CATEGORY"."CATEGORY_ID" IS '标签id';

-- ----------------------------
-- Records of BLOG_ARTICLE_CATEGORY
-- ----------------------------
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('0037884871fa483db71e4158a18b0af9', '3887934708c54f49bc5a566f77e2a759', '3d4da698fc914ed0b956e86b58f93166');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('2e2c8578a05b4048a9365e9a1b5ff726', '89f445cbe3334a458a412691170d1e12', '3956852574b6490ba6198f35b1c00aee');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('68eeaf5f10a24ed195c042dbc6e25df7', 'a9455e9f36bc4f33ba01412a64d87d6a', '3956852574b6490ba6198f35b1c00aee');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('7659e8a4b97144269775983f886ce25e', '3887934708c54f49bc5a566f77e2a759', '3956852574b6490ba6198f35b1c00aee');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('db7a1ca9b5d04a618f98e65c6c5555db', '6e3fbd29b226452984428883d6e7a8a2', '3956852574b6490ba6198f35b1c00aee');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('e6c27fd837244cefb43b2b2aca276f1f', '3887934708c54f49bc5a566f77e2a759', '2b7c729789de4c03a23fff8311b9eaf4');
INSERT INTO "LEN"."BLOG_ARTICLE_CATEGORY"
VALUES ('fe7c34ffcf8c4af9922b4438e695c742', 'fd27b3ed7d344395b7766f596bf6fd06', '3956852574b6490ba6198f35b1c00aee');

-- ----------------------------
-- Table structure for BLOG_ARTICLE_TAG
-- ----------------------------
DROP TABLE "LEN"."BLOG_ARTICLE_TAG";
CREATE TABLE "LEN"."BLOG_ARTICLE_TAG"
(
    "ARTICLE_ID" NVARCHAR2(32) NOT NULL,
    "TAG_ID"     NVARCHAR2(32) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of BLOG_ARTICLE_TAG
-- ----------------------------
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('3887934708c54f49bc5a566f77e2a759', 'eeba8137d0cc42249a8c1db9b2830e8a');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('6e3fbd29b226452984428883d6e7a8a2', '0596836fc90540d1a497cd7bfae306e4');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('6e3fbd29b226452984428883d6e7a8a2', '1f44f472a64f4ebe9782b2b868e2caf2');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('89f445cbe3334a458a412691170d1e12', 'eeba8137d0cc42249a8c1db9b2830e8a');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('a9455e9f36bc4f33ba01412a64d87d6a', 'eba6d766a88b4a108d4189c08f86e7a6');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('fd27b3ed7d344395b7766f596bf6fd06', '0596836fc90540d1a497cd7bfae306e4');
INSERT INTO "LEN"."BLOG_ARTICLE_TAG"
VALUES ('fd27b3ed7d344395b7766f596bf6fd06', 'eba6d766a88b4a108d4189c08f86e7a6');

-- ----------------------------
-- Table structure for BLOG_CATEGORY
-- ----------------------------
DROP TABLE "LEN"."BLOG_CATEGORY";
CREATE TABLE "LEN"."BLOG_CATEGORY"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "SEQUENCE"    NUMBER(4) NOT NULL,
    "CODE"        NVARCHAR2(16) NOT NULL,
    "NAME"        NVARCHAR2(64) NOT NULL,
    "PARENT_ID"   NVARCHAR2(32) NOT NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_DATE" DATE NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON TABLE "LEN"."BLOG_CATEGORY" IS '类别表(顶部展示)';
COMMENT
ON COLUMN "LEN"."BLOG_CATEGORY"."CODE" IS '搜索code';
COMMENT
ON COLUMN "LEN"."BLOG_CATEGORY"."NAME" IS '类别名称';
COMMENT
ON COLUMN "LEN"."BLOG_CATEGORY"."PARENT_ID" IS '上层id(目前最多两次层)';

-- ----------------------------
-- Records of BLOG_CATEGORY
-- ----------------------------
INSERT INTO "LEN"."BLOG_CATEGORY"
VALUES ('2b7c729789de4c03a23fff8311b9eaf4', '3', '架构', '架构', '0', 'zxm', null,
        TO_DATE('2018-10-12 22:30:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO "LEN"."BLOG_CATEGORY"
VALUES ('3956852574b6490ba6198f35b1c00aee', '1', 'Java', 'Java', '0', 'zxm', null,
        TO_DATE('2018-10-12 22:30:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO "LEN"."BLOG_CATEGORY"
VALUES ('3d4da698fc914ed0b956e86b58f93166', '2', 'Linux', 'Linux', '0', 'zxm', null,
        TO_DATE('2018-10-12 22:30:18', 'YYYY-MM-DD HH24:MI:SS'), null);
INSERT INTO "LEN"."BLOG_CATEGORY"
VALUES ('7de23cc796ac4e6887ef1de6ca331bd8', '4', '其他', '其他', '0', 'zxm', null,
        TO_DATE('2018-10-12 22:30:18', 'YYYY-MM-DD HH24:MI:SS'), null);

-- ----------------------------
-- Table structure for BLOG_TAG
-- ----------------------------
DROP TABLE "LEN"."BLOG_TAG";
CREATE TABLE "LEN"."BLOG_TAG"
(
    "ID"       NVARCHAR2(32) NOT NULL,
    "TAG_CODE" NVARCHAR2(16) NOT NULL,
    "TAG_NAME" NVARCHAR2(255) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON COLUMN "LEN"."BLOG_TAG"."TAG_CODE" IS '标签code';
COMMENT
ON COLUMN "LEN"."BLOG_TAG"."TAG_NAME" IS '标签name';

-- ----------------------------
-- Records of BLOG_TAG
-- ----------------------------
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('0596836fc90540d1a497cd7bfae306e4', 'shiro', 'shiro');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('1f44f472a64f4ebe9782b2b868e2caf2', 'spring', 'spring');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('32297dbf97d44462bfa8b2f868704660', 'mybatis', 'mybatis');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('483af3b2db5743e99a9cde0f81559b43', 'spring cloud', 'spring cloud');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('4e4aa6cd7fea4a70a9e31083c1109090', 'sql', 'sql');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('56a9dc14db164453a0baa30d3193367c', '22', '22');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('75cae88b2f9f451392bfc06928a7c58d', 'centos7', 'centos7');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('7b470a9a121b42dc995e876fb532660e', 'linux', 'linux');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('7e467f2922a34a0b91afd908676f0ef5', 'spring security', 'spring security');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('8f41425ce8794fa8a0affa17beb13f11', 'redis', 'redis');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('d4e6b7774db343ff8575b1790a615aa2', 'git', 'git');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('da34c84e702341d68e6ea6d004508e67', 'vue', 'vue');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('e4ca0a14f2724de8bf71ad0ac8988c57', 'quartz', 'quartz');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('eba6d766a88b4a108d4189c08f86e7a6', 'spring boot', 'spring boot');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('eeba8137d0cc42249a8c1db9b2830e8a', 'java', 'java');
INSERT INTO "LEN"."BLOG_TAG"
VALUES ('f4ebc211eb3242739d6007e030c54ae5', 'oauth2.0', 'oauth2.0');

-- ----------------------------
-- Table structure for SYS_DICT_ITEM
-- ----------------------------
DROP TABLE "LEN"."SYS_DICT_ITEM";
CREATE TABLE "LEN"."SYS_DICT_ITEM"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "SEQUENCE"    NUMBER(11) NOT NULL,
    "VALUE"       NVARCHAR2(100) NOT NULL,
    "DESCRIPTION" NVARCHAR2(100) NOT NULL,
    "TYPE_ID"     NVARCHAR2(32) NOT NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_DATE" DATE NULL,
    "DEL_FLAG"    NCHAR(1) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON TABLE "LEN"."SYS_DICT_ITEM" IS '字典子表';
COMMENT
ON COLUMN "LEN"."SYS_DICT_ITEM"."SEQUENCE" IS '序号';
COMMENT
ON COLUMN "LEN"."SYS_DICT_ITEM"."VALUE" IS '值';
COMMENT
ON COLUMN "LEN"."SYS_DICT_ITEM"."DESCRIPTION" IS '描述';
COMMENT
ON COLUMN "LEN"."SYS_DICT_ITEM"."TYPE_ID" IS '字典id外检';
COMMENT
ON COLUMN "LEN"."SYS_DICT_ITEM"."DEL_FLAG" IS '删除标识';

-- ----------------------------
-- Records of SYS_DICT_ITEM
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_DICT_TYPE
-- ----------------------------
DROP TABLE "LEN"."SYS_DICT_TYPE";
CREATE TABLE "LEN"."SYS_DICT_TYPE"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "CODE"        NVARCHAR2(255) NOT NULL,
    "DEL_FLAG"    NCHAR(1) NOT NULL,
    "TEXT"        NVARCHAR2(255) NOT NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_DATE" DATE NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON TABLE "LEN"."SYS_DICT_TYPE" IS '字典主表';
COMMENT
ON COLUMN "LEN"."SYS_DICT_TYPE"."CODE" IS '编码';
COMMENT
ON COLUMN "LEN"."SYS_DICT_TYPE"."DEL_FLAG" IS '删除标识';
COMMENT
ON COLUMN "LEN"."SYS_DICT_TYPE"."TEXT" IS '字典名称';

-- ----------------------------
-- Records of SYS_DICT_TYPE
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_JOB
-- ----------------------------
DROP TABLE "LEN"."SYS_JOB";
CREATE TABLE "LEN"."SYS_JOB"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "JOB_NAME"    NVARCHAR2(255) NOT NULL,
    "CRON"        NVARCHAR2(255) NOT NULL,
    "STATUS"      NUMBER(4) NOT NULL,
    "CLAZZ_PATH"  NVARCHAR2(255) NOT NULL,
    "JOB_DESC"    NVARCHAR2(255) NULL,
    "CREATE_BY"   NVARCHAR2(255) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_BY"   NVARCHAR2(255) NULL,
    "UPDATE_DATE" DATE NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON COLUMN "LEN"."SYS_JOB"."JOB_NAME" IS '描述任务';
COMMENT
ON COLUMN "LEN"."SYS_JOB"."CRON" IS '任务表达式';
COMMENT
ON COLUMN "LEN"."SYS_JOB"."STATUS" IS '状态:0未启动false/1启动true';
COMMENT
ON COLUMN "LEN"."SYS_JOB"."CLAZZ_PATH" IS '任务执行方法';
COMMENT
ON COLUMN "LEN"."SYS_JOB"."JOB_DESC" IS '其他描述';

-- ----------------------------
-- Records of SYS_JOB
-- ----------------------------
INSERT INTO "LEN"."SYS_JOB"
VALUES ('55147ebdf2f611e7a4fe201a068c6482', '测试定时demo1', '0/5 * * * * ?', '0',
        'com.len.core.quartz.CustomQuartz.JobDemo1', '测试定时demo1', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-07 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-07-14 13:29:55', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LEN"."SYS_JOB"
VALUES ('ab648a22f38d11e7aca0201a068c6482', '任务demo2', '0 0/1 * * * ?', '0',
        'com.len.core.quartz.CustomQuartz.JobDemo2', '任务demo2', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-07 17:32:36', 'YYYY-MM-DD HH24:MI:SS'), 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-07-07 17:07:45', 'YYYY-MM-DD HH24:MI:SS'));

-- ----------------------------
-- Table structure for SYS_LOG
-- ----------------------------
DROP TABLE "LEN"."SYS_LOG";
CREATE TABLE "LEN"."SYS_LOG"
(
    "ID"          NUMBER(11) NOT NULL,
    "USER_NAME"   NVARCHAR2(32) NULL,
    "IP"          NVARCHAR2(255) NULL,
    "TYPE"        NVARCHAR2(255) NULL,
    "TEXT"        NVARCHAR2(255) NULL,
    "PARAM"       NCLOB NULL,
    "CREATE_TIME" DATE NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of SYS_LOG
-- ----------------------------

-- ----------------------------
-- Table structure for SYS_MENU
-- ----------------------------
DROP TABLE "LEN"."SYS_MENU";
CREATE TABLE "LEN"."SYS_MENU"
(
    "ID"          NVARCHAR2(36) NOT NULL,
    "NAME"        NVARCHAR2(255) NOT NULL,
    "P_ID"        NVARCHAR2(36) NULL,
    "URL"         NVARCHAR2(255) NULL,
    "ORDER_NUM"   NUMBER(11) NULL,
    "ICON"        NVARCHAR2(255) NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_DATE" DATE NULL,
    "PERMISSION"  NVARCHAR2(255) NULL,
    "MENU_TYPE"   NUMBER(4) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON COLUMN "LEN"."SYS_MENU"."ORDER_NUM" IS '排序字段';
COMMENT
ON COLUMN "LEN"."SYS_MENU"."ICON" IS '图标';
COMMENT
ON COLUMN "LEN"."SYS_MENU"."PERMISSION" IS '权限';
COMMENT
ON COLUMN "LEN"."SYS_MENU"."MENU_TYPE" IS '1栏目2菜单';

-- ----------------------------
-- Records of SYS_MENU
-- ----------------------------
INSERT INTO "LEN"."SYS_MENU"
VALUES ('0e6c8d4cf09511e78a57201a068c6482', '删除', 'cff61424dfb311e7b555201a068c6482', null, '3', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:47:44', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'role:del', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('18bf8d5df09511e78a57201a068c6482', '新增', '3873ccc2dfda11e7b555201a068c6482', null, '1', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:48:01', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'nemu:add', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('28661300f9d411e7a009201a068c6482', '流程管理', 'e06da471f90311e780aa201a068c6482', '/act/goAct', '2',
        '&#xe630;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-15 17:12:06', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, 'act:deployment', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('2b56410cf09411e78a57201a068c6482', '新增', 'cff61424dfb311e7b555201a068c6482', null, '1', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:41:23', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'role:add', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('3873ccc2dfda11e7b555201a068c6482', '菜单管理', 'cfda8029dfb311e7b555201a068c6482', 'menu/showMenu', '1', '',
        null, TO_DATE('2017-12-14 14:02:50', 'YYYY-MM-DD HH24:MI:SS'), 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-04-23 19:43:54', 'YYYY-MM-DD HH24:MI:SS'), 'menu:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('433089a6eb0111e782d5201a068c6482', '编辑', 'cfe54921dfb311e7b555201a068c6482', null, null, '1',
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2017-12-27 20:27:11', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'user:update', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('4d603831fe9b11e7b472201a068c6482', '待办任务', 'e06da471f90311e780aa201a068c6482', '/leave/showTask', '5',
        '&#xe6af;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-21 19:07:43', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, 'task:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('5ae3d4e9f38e11e7aca0201a068c6482', '新增', 'e9a13e55f35911e7aca0201a068c6482', null, '1', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 17:37:30', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:add', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('6315968bf37111e7aca0201a068c6482', '停止', 'e9a13e55f35911e7aca0201a068c6482', null, '4', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 14:10:09', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:end', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('63da4415fc6211e7a781201a068c6482', '模型列表', 'e06da471f90311e780aa201a068c6482', '/act/goActModel', '3',
        '&#xe60a;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-18 23:15:17', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, 'act', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('6931fd22f09611e78a57201a068c6482', '删除', 'b441914cee0811e7a60d201a068c6482', null, '1', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:57:26', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'control:del', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('69f3f59cf38e11e7aca0201a068c6482', '编辑', 'e9a13e55f35911e7aca0201a068c6482', null, '2', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 17:37:56', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:update', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('6dc13c6eec5f11e7a472201a068c6482', '系统日志', 'a1ca6642ec5e11e7a472201a068c6482', 'log/showLog', '1',
        '&#xe60a;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2017-12-29 14:43:46', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2017-12-29 14:43:46', 'YYYY-MM-DD HH24:MI:SS'), 'log:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('788d8e34f38e11e7aca0201a068c6482', '删除', 'e9a13e55f35911e7aca0201a068c6482', null, '5', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 17:38:20', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:del', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('7967e098ee0611e7a60d201a068c6482', '接口api', 'a1ca6642ec5e11e7a472201a068c6482', 'swagger-ui.html', '2',
        '&#xe64e;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2017-12-31 16:42:04', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, null, '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('873f30b0f38e11e7aca0201a068c6482', '查看', 'e9a13e55f35911e7aca0201a068c6482', null, '6', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 17:38:45', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:select', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('88b8e5d1f38911e7aca0201a068c6482', '查看', 'cff61424dfb311e7b555201a068c6482', null, '4', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 17:03:00', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'role:select', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('8a6c8bfa7f804eac810c5790cad9a62a', '删除', '3873ccc2dfda11e7b555201a068c6482', null, '2', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-06-20 21:55:55', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'menu:del', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('a1ca6642ec5e11e7a472201a068c6482', '系统监控', null, null, '2', '&#xe62c;', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-03 10:56:14', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2018-01-03 10:56:14', 'YYYY-MM-DD HH24:MI:SS'), null, '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('b441914cee0811e7a60d201a068c6482', '系统监控', 'a1ca6642ec5e11e7a472201a068c6482', 'druid/index.html', '3',
        '&#xe628;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2017-12-31 16:58:01', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, null, '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('b7839f59fe8811e7b472201a068c6482', '请假流程', 'e06da471f90311e780aa201a068c6482', '/leave/showLeave', '4',
        '&#xe650;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-21 16:54:40', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, 'leave:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('cfda8029dfb311e7b555201a068c6482', '系统管理', null, null, '1', '&#xe614;', null,
        TO_DATE('2018-01-03 10:56:13', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2018-01-03 10:56:13', 'YYYY-MM-DD HH24:MI:SS'), null, '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('cfe54921dfb311e7b555201a068c6482', '用户管理', 'cfda8029dfb311e7b555201a068c6482', '/user/showUser', '2',
        '&#xe6af;', null, TO_DATE('2017-12-29 14:40:34', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2017-12-29 14:40:34', 'YYYY-MM-DD HH24:MI:SS'), 'user:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('cfe54921dfb311e7b555201a068c6483', '增加', 'cfe54921dfb311e7b555201a068c6482', null, '1', null, null, null,
        null, null, 'user:select', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('cff61424dfb311e7b555201a068c6482', '角色管理', 'cfda8029dfb311e7b555201a068c6482', '/role/showRole', '3',
        '&#xe613;', null, TO_DATE('2017-12-29 14:40:36', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2017-12-29 14:40:36', 'YYYY-MM-DD HH24:MI:SS'), 'role:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('e06da471f90311e780aa201a068c6482', '工作流程管理', null, null, '3', '&#xe628;',
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-14 16:21:10', 'YYYY-MM-DD HH24:MI:SS'), null, null, null,
        '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('e3b11497eb9e11e7928d201a068c6482', '删除', 'cfe54921dfb311e7b555201a068c6482', null, null, null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2017-12-28 15:17:07', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2017-12-28 15:17:07', 'YYYY-MM-DD HH24:MI:SS'), 'user:del', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('e9a13e55f35911e7aca0201a068c6482', '定时任务', 'a1ca6642ec5e11e7a472201a068c6482', '/job/showJob', '3',
        '&#xe756;', 'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 11:22:06', 'YYYY-MM-DD HH24:MI:SS'), null,
        null, 'job:show', '0');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('ecda560cf36f11e7aca0201a068c6482', '启动', 'e9a13e55f35911e7aca0201a068c6482', null, '3', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-07 13:59:41', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'job:start', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('f23f6a6bf09511e78a57201a068c6482', '修改密码', 'cfe54921dfb311e7b555201a068c6482', null, '4', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:54:06', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'user:repass', '1');
INSERT INTO "LEN"."SYS_MENU"
VALUES ('ff015ea5f09411e78a57201a068c6482', '编辑', 'cff61424dfb311e7b555201a068c6482', null, '2', null,
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-03 22:47:18', 'YYYY-MM-DD HH24:MI:SS'), null, null,
        'role:update', '1');

-- ----------------------------
-- Table structure for SYS_ROLE
-- ----------------------------
DROP TABLE "LEN"."SYS_ROLE";
CREATE TABLE "LEN"."SYS_ROLE"
(
    "ID"          NVARCHAR2(32) NOT NULL,
    "ROLE_NAME"   NVARCHAR2(128) NULL,
    "REMARK"      NVARCHAR2(255) NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_DATE" DATE NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of SYS_ROLE
-- ----------------------------
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'hr', '人事', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-04-21 23:02:16', 'YYYY-MM-DD HH24:MI:SS'), null, null);
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'manage', '经理', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2017-12-20 15:04:44', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2018-01-02 11:41:43', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('2619a672e53811e7b983201a068c6482', 'admin', '管理员', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2017-12-20 11:44:57', 'YYYY-MM-DD HH24:MI:SS'), null,
        TO_DATE('2018-01-02 11:38:37', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('4bb891d8caf84cc6ba27e515e80ac40d', 'blogAdmin', '博客管理员', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-10-01 10:21:10', 'YYYY-MM-DD HH24:MI:SS'), null, null);
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'dev', '开发', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-21 18:35:56', 'YYYY-MM-DD HH24:MI:SS'), null, null);
INSERT INTO "LEN"."SYS_ROLE"
VALUES ('e346e96368484c8fa7f217ce550a0186', 'DeputyManager', '副经理', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-06-14 23:21:36', 'YYYY-MM-DD HH24:MI:SS'), null, null);

-- ----------------------------
-- Table structure for SYS_ROLE_MENU
-- ----------------------------
DROP TABLE "LEN"."SYS_ROLE_MENU";
CREATE TABLE "LEN"."SYS_ROLE_MENU"
(
    "ROLE_ID" NVARCHAR2(32) NOT NULL,
    "MENU_ID" NVARCHAR2(32) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of SYS_ROLE_MENU
-- ----------------------------
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', '433089a6eb0111e782d5201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', '4d603831fe9b11e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'b7839f59fe8811e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'cfda8029dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'cfe54921dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'cfe54921dfb311e7b555201a068c6483');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'e06da471f90311e780aa201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'e3b11497eb9e11e7928d201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('023366f3457511e8bcf1309c2315f9aa', 'f23f6a6bf09511e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', '433089a6eb0111e782d5201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', '4d603831fe9b11e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', '6931fd22f09611e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', '6dc13c6eec5f11e7a472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'a1ca6642ec5e11e7a472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'b7839f59fe8811e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'cfda8029dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'cfe54921dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('0ea934e5e55411e7b983201a068c6482', 'e06da471f90311e780aa201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '0e6c8d4cf09511e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '18bf8d5df09511e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '28661300f9d411e7a009201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '2b56410cf09411e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '3873ccc2dfda11e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '433089a6eb0111e782d5201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '4d603831fe9b11e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '5ae3d4e9f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '6315968bf37111e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '63da4415fc6211e7a781201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '6931fd22f09611e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '69f3f59cf38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '6dc13c6eec5f11e7a472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '788d8e34f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '7967e098ee0611e7a60d201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '873f30b0f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', '88b8e5d1f38911e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'a1ca6642ec5e11e7a472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'b441914cee0811e7a60d201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'b7839f59fe8811e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'cfda8029dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'cfe54921dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'cfe54921dfb311e7b555201a068c6483');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'cff61424dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'e06da471f90311e780aa201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'e3b11497eb9e11e7928d201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'e9a13e55f35911e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'ecda560cf36f11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'f23f6a6bf09511e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('2619a672e53811e7b983201a068c6482', 'ff015ea5f09411e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('35f7934d335e4641b7887e4b3b1885a5', '18bf8d5df09511e78a57201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('35f7934d335e4641b7887e4b3b1885a5', '3873ccc2dfda11e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('35f7934d335e4641b7887e4b3b1885a5', 'cfda8029dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('a56219ffeb7d11e7928d201a068c6482', '433089a6eb0111e782d5201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('a56219ffeb7d11e7928d201a068c6482', 'cfda8029dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('a56219ffeb7d11e7928d201a068c6482', 'cfe54921dfb311e7b555201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '4d603831fe9b11e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '5ae3d4e9f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '6315968bf37111e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '69f3f59cf38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '788d8e34f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', '873f30b0f38e11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'a1ca6642ec5e11e7a472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'b7839f59fe8811e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'e06da471f90311e780aa201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'e9a13e55f35911e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('dcb0f642fe9611e7b472201a068c6482', 'ecda560cf36f11e7aca0201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('e346e96368484c8fa7f217ce550a0186', '4d603831fe9b11e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('e346e96368484c8fa7f217ce550a0186', 'b7839f59fe8811e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_MENU"
VALUES ('e346e96368484c8fa7f217ce550a0186', 'e06da471f90311e780aa201a068c6482');

-- ----------------------------
-- Table structure for SYS_ROLE_USER
-- ----------------------------
DROP TABLE "LEN"."SYS_ROLE_USER";
CREATE TABLE "LEN"."SYS_ROLE_USER"
(
    "USER_ID" NVARCHAR2(32) NOT NULL,
    "ROLE_ID" NVARCHAR2(32) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of SYS_ROLE_USER
-- ----------------------------
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('1ec421975ffe45229b48d4b9d712ff4f', 'dcb0f642fe9611e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('2211fec3e17c11e795ed201a068c6482', '0ea934e5e55411e7b983201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('3c14c2f8316741e9aaeb29d78d03e958', 'dcb0f642fe9611e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('a4a743bffe9711e7b472201a068c6482', '4bb891d8caf84cc6ba27e515e80ac40d');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('a4a743bffe9711e7b472201a068c6482', 'dcb0f642fe9611e7b472201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('acfc0e9232f54732a5d9ffe9071bf572', '2619a672e53811e7b983201a068c6482');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('acfc0e9232f54732a5d9ffe9071bf572', '4bb891d8caf84cc6ba27e515e80ac40d');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('d555ffd6b51f4df7a18e2ef4eece1bed', 'e346e96368484c8fa7f217ce550a0186');
INSERT INTO "LEN"."SYS_ROLE_USER"
VALUES ('fb483b76457811e8bcf1309c2315f9aa', '023366f3457511e8bcf1309c2315f9aa');

-- ----------------------------
-- Table structure for SYS_USER
-- ----------------------------
DROP TABLE "LEN"."SYS_USER";
CREATE TABLE "LEN"."SYS_USER"
(
    "ID"          NVARCHAR2(36) NOT NULL,
    "USERNAME"    NVARCHAR2(64) NOT NULL,
    "PASSWORD"    NVARCHAR2(128) NOT NULL,
    "AGE"         NUMBER(11) NULL,
    "EMAIL"       NVARCHAR2(128) NULL,
    "PHOTO"       NVARCHAR2(255) NULL,
    "REAL_NAME"   NVARCHAR2(18) NULL,
    "CREATE_BY"   NVARCHAR2(32) NULL,
    "UPDATE_BY"   NVARCHAR2(32) NULL,
    "CREATE_DATE" DATE NULL,
    "UPDATE_DATE" DATE NULL,
    "DEL_FLAG"    NUMBER(4) NOT NULL
) LOGGING
NOCOMPRESS
NOCACHE
;
COMMENT
ON COLUMN "LEN"."SYS_USER"."DEL_FLAG" IS '0可用1封禁';

-- ----------------------------
-- Records of SYS_USER
-- ----------------------------
INSERT INTO "LEN"."SYS_USER"
VALUES ('1ec421975ffe45229b48d4b9d712ff4f', '33333', '533add1dc96c02469d50ca0ffdcb493a', '26', null, null, '33',
        'acfc0e9232f54732a5d9ffe9071bf572', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-08-20 23:52:47', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-12-11 22:57:16', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('2211fec3e17c11e795ed201a068c6482', 'tom', '11ac200620f90acd1fdae53716fd3de2', '41', 'lenospmiller@gmail.com',
        'bd214483-7c5e-49d6-862d-de97e9de50b5.jpeg', 'Tom Curise', null, 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-03 15:49:48', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-06-19 21:15:49', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('2bf2d2db774247b99f27efb1dda29c34', '12', '123456', '10', '2345', null, '123', null, null, null, null, '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('3c14c2f8316741e9aaeb29d78d03e958', '22222', '2b8aae82f069cc838dfe8afc945f8045', '222', null, null, '222',
        'acfc0e9232f54732a5d9ffe9071bf572', null, TO_DATE('2018-08-19 22:00:27', 'YYYY-MM-DD HH24:MI:SS'), null, '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('a4a743bffe9711e7b472201a068c6482', 'zxm', 'f8880ebbdbc37a936245657fa9084198', '25', '1544040976@qq.com',
        '662d5a3b-56aa-4bbb-bd47-194e24db1d60.jpeg', 'zxm', 'acfc0e9232f54732a5d9ffe9071bf572',
        'acfc0e9232f54732a5d9ffe9071bf572', TO_DATE('2018-01-21 18:41:32', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-17 15:09:41', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('acfc0e9232f54732a5d9ffe9071bf572', 'admin', 'e0b141de1c8091be350d3fc80de66528', '24', null,
        '2d4c37c3-c106-4288-9c0d-e7fe1b8adc72.jpeg', '管理员', null, 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2017-12-20 16:34:06', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-10-01 10:21:19', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('b50d049022124b04b73605caae5ecb3b', '12', '123456', '10', '2345', null, '123', null, null, null, null, '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('c7f1a7d7018311e8a1a2201a068c6482', '666', 'c6953f608430df414ea52e8c01b81a45', '24', null, null, '666',
        'acfc0e9232f54732a5d9ffe9071bf572', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-01-25 11:56:54', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-06-14 23:18:51', 'YYYY-MM-DD HH24:MI:SS'), '1');
INSERT INTO "LEN"."SYS_USER"
VALUES ('d555ffd6b51f4df7a18e2ef4eece1bed', 'wangwu', 'b162011c014942eac61c478a7bfc386d', '25', null, null, '王五',
        'acfc0e9232f54732a5d9ffe9071bf572', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-06-14 23:21:17', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-06-19 23:09:12', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('fb483b76457811e8bcf1309c2315f9aa', 'lisi', 'f497935e5f47325399d595ef31b25e47', '20', null, null, '李四',
        'acfc0e9232f54732a5d9ffe9071bf572', 'acfc0e9232f54732a5d9ffe9071bf572',
        TO_DATE('2018-04-21 23:30:43', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-06-14 23:21:50', 'YYYY-MM-DD HH24:MI:SS'), '0');
INSERT INTO "LEN"."SYS_USER"
VALUES ('fbb427b4e2764260a337f074744bc55a', '12', '123456', '10', '2345', null, '123', null, null, null, null, '0');

-- ----------------------------
-- Table structure for USER_LEAVE
-- ----------------------------
DROP TABLE "LEN"."USER_LEAVE";
CREATE TABLE "LEN"."USER_LEAVE"
(
    "ID"                  NVARCHAR2(32) NOT NULL,
    "USER_ID"             NVARCHAR2(32) NOT NULL,
    "USER_NAME"           NVARCHAR2(18) NULL,
    "BEGIN_TIME"          DATE NULL,
    "END_TIME"            DATE NULL,
    "REASON"              NVARCHAR2(255) NULL,
    "DAYS"                NUMBER(11) NULL,
    "PROCESS_INSTANCE_ID" NVARCHAR2(32) NULL,
    "STATUS"              NVARCHAR2(64) NULL,
    "CREATE_DATE"         DATE NULL,
    "CREATE_BY"           NVARCHAR2(32) NULL,
    "UPDATE_DATE"         DATE NULL,
    "UPDATE_BY"           NVARCHAR2(32) NULL,
    "TASK_NAME"           NVARCHAR2(255) NULL,
    "URLPATH"             NVARCHAR2(255) NULL,
    "SUBMITTIMES"         NUMBER(11) NULL
) LOGGING
NOCOMPRESS
NOCACHE
;

-- ----------------------------
-- Records of USER_LEAVE
-- ----------------------------
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('25e601c9ba9a43d38dcee96ef7ec2066', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '请假11111122', '3', '2617', null, null, null, null,
        null, null, '/leave/readOnlyLeave/25e601c9ba9a43d38dcee96ef7ec2066', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('34ef7e4ff58044c6b6ed3d303968e2d4', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '请假1234', '3', '2641', null, null, null, null, null,
        null, '/leave/readOnlyLeave/34ef7e4ff58044c6b6ed3d303968e2d4', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('4d5cc5e5bd5642569a4b0b9509597f11', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '请假1111', '3', '2678', null, null, null, null, null,
        null, '/leave/readOnlyLeave/4d5cc5e5bd5642569a4b0b9509597f11', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('5da09b45283b4720b0026e41a318df56', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '请假11111', '3', '2589', null, null, null, null, null,
        null, '/leave/readOnlyLeave/5da09b45283b4720b0026e41a318df56', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('870c3774dacb4640935824398bad686a', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '123', '3', '2665', null, null, null, null, null, null,
        '/leave/readOnlyLeave/870c3774dacb4640935824398bad686a', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('89f445cbe3334a458a412691170d1e11', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2018-07-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-07-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '2222', '3', '277535', null, null, null, null, null,
        null, '/leave/readOnlyLeave/89f445cbe3334a458a412691170d1e11', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('96d24b30e2c04c3b8da030dd2c066cc9', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '轻机枪111', '3', '2576', null, null, null, null, null,
        null, '/leave/readOnlyLeave/96d24b30e2c04c3b8da030dd2c066cc9', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('b43d3d08bbb445ec9ba9ce10eac1985d', 'acfc0e9232f54732a5d9ffe9071bf572', 'admin',
        TO_DATE('2019-02-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '111', '3', '302501', null, null, null, null, null,
        null, '/leave/readOnlyLeave/b43d3d08bbb445ec9ba9ce10eac1985d', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('be7055719798461d93c3aa635c309bdc', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2018-07-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2018-07-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '111', '3', '277505', null, null, null, null, null,
        null, '/leave/readOnlyLeave/be7055719798461d93c3aa635c309bdc', '1');
INSERT INTO "LEN"."USER_LEAVE"
VALUES ('caeae3400ee14e96a3b7c27359258111', 'a4a743bffe9711e7b472201a068c6482', 'zxm',
        TO_DATE('2019-02-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_DATE('2019-02-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '阿斯蒂芬', '3', '2691', null, null, null, null, null,
        null, '/leave/readOnlyLeave/caeae3400ee14e96a3b7c27359258111', '1');

-- ----------------------------
-- Sequence structure for ACT_EVT_LOG_SEQ
-- ----------------------------
DROP SEQUENCE "LEN"."ACT_EVT_LOG_SEQ";
CREATE SEQUENCE "LEN"."ACT_EVT_LOG_SEQ"
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    START WITH 1 CACHE 20;

-- ----------------------------
-- Indexes structure for table ACT_ASSIGNEE
-- ----------------------------

-- ----------------------------
-- Checks structure for table ACT_ASSIGNEE
-- ----------------------------
ALTER TABLE "LEN"."ACT_ASSIGNEE"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."ACT_ASSIGNEE"
    ADD CHECK ("SID" IS NOT NULL);
ALTER TABLE "LEN"."ACT_ASSIGNEE"
    ADD CHECK ("ASSIGNEE_TYPE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_ASSIGNEE
-- ----------------------------
ALTER TABLE "LEN"."ACT_ASSIGNEE"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table ACT_EVT_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table ACT_EVT_LOG
-- ----------------------------
ALTER TABLE "LEN"."ACT_EVT_LOG"
    ADD CHECK ("TIME_STAMP_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_EVT_LOG
-- ----------------------------
ALTER TABLE "LEN"."ACT_EVT_LOG"
    ADD PRIMARY KEY ("LOG_NR_");

-- ----------------------------
-- Indexes structure for table ACT_GE_BYTEARRAY
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_BYTEAR_DEPL"
    ON "LEN"."ACT_GE_BYTEARRAY" ("DEPLOYMENT_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE "LEN"."ACT_GE_BYTEARRAY"
    ADD CHECK (GENERATED_ IN (1, 0));

-- ----------------------------
-- Primary Key structure for table ACT_GE_BYTEARRAY
-- ----------------------------
ALTER TABLE "LEN"."ACT_GE_BYTEARRAY"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_GE_PROPERTY
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_GE_PROPERTY
-- ----------------------------
ALTER TABLE "LEN"."ACT_GE_PROPERTY"
    ADD PRIMARY KEY ("NAME_");

-- ----------------------------
-- Indexes structure for table ACT_HI_ACTINST
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_ACT_INST_END"
    ON "LEN"."ACT_HI_ACTINST" ("END_TIME_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_ACT_INST_EXEC"
    ON "LEN"."ACT_HI_ACTINST" ("EXECUTION_ID_" ASC, "ACT_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_ACT_INST_PROCINST"
    ON "LEN"."ACT_HI_ACTINST" ("PROC_INST_ID_" ASC, "ACT_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_ACT_INST_START"
    ON "LEN"."ACT_HI_ACTINST" ("START_TIME_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_HI_ACTINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("PROC_DEF_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("PROC_INST_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("EXECUTION_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("ACT_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("ACT_TYPE_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_ACTINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_ACTINST"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_ATTACHMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table ACT_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_ATTACHMENT"
    ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_ATTACHMENT
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_ATTACHMENT"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_COMMENT
-- ----------------------------

-- ----------------------------
-- Checks structure for table ACT_HI_COMMENT
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_COMMENT"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_COMMENT"
    ADD CHECK ("TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_COMMENT
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_COMMENT"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_DETAIL
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_DETAIL_ACT_INST"
    ON "LEN"."ACT_HI_DETAIL" ("ACT_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_DETAIL_NAME"
    ON "LEN"."ACT_HI_DETAIL" ("NAME_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_DETAIL_PROC_INST"
    ON "LEN"."ACT_HI_DETAIL" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_DETAIL_TASK_ID"
    ON "LEN"."ACT_HI_DETAIL" ("TASK_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_DETAIL_TIME"
    ON "LEN"."ACT_HI_DETAIL" ("TIME_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_HI_DETAIL
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_DETAIL"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_DETAIL"
    ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_DETAIL"
    ADD CHECK ("NAME_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_DETAIL"
    ADD CHECK ("TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_DETAIL
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_DETAIL"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_IDENT_LNK_PROCINST"
    ON "LEN"."ACT_HI_IDENTITYLINK" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_IDENT_LNK_TASK"
    ON "LEN"."ACT_HI_IDENTITYLINK" ("TASK_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_IDENT_LNK_USER"
    ON "LEN"."ACT_HI_IDENTITYLINK" ("USER_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Primary Key structure for table ACT_HI_IDENTITYLINK
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_IDENTITYLINK"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_PROCINST
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_PRO_INST_END"
    ON "LEN"."ACT_HI_PROCINST" ("END_TIME_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_PRO_I_BUSKEY"
    ON "LEN"."ACT_HI_PROCINST" ("BUSINESS_KEY_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Uniques structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD UNIQUE ("PROC_INST_ID_");

-- ----------------------------
-- Checks structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD CHECK ("PROC_INST_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD CHECK ("PROC_DEF_ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_PROCINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_PROCINST"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_TASKINST
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_TASK_INST_PROCINST"
    ON "LEN"."ACT_HI_TASKINST" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_HI_TASKINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_TASKINST"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_TASKINST"
    ADD CHECK ("START_TIME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_TASKINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_TASKINST"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_HI_VARINST
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_HI_PROCVAR_NAME_TYPE"
    ON "LEN"."ACT_HI_VARINST" ("NAME_" ASC, "VAR_TYPE_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_PROCVAR_PROC_INST"
    ON "LEN"."ACT_HI_VARINST" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_HI_PROCVAR_TASK_ID"
    ON "LEN"."ACT_HI_VARINST" ("TASK_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_HI_VARINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_VARINST"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_HI_VARINST"
    ADD CHECK ("NAME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_HI_VARINST
-- ----------------------------
ALTER TABLE "LEN"."ACT_HI_VARINST"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_ID_GROUP
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_GROUP
-- ----------------------------
ALTER TABLE "LEN"."ACT_ID_GROUP"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_ID_INFO
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_INFO
-- ----------------------------
ALTER TABLE "LEN"."ACT_ID_INFO"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_ID_MEMBERSHIP
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_MEMB_GROUP"
    ON "LEN"."ACT_ID_MEMBERSHIP" ("GROUP_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_MEMB_USER"
    ON "LEN"."ACT_ID_MEMBERSHIP" ("USER_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Primary Key structure for table ACT_ID_MEMBERSHIP
-- ----------------------------
ALTER TABLE "LEN"."ACT_ID_MEMBERSHIP"
    ADD PRIMARY KEY ("USER_ID_", "GROUP_ID_");

-- ----------------------------
-- Indexes structure for table ACT_ID_USER
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_ID_USER
-- ----------------------------
ALTER TABLE "LEN"."ACT_ID_USER"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_PROCDEF_INFO
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_PROCDEF_INFO_JSON"
    ON "LEN"."ACT_PROCDEF_INFO" ("INFO_JSON_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_PROCDEF_INFO_PROC"
    ON "LEN"."ACT_PROCDEF_INFO" ("PROC_DEF_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Uniques structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD UNIQUE ("PROC_DEF_ID_");

-- ----------------------------
-- Checks structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD CHECK ("PROC_DEF_ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_PROCDEF_INFO
-- ----------------------------
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RE_DEPLOYMENT
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table ACT_RE_DEPLOYMENT
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_DEPLOYMENT"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RE_MODEL
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_MODEL_DEPLOYMENT"
    ON "LEN"."ACT_RE_MODEL" ("DEPLOYMENT_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_MODEL_SOURCE"
    ON "LEN"."ACT_RE_MODEL" ("EDITOR_SOURCE_VALUE_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_MODEL_SOURCE_EXTRA"
    ON "LEN"."ACT_RE_MODEL" ("EDITOR_SOURCE_EXTRA_VALUE_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_RE_MODEL
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_MODEL"
    ADD CHECK ("ID_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_RE_MODEL
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_MODEL"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RE_PROCDEF
-- ----------------------------

-- ----------------------------
-- Uniques structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD UNIQUE ("KEY_", "VERSION_", "TENANT_ID_");

-- ----------------------------
-- Checks structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD CHECK ("KEY_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD CHECK ("VERSION_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD CHECK (HAS_START_FORM_KEY_ IN (1, 0));
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD CHECK (HAS_GRAPHICAL_NOTATION_ IN (1, 0));

-- ----------------------------
-- Primary Key structure for table ACT_RE_PROCDEF
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_PROCDEF"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_EVENT_SUBSCR"
    ON "LEN"."ACT_RU_EVENT_SUBSCR" ("EXECUTION_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_EVENT_SUBSCR_CONFIG_"
    ON "LEN"."ACT_RU_EVENT_SUBSCR" ("CONFIGURATION_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
    ADD CHECK ("EVENT_TYPE_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
    ADD CHECK ("CREATED_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_RU_EVENT_SUBSCR
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_EXECUTION
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_EXEC_BUSKEY"
    ON "LEN"."ACT_RU_EXECUTION" ("BUSINESS_KEY_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_EXE_PARENT"
    ON "LEN"."ACT_RU_EXECUTION" ("PARENT_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_EXE_PROCDEF"
    ON "LEN"."ACT_RU_EXECUTION" ("PROC_DEF_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_EXE_PROCINST"
    ON "LEN"."ACT_RU_EXECUTION" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_EXE_SUPER"
    ON "LEN"."ACT_RU_EXECUTION" ("SUPER_EXEC_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_RU_EXECUTION
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD CHECK (IS_ACTIVE_ IN (1, 0));
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD CHECK (IS_CONCURRENT_ IN (1, 0));
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD CHECK (IS_SCOPE_ IN (1, 0));
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD CHECK (IS_EVENT_SCOPE_ IN (1, 0));

-- ----------------------------
-- Primary Key structure for table ACT_RU_EXECUTION
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_ATHRZ_PROCEDEF"
    ON "LEN"."ACT_RU_IDENTITYLINK" ("PROC_DEF_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_IDENT_LNK_GROUP"
    ON "LEN"."ACT_RU_IDENTITYLINK" ("GROUP_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_IDENT_LNK_USER"
    ON "LEN"."ACT_RU_IDENTITYLINK" ("USER_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_IDL_PROCINST"
    ON "LEN"."ACT_RU_IDENTITYLINK" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_TSKASS_TASK"
    ON "LEN"."ACT_RU_IDENTITYLINK" ("TASK_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Primary Key structure for table ACT_RU_IDENTITYLINK
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_IDENTITYLINK"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_JOB
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_JOB_EXCEPTION"
    ON "LEN"."ACT_RU_JOB" ("EXCEPTION_STACK_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_RU_JOB
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_JOB"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_JOB"
    ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_JOB"
    ADD CHECK (EXCLUSIVE_ IN (1, 0));

-- ----------------------------
-- Primary Key structure for table ACT_RU_JOB
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_JOB"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_TASK
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_TASK_CREATE"
    ON "LEN"."ACT_RU_TASK" ("CREATE_TIME_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_TASK_EXEC"
    ON "LEN"."ACT_RU_TASK" ("EXECUTION_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_TASK_PROCDEF"
    ON "LEN"."ACT_RU_TASK" ("PROC_DEF_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_TASK_PROCINST"
    ON "LEN"."ACT_RU_TASK" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Primary Key structure for table ACT_RU_TASK
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_TASK"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Indexes structure for table ACT_RU_VARIABLE
-- ----------------------------
CREATE INDEX "LEN"."ACT_IDX_VARIABLE_TASK_ID"
    ON "LEN"."ACT_RU_VARIABLE" ("TASK_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_VAR_BYTEARRAY"
    ON "LEN"."ACT_RU_VARIABLE" ("BYTEARRAY_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_VAR_EXE"
    ON "LEN"."ACT_RU_VARIABLE" ("EXECUTION_ID_" ASC) LOGGING
VISIBLE;
CREATE INDEX "LEN"."ACT_IDX_VAR_PROCINST"
    ON "LEN"."ACT_RU_VARIABLE" ("PROC_INST_ID_" ASC) LOGGING
VISIBLE;

-- ----------------------------
-- Checks structure for table ACT_RU_VARIABLE
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD CHECK ("ID_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD CHECK ("TYPE_" IS NOT NULL);
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD CHECK ("NAME_" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table ACT_RU_VARIABLE
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD PRIMARY KEY ("ID_");

-- ----------------------------
-- Checks structure for table BLOG_ARTICLE
-- ----------------------------
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("CODE" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("TITLE" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("CONTENT" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("READ_NUMBER" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("CREATE_BY" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE"
    ADD CHECK ("DEL_FLAG" IS NOT NULL);

-- ----------------------------
-- Indexes structure for table BLOG_ARTICLE_CATEGORY
-- ----------------------------

-- ----------------------------
-- Checks structure for table BLOG_ARTICLE_CATEGORY
-- ----------------------------
ALTER TABLE "LEN"."BLOG_ARTICLE_CATEGORY"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE_CATEGORY"
    ADD CHECK ("ARTICLE_ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE_CATEGORY"
    ADD CHECK ("CATEGORY_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table BLOG_ARTICLE_CATEGORY
-- ----------------------------
ALTER TABLE "LEN"."BLOG_ARTICLE_CATEGORY"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table BLOG_ARTICLE_TAG
-- ----------------------------

-- ----------------------------
-- Checks structure for table BLOG_ARTICLE_TAG
-- ----------------------------
ALTER TABLE "LEN"."BLOG_ARTICLE_TAG"
    ADD CHECK ("ARTICLE_ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_ARTICLE_TAG"
    ADD CHECK ("TAG_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table BLOG_ARTICLE_TAG
-- ----------------------------
ALTER TABLE "LEN"."BLOG_ARTICLE_TAG"
    ADD PRIMARY KEY ("ARTICLE_ID", "TAG_ID");

-- ----------------------------
-- Indexes structure for table BLOG_CATEGORY
-- ----------------------------

-- ----------------------------
-- Checks structure for table BLOG_CATEGORY
-- ----------------------------
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD CHECK ("SEQUENCE" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD CHECK ("CODE" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD CHECK ("NAME" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD CHECK ("PARENT_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table BLOG_CATEGORY
-- ----------------------------
ALTER TABLE "LEN"."BLOG_CATEGORY"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table BLOG_TAG
-- ----------------------------

-- ----------------------------
-- Checks structure for table BLOG_TAG
-- ----------------------------
ALTER TABLE "LEN"."BLOG_TAG"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_TAG"
    ADD CHECK ("TAG_CODE" IS NOT NULL);
ALTER TABLE "LEN"."BLOG_TAG"
    ADD CHECK ("TAG_NAME" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table BLOG_TAG
-- ----------------------------
ALTER TABLE "LEN"."BLOG_TAG"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_DICT_ITEM
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_DICT_ITEM
-- ----------------------------
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("SEQUENCE" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("VALUE" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("DESCRIPTION" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("TYPE_ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD CHECK ("DEL_FLAG" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_DICT_ITEM
-- ----------------------------
ALTER TABLE "LEN"."SYS_DICT_ITEM"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_DICT_TYPE
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_DICT_TYPE
-- ----------------------------
ALTER TABLE "LEN"."SYS_DICT_TYPE"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_TYPE"
    ADD CHECK ("CODE" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_TYPE"
    ADD CHECK ("DEL_FLAG" IS NOT NULL);
ALTER TABLE "LEN"."SYS_DICT_TYPE"
    ADD CHECK ("TEXT" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_DICT_TYPE
-- ----------------------------
ALTER TABLE "LEN"."SYS_DICT_TYPE"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_JOB
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_JOB
-- ----------------------------
ALTER TABLE "LEN"."SYS_JOB"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_JOB"
    ADD CHECK ("JOB_NAME" IS NOT NULL);
ALTER TABLE "LEN"."SYS_JOB"
    ADD CHECK ("CRON" IS NOT NULL);
ALTER TABLE "LEN"."SYS_JOB"
    ADD CHECK ("STATUS" IS NOT NULL);
ALTER TABLE "LEN"."SYS_JOB"
    ADD CHECK ("CLAZZ_PATH" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_JOB
-- ----------------------------
ALTER TABLE "LEN"."SYS_JOB"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_LOG
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_LOG
-- ----------------------------
ALTER TABLE "LEN"."SYS_LOG"
    ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_LOG
-- ----------------------------
ALTER TABLE "LEN"."SYS_LOG"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_MENU
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "LEN"."SYS_MENU"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_MENU"
    ADD CHECK ("NAME" IS NOT NULL);
ALTER TABLE "LEN"."SYS_MENU"
    ADD CHECK ("MENU_TYPE" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_MENU
-- ----------------------------
ALTER TABLE "LEN"."SYS_MENU"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_ROLE
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE"
    ADD CHECK ("ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_ROLE
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table SYS_ROLE_MENU
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_ROLE_MENU
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE_MENU"
    ADD CHECK ("ROLE_ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_ROLE_MENU"
    ADD CHECK ("MENU_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_ROLE_MENU
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE_MENU"
    ADD PRIMARY KEY ("ROLE_ID", "MENU_ID");

-- ----------------------------
-- Indexes structure for table SYS_ROLE_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_ROLE_USER
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE_USER"
    ADD CHECK ("USER_ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_ROLE_USER"
    ADD CHECK ("ROLE_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_ROLE_USER
-- ----------------------------
ALTER TABLE "LEN"."SYS_ROLE_USER"
    ADD PRIMARY KEY ("USER_ID", "ROLE_ID");

-- ----------------------------
-- Indexes structure for table SYS_USER
-- ----------------------------

-- ----------------------------
-- Checks structure for table SYS_USER
-- ----------------------------
ALTER TABLE "LEN"."SYS_USER"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."SYS_USER"
    ADD CHECK ("USERNAME" IS NOT NULL);
ALTER TABLE "LEN"."SYS_USER"
    ADD CHECK ("PASSWORD" IS NOT NULL);
ALTER TABLE "LEN"."SYS_USER"
    ADD CHECK ("DEL_FLAG" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table SYS_USER
-- ----------------------------
ALTER TABLE "LEN"."SYS_USER"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Indexes structure for table USER_LEAVE
-- ----------------------------

-- ----------------------------
-- Checks structure for table USER_LEAVE
-- ----------------------------
ALTER TABLE "LEN"."USER_LEAVE"
    ADD CHECK ("ID" IS NOT NULL);
ALTER TABLE "LEN"."USER_LEAVE"
    ADD CHECK ("USER_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table USER_LEAVE
-- ----------------------------
ALTER TABLE "LEN"."USER_LEAVE"
    ADD PRIMARY KEY ("ID");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_GE_BYTEARRAY"
-- ----------------------------
ALTER TABLE "LEN"."ACT_GE_BYTEARRAY"
    ADD FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "LEN"."ACT_RE_DEPLOYMENT" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_ID_MEMBERSHIP"
-- ----------------------------
ALTER TABLE "LEN"."ACT_ID_MEMBERSHIP"
    ADD FOREIGN KEY ("GROUP_ID_") REFERENCES "LEN"."ACT_ID_GROUP" ("ID_");
ALTER TABLE "LEN"."ACT_ID_MEMBERSHIP"
    ADD FOREIGN KEY ("USER_ID_") REFERENCES "LEN"."ACT_ID_USER" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_PROCDEF_INFO"
-- ----------------------------
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD FOREIGN KEY ("INFO_JSON_ID_") REFERENCES "LEN"."ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "LEN"."ACT_PROCDEF_INFO"
    ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "LEN"."ACT_RE_PROCDEF" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RE_MODEL"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RE_MODEL"
    ADD FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "LEN"."ACT_RE_DEPLOYMENT" ("ID_");
ALTER TABLE "LEN"."ACT_RE_MODEL"
    ADD FOREIGN KEY ("EDITOR_SOURCE_VALUE_ID_") REFERENCES "LEN"."ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "LEN"."ACT_RE_MODEL"
    ADD FOREIGN KEY ("EDITOR_SOURCE_EXTRA_VALUE_ID_") REFERENCES "LEN"."ACT_GE_BYTEARRAY" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_EVENT_SUBSCR"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EVENT_SUBSCR"
    ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_EXECUTION"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD FOREIGN KEY ("PARENT_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "LEN"."ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "LEN"."ACT_RU_EXECUTION"
    ADD FOREIGN KEY ("SUPER_EXEC_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_IDENTITYLINK"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_IDENTITYLINK"
    ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "LEN"."ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "LEN"."ACT_RU_IDENTITYLINK"
    ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "LEN"."ACT_RU_IDENTITYLINK"
    ADD FOREIGN KEY ("TASK_ID_") REFERENCES "LEN"."ACT_RU_TASK" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_JOB"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_JOB"
    ADD FOREIGN KEY ("EXCEPTION_STACK_ID_") REFERENCES "LEN"."ACT_GE_BYTEARRAY" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_TASK"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_TASK"
    ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "LEN"."ACT_RU_TASK"
    ADD FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "LEN"."ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "LEN"."ACT_RU_TASK"
    ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");

-- ----------------------------
-- Foreign Key structure for table "LEN"."ACT_RU_VARIABLE"
-- ----------------------------
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD FOREIGN KEY ("BYTEARRAY_ID_") REFERENCES "LEN"."ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD FOREIGN KEY ("EXECUTION_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "LEN"."ACT_RU_VARIABLE"
    ADD FOREIGN KEY ("PROC_INST_ID_") REFERENCES "LEN"."ACT_RU_EXECUTION" ("ID_");
