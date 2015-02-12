
DROP TABLE IF EXISTS AUTHORITY;
CREATE TABLE AUTHORITY (
  id  integer,
  authority varchar(255),
  primary key (id)
);

DROP TABLE IF EXISTS CREDENTIALS;
CREATE TABLE CREDENTIALS (
  id  integer,
  enabled boolean not null,
  name varchar(255) not null,
  password varchar(255) not null,
  version integer,
  primary key (id)
);

DROP TABLE IF EXISTS CREDENTIALS_AUTHORITIES;
CREATE TABLE CREDENTIALS_AUTHORITIES (
  credentials_id bigint not null,
  authorities_id bigint not null
);

DROP TABLE IF EXISTS TODO;
CREATE TABLE TODO (
    id bigint not null,
    done boolean not null,
    done_time timestamp,
    message varchar(255) not null,
    version integer,
    primary key (id)
);

-- OAUTH

DROP TABLE IF EXISTS OAUTH_CLIENT_DETAILS;
create table OAUTH_CLIENT_DETAILS (
    client_id VARCHAR(256) PRIMARY KEY,
    resource_ids VARCHAR(256),
    client_secret VARCHAR(256),
    scope VARCHAR(256),
    authorized_grant_types VARCHAR(256),
    web_server_redirect_uri VARCHAR(256),
    authorities VARCHAR(256),
    access_token_validity INTEGER,
    refresh_token_validity INTEGER,
    additional_information VARCHAR(4096),
    autoapprove VARCHAR(256)
);

DROP TABLE IF EXISTS OAUTH_CLIENT_TOKEN;
create table OAUTH_CLIENT_TOKEN (
    token_id VARCHAR(256),
    token LONGVARBINARY,
    authentication_id VARCHAR(256),
    user_name VARCHAR(256),
    client_id VARCHAR(256)
);

DROP TABLE IF EXISTS OAUTH_ACCESS_TOKEN;
create table OAUTH_ACCESS_TOKEN (
    token_id VARCHAR(256),
    token LONGVARBINARY,
    authentication_id VARCHAR(256),
    user_name VARCHAR(256),
    client_id VARCHAR(256),
    authentication LONGVARBINARY,
    refresh_token VARCHAR(256)
);

DROP TABLE IF EXISTS OAUTH_REFRESH_TOKEN;
create table OAUTH_REFRESH_TOKEN (
    token_id VARCHAR(256),
    token LONGVARBINARY,
    authentication LONGVARBINARY
);

DROP TABLE IF EXISTS OAUTH_CODE;
create table OAUTH_CODE (
    code VARCHAR(256), authentication LONGVARBINARY
);

DROP TABLE IF EXISTS OAUTH_APPROVALS;
create table OAUTH_APPROVALS (
    userId VARCHAR(256),
    clientId VARCHAR(256),
    scope VARCHAR(256),
    status VARCHAR(10),
    expiresAt TIMESTAMP,
    lastModifiedAt TIMESTAMP
);
