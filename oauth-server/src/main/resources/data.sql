
-- RESOURCE
INSERT INTO "AUTHORITY" VALUES(0,'ROLE_OAUTH_ADMIN');
INSERT INTO "AUTHORITY" VALUES(1,'ROLE_ADMIN');
INSERT INTO "AUTHORITY" VALUES(2,'ROLE_USER');
INSERT INTO "CREDENTIALS" VALUES(0,1,'oauth_admin','admin',0);
INSERT INTO "CREDENTIALS" VALUES(1,1,'resource_admin','admin',0);
INSERT INTO "CREDENTIALS" VALUES(2,1,'user','user',0);
INSERT INTO "CREDENTIALS_AUTHORITIES" VALUES(0,0);
INSERT INTO "CREDENTIALS_AUTHORITIES" VALUES(1,1);
INSERT INTO "CREDENTIALS_AUTHORITIES" VALUES(2,2);

INSERT INTO TODO (id, done, done_time, message, version) VALUES (1, 0, null, 'Write an oauth example application.', 0);
INSERT INTO TODO (id, done, done_time, message, version) VALUES (2, 1, null, 'Do grocery shopping.', 0);

-- OAUTH
INSERT INTO OAUTH_CLIENT_DETAILS
(client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
('read-only-client', 'todo-services', null, 'read', 'implicit', 'http://localhost', NULL, 7200, 0, NULL, 'false');

INSERT INTO OAUTH_CLIENT_DETAILS
(client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
('curl-client', 'todo-services', 'client-secret', 'read,write', 'client_credentials', '', 'ROLE_ADMIN', 7200, 0, NULL, 'false');
