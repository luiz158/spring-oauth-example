create table oauth_client_details (
  client_id VARCHAR(100) PRIMARY KEY,
  resource_ids VARCHAR(100),
  client_secret VARCHAR(100),
  scope VARCHAR(100),
  authorized_grant_types VARCHAR(100),
  web_server_redirect_uri VARCHAR(100),
  authorities VARCHAR(100),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(100),
  autoapprove VARCHAR(100)
);

create table oauth_client_token (
  token_id VARCHAR(100),
  token VARBINARY(100),
  authentication_id VARCHAR(100),
  user_name VARCHAR(100),
  client_id VARCHAR(100)
);

create table oauth_access_token (
  token_id VARCHAR(100),
  token VARBINARY(100),
  authentication_id VARCHAR(100),
  user_name VARCHAR(100),
  client_id VARCHAR(100),
  authentication VARBINARY(100),
  refresh_token VARCHAR(100)
);

create table oauth_refresh_token (
  token_id VARCHAR(100),
  token VARBINARY(100),
  authentication VARBINARY(100)
);

create table oauth_code (
  code VARCHAR(100), authentication VARBINARY(100)
);

create table oauth_approvals (
userId VARCHAR(100),
clientId VARCHAR(100),
scope VARCHAR(100),
status VARCHAR(5),
expiresAt TIMESTAMP,
lastModifiedAt TIMESTAMP
);