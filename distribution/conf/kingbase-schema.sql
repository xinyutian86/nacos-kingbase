/******************************************/
/*
    人大金仓默认把空字符串当做NULL处理，这样会导致某些查询出现问题
    故需要执行以下SQL进行兼容性处理
    show ora_input_emptystr_isnull;  -- on表示视为NULL，off则不会
    alter database {你的数据库名称} set ora_input_emptystr_isnull to 'off';
    select sys_reload_conf();
*/
/******************************************/

-- "nacos"."config_info" definition

-- Drop table

-- DROP TABLE "config_info";

CREATE TABLE "config_info" (
                               "id" bigint AUTO_INCREMENT,
                               "data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"app_name" character varying(128 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"c_desc" character varying(256 char) NULL,
	"c_use" character varying(64 char) NULL,
	"effect" character varying(64 char) NULL,
	"type" character varying(64 char) NULL,
	"c_schema" text NULL,
	"encrypted_data_key" character varying(1024 char) NULL DEFAULT NULL::varchar,
	CONSTRAINT "PRIMARY_73F26186" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfo_datagrouptenant_C827FEB8" UNIQUE (data_id, group_id, tenant_id)
);
COMMENT ON TABLE "nacos"."config_info" IS 'config_info';

-- Column comments

COMMENT ON COLUMN "nacos"."config_info"."id" IS 'id';
COMMENT ON COLUMN "nacos"."config_info"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."config_info"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."config_info"."content" IS 'content';
COMMENT ON COLUMN "nacos"."config_info"."md5" IS 'md5';
COMMENT ON COLUMN "nacos"."config_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."config_info"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "nacos"."config_info"."src_user" IS 'source user';
COMMENT ON COLUMN "nacos"."config_info"."src_ip" IS 'source ip';
COMMENT ON COLUMN "nacos"."config_info"."app_name" IS 'app_name';
COMMENT ON COLUMN "nacos"."config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "nacos"."config_info"."c_desc" IS 'configuration description';
COMMENT ON COLUMN "nacos"."config_info"."c_use" IS 'configuration usage';
COMMENT ON COLUMN "nacos"."config_info"."effect" IS '配置生效的描述';
COMMENT ON COLUMN "nacos"."config_info"."type" IS '配置的类型';
COMMENT ON COLUMN "nacos"."config_info"."c_schema" IS '配置的模式';
COMMENT ON COLUMN "nacos"."config_info"."encrypted_data_key" IS '密钥';


-- "nacos"."config_info_aggr" definition

-- Drop table

-- DROP TABLE "config_info_aggr";

CREATE TABLE "config_info_aggr" (
                                    "id" bigint AUTO_INCREMENT,
                                    "data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"datum_id" character varying(255 char) NOT NULL,
	"content" text NOT NULL,
	"gmt_modified" timestamp without time zone NOT NULL,
	"app_name" character varying(128 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	CONSTRAINT "PRIMARY_F787E5C0" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfoaggr_datagrouptenantdatum_8D1F61BA" UNIQUE (data_id, group_id, tenant_id, datum_id)
);
COMMENT ON TABLE "nacos"."config_info_aggr" IS '增加租户字段';

-- Column comments

COMMENT ON COLUMN "nacos"."config_info_aggr"."id" IS 'id';
COMMENT ON COLUMN "nacos"."config_info_aggr"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."config_info_aggr"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."config_info_aggr"."datum_id" IS 'datum_id';
COMMENT ON COLUMN "nacos"."config_info_aggr"."content" IS '内容';
COMMENT ON COLUMN "nacos"."config_info_aggr"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "nacos"."config_info_aggr"."app_name" IS 'app_name';
COMMENT ON COLUMN "nacos"."config_info_aggr"."tenant_id" IS '租户字段';


-- "nacos"."config_info_beta" definition

-- Drop table

-- DROP TABLE "config_info_beta";

CREATE TABLE "config_info_beta" (
                                    "id" bigint AUTO_INCREMENT,
                                    "data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"beta_ips" character varying(1024 char) NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"encrypted_data_key" character varying(1024 char) NOT NULL DEFAULT NULL::varchar,
	CONSTRAINT "PRIMARY_E3F5B61F" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfobeta_datagrouptenant_E4D7C681" UNIQUE (data_id, group_id, tenant_id)
);
COMMENT ON TABLE "nacos"."config_info_beta" IS 'config_info_beta';

-- Column comments

COMMENT ON COLUMN "nacos"."config_info_beta"."id" IS 'id';
COMMENT ON COLUMN "nacos"."config_info_beta"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."config_info_beta"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."config_info_beta"."app_name" IS 'app_name';
COMMENT ON COLUMN "nacos"."config_info_beta"."content" IS 'content';
COMMENT ON COLUMN "nacos"."config_info_beta"."beta_ips" IS 'betaIps';
COMMENT ON COLUMN "nacos"."config_info_beta"."md5" IS 'md5';
COMMENT ON COLUMN "nacos"."config_info_beta"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."config_info_beta"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "nacos"."config_info_beta"."src_user" IS 'source user';
COMMENT ON COLUMN "nacos"."config_info_beta"."src_ip" IS 'source ip';
COMMENT ON COLUMN "nacos"."config_info_beta"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "nacos"."config_info_beta"."encrypted_data_key" IS '密钥';


-- "nacos"."config_info_tag" definition

-- Drop table

-- DROP TABLE "config_info_tag";

CREATE TABLE "config_info_tag" (
                                   "id" bigint AUTO_INCREMENT,
                                   "data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tag_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	CONSTRAINT "PRIMARY_26447CE1" PRIMARY KEY (id),
	CONSTRAINT "uk_configinfotag_datagrouptenanttag_6AB0E9AE" UNIQUE (data_id, group_id, tenant_id, tag_id)
);
COMMENT ON TABLE "nacos"."config_info_tag" IS 'config_info_tag';

-- Column comments

COMMENT ON COLUMN "nacos"."config_info_tag"."id" IS 'id';
COMMENT ON COLUMN "nacos"."config_info_tag"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."config_info_tag"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."config_info_tag"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "nacos"."config_info_tag"."tag_id" IS 'tag_id';
COMMENT ON COLUMN "nacos"."config_info_tag"."app_name" IS 'app_name';
COMMENT ON COLUMN "nacos"."config_info_tag"."content" IS 'content';
COMMENT ON COLUMN "nacos"."config_info_tag"."md5" IS 'md5';
COMMENT ON COLUMN "nacos"."config_info_tag"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."config_info_tag"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "nacos"."config_info_tag"."src_user" IS 'source user';
COMMENT ON COLUMN "nacos"."config_info_tag"."src_ip" IS 'source ip';


-- "nacos"."config_tags_relation" definition

-- Drop table

-- DROP TABLE "config_tags_relation";

CREATE TABLE "config_tags_relation" (
                                        "id" bigint NOT NULL,
                                        "tag_name" character varying(128 char) NOT NULL,
	"tag_type" character varying(64 char) NULL,
	"data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"nid" bigint AUTO_INCREMENT,
	CONSTRAINT "PRIMARY_82226084" PRIMARY KEY (nid),
	CONSTRAINT "uk_configtagrelation_configidtag_25395725" UNIQUE (id, tag_name, tag_type)
);
CREATE INDEX idx_tenant_id_4FB846F8 ON nacos.config_tags_relation USING btree (tenant_id);
COMMENT ON TABLE "nacos"."config_tags_relation" IS 'config_tag_relation';

-- Column comments

COMMENT ON COLUMN "nacos"."config_tags_relation"."id" IS 'id';
COMMENT ON COLUMN "nacos"."config_tags_relation"."tag_name" IS 'tag_name';
COMMENT ON COLUMN "nacos"."config_tags_relation"."tag_type" IS 'tag_type';
COMMENT ON COLUMN "nacos"."config_tags_relation"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."config_tags_relation"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."config_tags_relation"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "nacos"."config_tags_relation"."nid" IS 'nid, 自增长标识';


-- "nacos"."group_capacity" definition

-- Drop table

-- DROP TABLE "group_capacity";

CREATE TABLE "group_capacity" (
                                  "id" bigint AUTO_INCREMENT,
                                  "group_id" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"quota" bigint NOT NULL DEFAULT 0,
	"usage" bigint NOT NULL DEFAULT 0,
	"max_size" bigint NOT NULL DEFAULT 0,
	"max_aggr_count" bigint NOT NULL DEFAULT 0,
	"max_aggr_size" bigint NOT NULL DEFAULT 0,
	"max_history_count" bigint NOT NULL DEFAULT 0,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_D72B7E75" PRIMARY KEY (id),
	CONSTRAINT "uk_group_id_377325F2" UNIQUE (group_id)
);
COMMENT ON TABLE "nacos"."group_capacity" IS '集群、各Group容量信息表';

-- Column comments

COMMENT ON COLUMN "nacos"."group_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "nacos"."group_capacity"."group_id" IS 'Group ID，空字符表示整个集群';
COMMENT ON COLUMN "nacos"."group_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "nacos"."group_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "nacos"."group_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "nacos"."group_capacity"."max_aggr_count" IS '聚合子配置最大个数，，0表示使用默认值';
COMMENT ON COLUMN "nacos"."group_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "nacos"."group_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "nacos"."group_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."group_capacity"."gmt_modified" IS '修改时间';


-- "nacos"."his_config_info" definition

-- Drop table

-- DROP TABLE "his_config_info";

CREATE TABLE "his_config_info" (
                                   "id" numeric NOT NULL,
                                   "nid" bigint AUTO_INCREMENT,
                                   "data_id" character varying(255 char) NOT NULL,
	"group_id" character varying(128 char) NOT NULL,
	"app_name" character varying(128 char) NULL,
	"content" text NOT NULL,
	"md5" character varying(32 char) NULL,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"src_user" text NULL,
	"src_ip" character varying(50 char) NULL,
	"op_type" character(10 char) NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"encrypted_data_key" character varying(1024 char) NULL DEFAULT NULL::varchar,
	CONSTRAINT "PRIMARY_93A4DC6B" PRIMARY KEY (nid)
);
CREATE INDEX idx_did_8DE97C10 ON nacos.his_config_info USING btree (data_id);
CREATE INDEX idx_gmt_create_F3B3E5A1 ON nacos.his_config_info USING btree (gmt_create);
CREATE INDEX idx_gmt_modified_42DBB1BB ON nacos.his_config_info USING btree (gmt_modified);
COMMENT ON TABLE "nacos"."his_config_info" IS '多租户改造';

-- Column comments

COMMENT ON COLUMN "nacos"."his_config_info"."id" IS 'id';
COMMENT ON COLUMN "nacos"."his_config_info"."nid" IS 'nid, 自增标识';
COMMENT ON COLUMN "nacos"."his_config_info"."data_id" IS 'data_id';
COMMENT ON COLUMN "nacos"."his_config_info"."group_id" IS 'group_id';
COMMENT ON COLUMN "nacos"."his_config_info"."app_name" IS 'app_name';
COMMENT ON COLUMN "nacos"."his_config_info"."content" IS 'content';
COMMENT ON COLUMN "nacos"."his_config_info"."md5" IS 'md5';
COMMENT ON COLUMN "nacos"."his_config_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."his_config_info"."gmt_modified" IS '修改时间';
COMMENT ON COLUMN "nacos"."his_config_info"."src_user" IS 'source user';
COMMENT ON COLUMN "nacos"."his_config_info"."src_ip" IS 'source ip';
COMMENT ON COLUMN "nacos"."his_config_info"."op_type" IS 'operation type';
COMMENT ON COLUMN "nacos"."his_config_info"."tenant_id" IS '租户字段';
COMMENT ON COLUMN "nacos"."his_config_info"."encrypted_data_key" IS '密钥';


-- "nacos"."permissions" definition

-- Drop table

-- DROP TABLE "permissions";

CREATE TABLE "permissions" (
                               "id" bigint AUTO_INCREMENT,
                               "role" character varying(50 char) NOT NULL,
	"resource" character varying(128 char) NOT NULL,
	"action" character varying(8 char) NOT NULL,
	CONSTRAINT "PRIMARY_BE77F07F" PRIMARY KEY (id),
	CONSTRAINT "uk_role_permission_1DFC6980" UNIQUE (role, resource, action)
);

-- Column comments

COMMENT ON COLUMN "nacos"."permissions"."id" IS 'id';
COMMENT ON COLUMN "nacos"."permissions"."role" IS 'role';
COMMENT ON COLUMN "nacos"."permissions"."resource" IS 'resource';
COMMENT ON COLUMN "nacos"."permissions"."action" IS 'action';


-- "nacos"."roles" definition

-- Drop table

-- DROP TABLE "roles";

CREATE TABLE "roles" (
                         "id" bigint AUTO_INCREMENT,
                         "username" character varying(50 char) NOT NULL,
	"role" character varying(50 char) NOT NULL,
	CONSTRAINT "PRIMARY_F8BDF8B8" PRIMARY KEY (id),
	CONSTRAINT "idx_user_role_2451DF41" UNIQUE (username, role)
);

-- Column comments

COMMENT ON COLUMN "nacos"."roles"."id" IS 'id';
COMMENT ON COLUMN "nacos"."roles"."username" IS 'username';
COMMENT ON COLUMN "nacos"."roles"."role" IS 'role';


-- "nacos"."tenant_capacity" definition

-- Drop table

-- DROP TABLE "tenant_capacity";

CREATE TABLE "tenant_capacity" (
                                   "id" bigint AUTO_INCREMENT,
                                   "tenant_id" character varying(128 char) NOT NULL DEFAULT NULL::varchar,
	"quota" bigint NOT NULL DEFAULT 0,
	"usage" bigint NOT NULL DEFAULT 0,
	"max_size" bigint NOT NULL DEFAULT 0,
	"max_aggr_count" bigint NOT NULL DEFAULT 0,
	"max_aggr_size" bigint NOT NULL DEFAULT 0,
	"max_history_count" bigint NOT NULL DEFAULT 0,
	"gmt_create" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"gmt_modified" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT "PRIMARY_F4CCC2AA" PRIMARY KEY (id),
	CONSTRAINT "uk_tenant_id_22935E1" UNIQUE (tenant_id)
);
COMMENT ON TABLE "nacos"."tenant_capacity" IS '租户容量信息表';

-- Column comments

COMMENT ON COLUMN "nacos"."tenant_capacity"."id" IS '主键ID';
COMMENT ON COLUMN "nacos"."tenant_capacity"."tenant_id" IS 'Tenant ID';
COMMENT ON COLUMN "nacos"."tenant_capacity"."quota" IS '配额，0表示使用默认值';
COMMENT ON COLUMN "nacos"."tenant_capacity"."usage" IS '使用量';
COMMENT ON COLUMN "nacos"."tenant_capacity"."max_size" IS '单个配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "nacos"."tenant_capacity"."max_aggr_count" IS '聚合子配置最大个数';
COMMENT ON COLUMN "nacos"."tenant_capacity"."max_aggr_size" IS '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值';
COMMENT ON COLUMN "nacos"."tenant_capacity"."max_history_count" IS '最大变更历史数量';
COMMENT ON COLUMN "nacos"."tenant_capacity"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."tenant_capacity"."gmt_modified" IS '修改时间';


-- "nacos"."tenant_info" definition

-- Drop table

-- DROP TABLE "tenant_info";

CREATE TABLE "tenant_info" (
                               "id" bigint AUTO_INCREMENT,
                               "kp" character varying(128 char) NOT NULL,
	"tenant_id" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tenant_name" character varying(128 char) NULL DEFAULT NULL::varchar,
	"tenant_desc" character varying(256 char) NULL,
	"create_source" character varying(32 char) NULL,
	"gmt_create" bigint NOT NULL,
	"gmt_modified" bigint NOT NULL,
	CONSTRAINT "PRIMARY_8B91ED1E" PRIMARY KEY (id),
	CONSTRAINT "uk_tenant_info_kptenantid_195888C1" UNIQUE (kp, tenant_id)
);
CREATE INDEX idx_tenant_id_ABB71DBA ON nacos.tenant_info USING btree (tenant_id);
COMMENT ON TABLE "nacos"."tenant_info" IS 'tenant_info';

-- Column comments

COMMENT ON COLUMN "nacos"."tenant_info"."id" IS 'id';
COMMENT ON COLUMN "nacos"."tenant_info"."kp" IS 'kp';
COMMENT ON COLUMN "nacos"."tenant_info"."tenant_id" IS 'tenant_id';
COMMENT ON COLUMN "nacos"."tenant_info"."tenant_name" IS 'tenant_name';
COMMENT ON COLUMN "nacos"."tenant_info"."tenant_desc" IS 'tenant_desc';
COMMENT ON COLUMN "nacos"."tenant_info"."create_source" IS 'create_source';
COMMENT ON COLUMN "nacos"."tenant_info"."gmt_create" IS '创建时间';
COMMENT ON COLUMN "nacos"."tenant_info"."gmt_modified" IS '修改时间';


-- "nacos"."users" definition

-- Drop table

-- DROP TABLE "users";

CREATE TABLE "users" (
                         "id" bigint AUTO_INCREMENT,
                         "username" character varying(50 char) NOT NULL,
	"password" character varying(500 char) NOT NULL,
	"enabled" tinyint NOT NULL,
	CONSTRAINT "PRIMARY_18D00203" PRIMARY KEY (id)
);

-- Column comments

COMMENT ON COLUMN "nacos"."users"."id" IS 'id';
COMMENT ON COLUMN "nacos"."users"."username" IS 'username';
COMMENT ON COLUMN "nacos"."users"."password" IS 'password';
COMMENT ON COLUMN "nacos"."users"."enabled" IS 'enabled';