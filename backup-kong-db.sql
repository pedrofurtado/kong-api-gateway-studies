--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22
-- Dumped by pg_dump version 11.22

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.upstreams DROP CONSTRAINT IF EXISTS upstreams_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.upstreams DROP CONSTRAINT IF EXISTS upstreams_client_certificate_id_fkey;
ALTER TABLE IF EXISTS ONLY public.targets DROP CONSTRAINT IF EXISTS targets_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.targets DROP CONSTRAINT IF EXISTS targets_upstream_id_fkey;
ALTER TABLE IF EXISTS ONLY public.snis DROP CONSTRAINT IF EXISTS snis_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.snis DROP CONSTRAINT IF EXISTS snis_certificate_id_fkey;
ALTER TABLE IF EXISTS ONLY public.sm_vaults DROP CONSTRAINT IF EXISTS sm_vaults_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_client_certificate_id_fkey;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_route_id_fkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_credential_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_credentials DROP CONSTRAINT IF EXISTS oauth2_credentials_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_credentials DROP CONSTRAINT IF EXISTS oauth2_credentials_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_plugin_id_fkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_credential_id_fkey;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_set_id_fkey;
ALTER TABLE IF EXISTS ONLY public.keyauth_credentials DROP CONSTRAINT IF EXISTS keyauth_credentials_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.keyauth_credentials DROP CONSTRAINT IF EXISTS keyauth_credentials_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.key_sets DROP CONSTRAINT IF EXISTS key_sets_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.jwt_secrets DROP CONSTRAINT IF EXISTS jwt_secrets_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.jwt_secrets DROP CONSTRAINT IF EXISTS jwt_secrets_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hmacauth_credentials DROP CONSTRAINT IF EXISTS hmacauth_credentials_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.hmacauth_credentials DROP CONSTRAINT IF EXISTS hmacauth_credentials_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_route_id_fkey;
ALTER TABLE IF EXISTS ONLY public.consumers DROP CONSTRAINT IF EXISTS consumers_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.certificates DROP CONSTRAINT IF EXISTS certificates_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.basicauth_credentials DROP CONSTRAINT IF EXISTS basicauth_credentials_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.basicauth_credentials DROP CONSTRAINT IF EXISTS basicauth_credentials_consumer_id_fkey;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_ws_id_fkey;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_consumer_id_fkey;
DROP TRIGGER IF EXISTS upstreams_sync_tags_trigger ON public.upstreams;
DROP TRIGGER IF EXISTS targets_sync_tags_trigger ON public.targets;
DROP TRIGGER IF EXISTS snis_sync_tags_trigger ON public.snis;
DROP TRIGGER IF EXISTS sm_vaults_sync_tags_trigger ON public.sm_vaults;
DROP TRIGGER IF EXISTS sessions_ttl_trigger ON public.sessions;
DROP TRIGGER IF EXISTS services_sync_tags_trigger ON public.services;
DROP TRIGGER IF EXISTS routes_sync_tags_trigger ON public.routes;
DROP TRIGGER IF EXISTS ratelimiting_metrics_ttl_trigger ON public.ratelimiting_metrics;
DROP TRIGGER IF EXISTS plugins_sync_tags_trigger ON public.plugins;
DROP TRIGGER IF EXISTS oauth2_tokens_ttl_trigger ON public.oauth2_tokens;
DROP TRIGGER IF EXISTS oauth2_credentials_sync_tags_trigger ON public.oauth2_credentials;
DROP TRIGGER IF EXISTS oauth2_authorization_codes_ttl_trigger ON public.oauth2_authorization_codes;
DROP TRIGGER IF EXISTS keys_sync_tags_trigger ON public.keys;
DROP TRIGGER IF EXISTS keyauth_sync_tags_trigger ON public.keyauth_credentials;
DROP TRIGGER IF EXISTS keyauth_credentials_ttl_trigger ON public.keyauth_credentials;
DROP TRIGGER IF EXISTS key_sets_sync_tags_trigger ON public.key_sets;
DROP TRIGGER IF EXISTS jwtsecrets_sync_tags_trigger ON public.jwt_secrets;
DROP TRIGGER IF EXISTS hmacauth_sync_tags_trigger ON public.hmacauth_credentials;
DROP TRIGGER IF EXISTS filter_chains_sync_tags_trigger ON public.filter_chains;
DROP TRIGGER IF EXISTS consumers_sync_tags_trigger ON public.consumers;
DROP TRIGGER IF EXISTS clustering_data_planes_ttl_trigger ON public.clustering_data_planes;
DROP TRIGGER IF EXISTS cluster_events_ttl_trigger ON public.cluster_events;
DROP TRIGGER IF EXISTS certificates_sync_tags_trigger ON public.certificates;
DROP TRIGGER IF EXISTS ca_certificates_sync_tags_trigger ON public.ca_certificates;
DROP TRIGGER IF EXISTS basicauth_sync_tags_trigger ON public.basicauth_credentials;
DROP TRIGGER IF EXISTS acme_storage_ttl_trigger ON public.acme_storage;
DROP TRIGGER IF EXISTS acls_sync_tags_trigger ON public.acls;
DROP INDEX IF EXISTS public.upstreams_tags_idx;
DROP INDEX IF EXISTS public.upstreams_fkey_client_certificate;
DROP INDEX IF EXISTS public.targets_upstream_id_idx;
DROP INDEX IF EXISTS public.targets_target_idx;
DROP INDEX IF EXISTS public.targets_tags_idx;
DROP INDEX IF EXISTS public.tags_tags_idx;
DROP INDEX IF EXISTS public.tags_entity_name_idx;
DROP INDEX IF EXISTS public.snis_tags_idx;
DROP INDEX IF EXISTS public.snis_certificate_id_idx;
DROP INDEX IF EXISTS public.sm_vaults_tags_idx;
DROP INDEX IF EXISTS public.sessions_ttl_idx;
DROP INDEX IF EXISTS public.session_sessions_expires_idx;
DROP INDEX IF EXISTS public.services_tags_idx;
DROP INDEX IF EXISTS public.services_fkey_client_certificate;
DROP INDEX IF EXISTS public.routes_tags_idx;
DROP INDEX IF EXISTS public.routes_service_id_idx;
DROP INDEX IF EXISTS public.ratelimiting_metrics_ttl_idx;
DROP INDEX IF EXISTS public.ratelimiting_metrics_idx;
DROP INDEX IF EXISTS public.plugins_tags_idx;
DROP INDEX IF EXISTS public.plugins_service_id_idx;
DROP INDEX IF EXISTS public.plugins_route_id_idx;
DROP INDEX IF EXISTS public.plugins_name_idx;
DROP INDEX IF EXISTS public.plugins_consumer_id_idx;
DROP INDEX IF EXISTS public.oauth2_tokens_ttl_idx;
DROP INDEX IF EXISTS public.oauth2_tokens_service_id_idx;
DROP INDEX IF EXISTS public.oauth2_tokens_credential_id_idx;
DROP INDEX IF EXISTS public.oauth2_tokens_authenticated_userid_idx;
DROP INDEX IF EXISTS public.oauth2_credentials_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.oauth2_credentials_secret_idx;
DROP INDEX IF EXISTS public.oauth2_credentials_consumer_id_idx;
DROP INDEX IF EXISTS public.oauth2_authorization_service_id_idx;
DROP INDEX IF EXISTS public.oauth2_authorization_credential_id_idx;
DROP INDEX IF EXISTS public.oauth2_authorization_codes_ttl_idx;
DROP INDEX IF EXISTS public.oauth2_authorization_codes_authenticated_userid_idx;
DROP INDEX IF EXISTS public.locks_ttl_idx;
DROP INDEX IF EXISTS public.keys_tags_idx;
DROP INDEX IF EXISTS public.keys_fkey_key_sets;
DROP INDEX IF EXISTS public.keyauth_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.keyauth_credentials_ttl_idx;
DROP INDEX IF EXISTS public.keyauth_credentials_consumer_id_idx;
DROP INDEX IF EXISTS public.key_sets_tags_idx;
DROP INDEX IF EXISTS public.jwtsecrets_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.jwt_secrets_secret_idx;
DROP INDEX IF EXISTS public.jwt_secrets_consumer_id_idx;
DROP INDEX IF EXISTS public.hmacauth_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.hmacauth_credentials_consumer_id_idx;
DROP INDEX IF EXISTS public.filter_chains_tags_idx;
DROP INDEX IF EXISTS public.filter_chains_name_idx;
DROP INDEX IF EXISTS public.filter_chains_cache_key_idx;
DROP INDEX IF EXISTS public.consumers_username_idx;
DROP INDEX IF EXISTS public.consumers_tags_idx;
DROP INDEX IF EXISTS public.clustering_data_planes_ttl_idx;
DROP INDEX IF EXISTS public.cluster_events_expire_at_idx;
DROP INDEX IF EXISTS public.cluster_events_channel_idx;
DROP INDEX IF EXISTS public.cluster_events_at_idx;
DROP INDEX IF EXISTS public.certificates_tags_idx;
DROP INDEX IF EXISTS public.basicauth_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.basicauth_consumer_id_idx;
DROP INDEX IF EXISTS public.acme_storage_ttl_idx;
DROP INDEX IF EXISTS public.acls_tags_idex_tags_idx;
DROP INDEX IF EXISTS public.acls_group_idx;
DROP INDEX IF EXISTS public.acls_consumer_id_idx;
ALTER TABLE IF EXISTS ONLY public.workspaces DROP CONSTRAINT IF EXISTS workspaces_pkey;
ALTER TABLE IF EXISTS ONLY public.workspaces DROP CONSTRAINT IF EXISTS workspaces_name_key;
ALTER TABLE IF EXISTS ONLY public.upstreams DROP CONSTRAINT IF EXISTS upstreams_ws_id_name_unique;
ALTER TABLE IF EXISTS ONLY public.upstreams DROP CONSTRAINT IF EXISTS upstreams_pkey;
ALTER TABLE IF EXISTS ONLY public.upstreams DROP CONSTRAINT IF EXISTS upstreams_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.targets DROP CONSTRAINT IF EXISTS targets_pkey;
ALTER TABLE IF EXISTS ONLY public.targets DROP CONSTRAINT IF EXISTS targets_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.targets DROP CONSTRAINT IF EXISTS targets_cache_key_key;
ALTER TABLE IF EXISTS ONLY public.tags DROP CONSTRAINT IF EXISTS tags_pkey;
ALTER TABLE IF EXISTS ONLY public.snis DROP CONSTRAINT IF EXISTS snis_pkey;
ALTER TABLE IF EXISTS ONLY public.snis DROP CONSTRAINT IF EXISTS snis_name_key;
ALTER TABLE IF EXISTS ONLY public.snis DROP CONSTRAINT IF EXISTS snis_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.sm_vaults DROP CONSTRAINT IF EXISTS sm_vaults_prefix_ws_id_key;
ALTER TABLE IF EXISTS ONLY public.sm_vaults DROP CONSTRAINT IF EXISTS sm_vaults_prefix_key;
ALTER TABLE IF EXISTS ONLY public.sm_vaults DROP CONSTRAINT IF EXISTS sm_vaults_pkey;
ALTER TABLE IF EXISTS ONLY public.sm_vaults DROP CONSTRAINT IF EXISTS sm_vaults_id_ws_id_key;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_session_id_key;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_ws_id_name_unique;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_pkey;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.schema_meta DROP CONSTRAINT IF EXISTS schema_meta_pkey;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_ws_id_name_unique;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_pkey;
ALTER TABLE IF EXISTS ONLY public.routes DROP CONSTRAINT IF EXISTS routes_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.response_ratelimiting_metrics DROP CONSTRAINT IF EXISTS response_ratelimiting_metrics_pkey;
ALTER TABLE IF EXISTS ONLY public.ratelimiting_metrics DROP CONSTRAINT IF EXISTS ratelimiting_metrics_pkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_ws_id_instance_name_unique;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_pkey;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.plugins DROP CONSTRAINT IF EXISTS plugins_cache_key_key;
ALTER TABLE IF EXISTS ONLY public.parameters DROP CONSTRAINT IF EXISTS parameters_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_ws_id_refresh_token_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_ws_id_access_token_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_tokens DROP CONSTRAINT IF EXISTS oauth2_tokens_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_credentials DROP CONSTRAINT IF EXISTS oauth2_credentials_ws_id_client_id_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_credentials DROP CONSTRAINT IF EXISTS oauth2_credentials_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_credentials DROP CONSTRAINT IF EXISTS oauth2_credentials_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_ws_id_code_unique;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_pkey;
ALTER TABLE IF EXISTS ONLY public.oauth2_authorization_codes DROP CONSTRAINT IF EXISTS oauth2_authorization_codes_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.locks DROP CONSTRAINT IF EXISTS locks_pkey;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_pkey;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_name_key;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_kid_set_id_key;
ALTER TABLE IF EXISTS ONLY public.keys DROP CONSTRAINT IF EXISTS keys_cache_key_key;
ALTER TABLE IF EXISTS ONLY public.keyauth_credentials DROP CONSTRAINT IF EXISTS keyauth_credentials_ws_id_key_unique;
ALTER TABLE IF EXISTS ONLY public.keyauth_credentials DROP CONSTRAINT IF EXISTS keyauth_credentials_pkey;
ALTER TABLE IF EXISTS ONLY public.keyauth_credentials DROP CONSTRAINT IF EXISTS keyauth_credentials_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.key_sets DROP CONSTRAINT IF EXISTS key_sets_pkey;
ALTER TABLE IF EXISTS ONLY public.key_sets DROP CONSTRAINT IF EXISTS key_sets_name_key;
ALTER TABLE IF EXISTS ONLY public.jwt_secrets DROP CONSTRAINT IF EXISTS jwt_secrets_ws_id_key_unique;
ALTER TABLE IF EXISTS ONLY public.jwt_secrets DROP CONSTRAINT IF EXISTS jwt_secrets_pkey;
ALTER TABLE IF EXISTS ONLY public.jwt_secrets DROP CONSTRAINT IF EXISTS jwt_secrets_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.hmacauth_credentials DROP CONSTRAINT IF EXISTS hmacauth_credentials_ws_id_username_unique;
ALTER TABLE IF EXISTS ONLY public.hmacauth_credentials DROP CONSTRAINT IF EXISTS hmacauth_credentials_pkey;
ALTER TABLE IF EXISTS ONLY public.hmacauth_credentials DROP CONSTRAINT IF EXISTS hmacauth_credentials_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_pkey;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_name_key;
ALTER TABLE IF EXISTS ONLY public.filter_chains DROP CONSTRAINT IF EXISTS filter_chains_cache_key_key;
ALTER TABLE IF EXISTS ONLY public.consumers DROP CONSTRAINT IF EXISTS consumers_ws_id_username_unique;
ALTER TABLE IF EXISTS ONLY public.consumers DROP CONSTRAINT IF EXISTS consumers_ws_id_custom_id_unique;
ALTER TABLE IF EXISTS ONLY public.consumers DROP CONSTRAINT IF EXISTS consumers_pkey;
ALTER TABLE IF EXISTS ONLY public.consumers DROP CONSTRAINT IF EXISTS consumers_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.clustering_data_planes DROP CONSTRAINT IF EXISTS clustering_data_planes_pkey;
ALTER TABLE IF EXISTS ONLY public.cluster_events DROP CONSTRAINT IF EXISTS cluster_events_pkey;
ALTER TABLE IF EXISTS ONLY public.certificates DROP CONSTRAINT IF EXISTS certificates_pkey;
ALTER TABLE IF EXISTS ONLY public.certificates DROP CONSTRAINT IF EXISTS certificates_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.ca_certificates DROP CONSTRAINT IF EXISTS ca_certificates_pkey;
ALTER TABLE IF EXISTS ONLY public.ca_certificates DROP CONSTRAINT IF EXISTS ca_certificates_cert_digest_key;
ALTER TABLE IF EXISTS ONLY public.basicauth_credentials DROP CONSTRAINT IF EXISTS basicauth_credentials_ws_id_username_unique;
ALTER TABLE IF EXISTS ONLY public.basicauth_credentials DROP CONSTRAINT IF EXISTS basicauth_credentials_pkey;
ALTER TABLE IF EXISTS ONLY public.basicauth_credentials DROP CONSTRAINT IF EXISTS basicauth_credentials_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.acme_storage DROP CONSTRAINT IF EXISTS acme_storage_pkey;
ALTER TABLE IF EXISTS ONLY public.acme_storage DROP CONSTRAINT IF EXISTS acme_storage_key_key;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_pkey;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_id_ws_id_unique;
ALTER TABLE IF EXISTS ONLY public.acls DROP CONSTRAINT IF EXISTS acls_cache_key_key;
DROP TABLE IF EXISTS public.workspaces;
DROP TABLE IF EXISTS public.upstreams;
DROP TABLE IF EXISTS public.targets;
DROP TABLE IF EXISTS public.tags;
DROP TABLE IF EXISTS public.snis;
DROP TABLE IF EXISTS public.sm_vaults;
DROP TABLE IF EXISTS public.sessions;
DROP TABLE IF EXISTS public.services;
DROP TABLE IF EXISTS public.schema_meta;
DROP TABLE IF EXISTS public.routes;
DROP TABLE IF EXISTS public.response_ratelimiting_metrics;
DROP TABLE IF EXISTS public.ratelimiting_metrics;
DROP TABLE IF EXISTS public.plugins;
DROP TABLE IF EXISTS public.parameters;
DROP TABLE IF EXISTS public.oauth2_tokens;
DROP TABLE IF EXISTS public.oauth2_credentials;
DROP TABLE IF EXISTS public.oauth2_authorization_codes;
DROP TABLE IF EXISTS public.locks;
DROP TABLE IF EXISTS public.keys;
DROP TABLE IF EXISTS public.keyauth_credentials;
DROP TABLE IF EXISTS public.key_sets;
DROP TABLE IF EXISTS public.jwt_secrets;
DROP TABLE IF EXISTS public.hmacauth_credentials;
DROP TABLE IF EXISTS public.filter_chains;
DROP TABLE IF EXISTS public.consumers;
DROP TABLE IF EXISTS public.clustering_data_planes;
DROP TABLE IF EXISTS public.cluster_events;
DROP TABLE IF EXISTS public.certificates;
DROP TABLE IF EXISTS public.ca_certificates;
DROP TABLE IF EXISTS public.basicauth_credentials;
DROP TABLE IF EXISTS public.acme_storage;
DROP TABLE IF EXISTS public.acls;
DROP FUNCTION IF EXISTS public.sync_tags();
DROP FUNCTION IF EXISTS public.batch_delete_expired_rows();
--
-- Name: batch_delete_expired_rows(); Type: FUNCTION; Schema: public; Owner: kongdbuser
--

CREATE FUNCTION public.batch_delete_expired_rows() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          EXECUTE FORMAT('WITH rows AS (SELECT ctid FROM %s WHERE %s < CURRENT_TIMESTAMP AT TIME ZONE ''UTC'' ORDER BY %s LIMIT 2 FOR UPDATE SKIP LOCKED) DELETE FROM %s WHERE ctid IN (TABLE rows)', TG_TABLE_NAME, TG_ARGV[0], TG_ARGV[0], TG_TABLE_NAME);
          RETURN NULL;
        END;
      $$;


ALTER FUNCTION public.batch_delete_expired_rows() OWNER TO kongdbuser;

--
-- Name: sync_tags(); Type: FUNCTION; Schema: public; Owner: kongdbuser
--

CREATE FUNCTION public.sync_tags() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          IF (TG_OP = 'TRUNCATE') THEN
            DELETE FROM tags WHERE entity_name = TG_TABLE_NAME;
            RETURN NULL;
          ELSIF (TG_OP = 'DELETE') THEN
            DELETE FROM tags WHERE entity_id = OLD.id;
            RETURN OLD;
          ELSE

          -- Triggered by INSERT/UPDATE
          -- Do an upsert on the tags table
          -- So we don't need to migrate pre 1.1 entities
          INSERT INTO tags VALUES (NEW.id, TG_TABLE_NAME, NEW.tags)
          ON CONFLICT (entity_id) DO UPDATE
                  SET tags=EXCLUDED.tags;
          END IF;
          RETURN NEW;
        END;
      $$;


ALTER FUNCTION public.sync_tags() OWNER TO kongdbuser;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acls; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.acls (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    consumer_id uuid,
    "group" text,
    cache_key text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.acls OWNER TO kongdbuser;

--
-- Name: acme_storage; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.acme_storage (
    id uuid NOT NULL,
    key text,
    value text,
    created_at timestamp with time zone,
    ttl timestamp with time zone
);


ALTER TABLE public.acme_storage OWNER TO kongdbuser;

--
-- Name: basicauth_credentials; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.basicauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    consumer_id uuid,
    username text,
    password text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.basicauth_credentials OWNER TO kongdbuser;

--
-- Name: ca_certificates; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.ca_certificates (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    cert text NOT NULL,
    tags text[],
    cert_digest text NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.ca_certificates OWNER TO kongdbuser;

--
-- Name: certificates; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.certificates (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    cert text,
    key text,
    tags text[],
    ws_id uuid,
    cert_alt text,
    key_alt text,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.certificates OWNER TO kongdbuser;

--
-- Name: cluster_events; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.cluster_events (
    id uuid NOT NULL,
    node_id uuid NOT NULL,
    at timestamp with time zone NOT NULL,
    nbf timestamp with time zone,
    expire_at timestamp with time zone NOT NULL,
    channel text,
    data text
);


ALTER TABLE public.cluster_events OWNER TO kongdbuser;

--
-- Name: clustering_data_planes; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.clustering_data_planes (
    id uuid NOT NULL,
    hostname text NOT NULL,
    ip text NOT NULL,
    last_seen timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    config_hash text NOT NULL,
    ttl timestamp with time zone,
    version text,
    sync_status text DEFAULT 'unknown'::text NOT NULL,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    labels jsonb,
    cert_details jsonb
);


ALTER TABLE public.clustering_data_planes OWNER TO kongdbuser;

--
-- Name: consumers; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.consumers (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    username text,
    custom_id text,
    tags text[],
    ws_id uuid,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.consumers OWNER TO kongdbuser;

--
-- Name: filter_chains; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.filter_chains (
    id uuid NOT NULL,
    name text,
    enabled boolean DEFAULT true,
    route_id uuid,
    service_id uuid,
    ws_id uuid,
    cache_key text,
    filters jsonb[],
    tags text[],
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.filter_chains OWNER TO kongdbuser;

--
-- Name: hmacauth_credentials; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.hmacauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    consumer_id uuid,
    username text,
    secret text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.hmacauth_credentials OWNER TO kongdbuser;

--
-- Name: jwt_secrets; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.jwt_secrets (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    consumer_id uuid,
    key text,
    secret text,
    algorithm text,
    rsa_public_key text,
    tags text[],
    ws_id uuid
);


ALTER TABLE public.jwt_secrets OWNER TO kongdbuser;

--
-- Name: key_sets; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.key_sets (
    id uuid NOT NULL,
    name text,
    tags text[],
    ws_id uuid,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.key_sets OWNER TO kongdbuser;

--
-- Name: keyauth_credentials; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.keyauth_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    consumer_id uuid,
    key text,
    tags text[],
    ttl timestamp with time zone,
    ws_id uuid
);


ALTER TABLE public.keyauth_credentials OWNER TO kongdbuser;

--
-- Name: keys; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.keys (
    id uuid NOT NULL,
    set_id uuid,
    name text,
    cache_key text,
    ws_id uuid,
    kid text,
    jwk text,
    pem jsonb,
    tags text[],
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.keys OWNER TO kongdbuser;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.locks (
    key text NOT NULL,
    owner text,
    ttl timestamp with time zone
);


ALTER TABLE public.locks OWNER TO kongdbuser;

--
-- Name: oauth2_authorization_codes; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.oauth2_authorization_codes (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    credential_id uuid,
    service_id uuid,
    code text,
    authenticated_userid text,
    scope text,
    ttl timestamp with time zone,
    challenge text,
    challenge_method text,
    ws_id uuid,
    plugin_id uuid
);


ALTER TABLE public.oauth2_authorization_codes OWNER TO kongdbuser;

--
-- Name: oauth2_credentials; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.oauth2_credentials (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    name text,
    consumer_id uuid,
    client_id text,
    client_secret text,
    redirect_uris text[],
    tags text[],
    client_type text,
    hash_secret boolean,
    ws_id uuid
);


ALTER TABLE public.oauth2_credentials OWNER TO kongdbuser;

--
-- Name: oauth2_tokens; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.oauth2_tokens (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    credential_id uuid,
    service_id uuid,
    access_token text,
    refresh_token text,
    token_type text,
    expires_in integer,
    authenticated_userid text,
    scope text,
    ttl timestamp with time zone,
    ws_id uuid
);


ALTER TABLE public.oauth2_tokens OWNER TO kongdbuser;

--
-- Name: parameters; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.parameters (
    key text NOT NULL,
    value text NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.parameters OWNER TO kongdbuser;

--
-- Name: plugins; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.plugins (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    name text NOT NULL,
    consumer_id uuid,
    service_id uuid,
    route_id uuid,
    config jsonb NOT NULL,
    enabled boolean NOT NULL,
    cache_key text,
    protocols text[],
    tags text[],
    ws_id uuid,
    instance_name text,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.plugins OWNER TO kongdbuser;

--
-- Name: ratelimiting_metrics; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.ratelimiting_metrics (
    identifier text NOT NULL,
    period text NOT NULL,
    period_date timestamp with time zone NOT NULL,
    service_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    route_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    value integer,
    ttl timestamp with time zone
);


ALTER TABLE public.ratelimiting_metrics OWNER TO kongdbuser;

--
-- Name: response_ratelimiting_metrics; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.response_ratelimiting_metrics (
    identifier text NOT NULL,
    period text NOT NULL,
    period_date timestamp with time zone NOT NULL,
    service_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    route_id uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    value integer
);


ALTER TABLE public.response_ratelimiting_metrics OWNER TO kongdbuser;

--
-- Name: routes; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.routes (
    id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name text,
    service_id uuid,
    protocols text[],
    methods text[],
    hosts text[],
    paths text[],
    snis text[],
    sources jsonb[],
    destinations jsonb[],
    regex_priority bigint,
    strip_path boolean,
    preserve_host boolean,
    tags text[],
    https_redirect_status_code integer,
    headers jsonb,
    path_handling text DEFAULT 'v0'::text,
    ws_id uuid,
    request_buffering boolean,
    response_buffering boolean,
    expression text,
    priority bigint
);


ALTER TABLE public.routes OWNER TO kongdbuser;

--
-- Name: schema_meta; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.schema_meta (
    key text NOT NULL,
    subsystem text NOT NULL,
    last_executed text,
    executed text[],
    pending text[]
);


ALTER TABLE public.schema_meta OWNER TO kongdbuser;

--
-- Name: services; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.services (
    id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name text,
    retries bigint,
    protocol text,
    host text,
    port bigint,
    path text,
    connect_timeout bigint,
    write_timeout bigint,
    read_timeout bigint,
    tags text[],
    client_certificate_id uuid,
    tls_verify boolean,
    tls_verify_depth smallint,
    ca_certificates uuid[],
    ws_id uuid,
    enabled boolean DEFAULT true
);


ALTER TABLE public.services OWNER TO kongdbuser;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.sessions (
    id uuid NOT NULL,
    session_id text,
    expires integer,
    data text,
    created_at timestamp with time zone,
    ttl timestamp with time zone
);


ALTER TABLE public.sessions OWNER TO kongdbuser;

--
-- Name: sm_vaults; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.sm_vaults (
    id uuid NOT NULL,
    ws_id uuid,
    prefix text,
    name text NOT NULL,
    description text,
    config jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    updated_at timestamp with time zone,
    tags text[]
);


ALTER TABLE public.sm_vaults OWNER TO kongdbuser;

--
-- Name: snis; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.snis (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    name text NOT NULL,
    certificate_id uuid,
    tags text[],
    ws_id uuid,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.snis OWNER TO kongdbuser;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.tags (
    entity_id uuid NOT NULL,
    entity_name text,
    tags text[]
);


ALTER TABLE public.tags OWNER TO kongdbuser;

--
-- Name: targets; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.targets (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(3)),
    upstream_id uuid,
    target text NOT NULL,
    weight integer NOT NULL,
    tags text[],
    ws_id uuid,
    cache_key text,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(3))
);


ALTER TABLE public.targets OWNER TO kongdbuser;

--
-- Name: upstreams; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.upstreams (
    id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(3)),
    name text,
    hash_on text,
    hash_fallback text,
    hash_on_header text,
    hash_fallback_header text,
    hash_on_cookie text,
    hash_on_cookie_path text,
    slots integer NOT NULL,
    healthchecks jsonb,
    tags text[],
    algorithm text,
    host_header text,
    client_certificate_id uuid,
    ws_id uuid,
    hash_on_query_arg text,
    hash_fallback_query_arg text,
    hash_on_uri_capture text,
    hash_fallback_uri_capture text,
    use_srv_name boolean DEFAULT false,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.upstreams OWNER TO kongdbuser;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: kongdbuser
--

CREATE TABLE public.workspaces (
    id uuid NOT NULL,
    name text,
    comment text,
    created_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0)),
    meta jsonb,
    config jsonb,
    updated_at timestamp with time zone DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(0))
);


ALTER TABLE public.workspaces OWNER TO kongdbuser;

--
-- Data for Name: acls; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: acme_storage; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: basicauth_credentials; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.basicauth_credentials (id, created_at, consumer_id, username, password, tags, ws_id) VALUES ('7a0b260b-8aa6-4b93-a29d-b6c0ddb377ef', '2024-03-02 02:23:32+00', '1bbb2639-2738-435e-8538-2a95f06066b2', 'myuser', '1c474ea3be5397a03866fbbb572944c0ae5e699b', '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');


--
-- Data for Name: ca_certificates; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: cluster_events; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('1f1674c2-5516-4eeb-b1f3-b5cef5fcb1ae', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:23:32.222+00', NULL, '2024-03-11 11:23:32.222+00', 'invalidations', 'routes:2f03377f-b530-427f-96bc-1a7b5131af0b:::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('96800601-d9a8-4703-9397-92c669296d1a', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:23:32.224+00', NULL, '2024-03-11 11:23:32.224+00', 'invalidations', 'router:version');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('4d896127-3abc-447d-a18a-f1718378f3c1', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:25:28.532+00', NULL, '2024-03-11 11:25:28.532+00', 'invalidations', 'plugins:jwt:2f03377f-b530-427f-96bc-1a7b5131af0b::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('81a9c88a-369b-4e66-adc0-d5e11472479f', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:25:28.535+00', NULL, '2024-03-11 11:25:28.535+00', 'invalidations', 'plugins_iterator:version');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('bebbb1d1-4861-433d-8d7f-6cd8ef588fc8', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:26:55.107+00', NULL, '2024-03-11 11:26:55.107+00', 'invalidations', 'jwt_secrets:service-two-nodejs-consumer01-jwt-key:::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('00d58d30-af07-4a39-87c3-31283ebba524', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:39:04.96+00', NULL, '2024-03-11 11:39:04.96+00', 'invalidations', 'plugins:jwt:2f03377f-b530-427f-96bc-1a7b5131af0b::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('3afa1024-eabc-48f8-884a-54958c1c3b6f', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:39:04.962+00', NULL, '2024-03-11 11:39:04.962+00', 'invalidations', 'plugins_iterator:version');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('91772971-d097-4ad8-8da9-f081e2fba8cd', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:44:45.196+00', NULL, '2024-03-11 11:44:45.196+00', 'invalidations', 'jwt_secrets:service-two-nodejs-consumer01-jwt-key:::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');
INSERT INTO public.cluster_events (id, node_id, at, nbf, expire_at, channel, data) VALUES ('8c1c1c78-4c35-474a-a765-41a2561247b9', '997a0652-d6f5-4bea-98e3-94ff1a6f445d', '2024-03-11 10:45:18.595+00', NULL, '2024-03-11 11:45:18.595+00', 'invalidations', 'jwt_secrets:service-two-nodejs-consumer01-jwt-key:::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');


--
-- Data for Name: clustering_data_planes; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: consumers; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.consumers (id, created_at, username, custom_id, tags, ws_id, updated_at) VALUES ('186bfaa2-c68e-4c2a-abcb-064e9ee410db', '2024-02-28 01:05:09+00', 'service-one-ruby-consumer01', NULL, '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-02-28 01:05:09+00');
INSERT INTO public.consumers (id, created_at, username, custom_id, tags, ws_id, updated_at) VALUES ('1bbb2639-2738-435e-8538-2a95f06066b2', '2024-03-02 02:05:30+00', 'service-two-nodejs-consumer01', NULL, '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-03-02 02:05:30+00');


--
-- Data for Name: filter_chains; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: hmacauth_credentials; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: jwt_secrets; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.jwt_secrets (id, created_at, consumer_id, key, secret, algorithm, rsa_public_key, tags, ws_id) VALUES ('2fdfa1e9-5833-451e-9536-3b335a30ff15', '2024-03-11 10:45:18+00', '1bbb2639-2738-435e-8538-2a95f06066b2', 'service-two-nodejs-consumer01-jwt-key', 'service-two-nodejs-consumer01-jwt-secret', 'HS256', NULL, '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');


--
-- Data for Name: key_sets; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: keyauth_credentials; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.keyauth_credentials (id, created_at, consumer_id, key, tags, ttl, ws_id) VALUES ('dddd5139-6d65-4bdc-90cc-1e81b4424ca3', '2024-02-28 01:10:32+00', '186bfaa2-c68e-4c2a-abcb-064e9ee410db', 'V8ypz1omCA2j0BFcNu4ZMvyGV2795H4g', '{service-one-ruby}', NULL, '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1');


--
-- Data for Name: keys; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: locks; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: oauth2_authorization_codes; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: oauth2_credentials; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: oauth2_tokens; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.parameters (key, value, created_at) VALUES ('cluster_id', '0fd4873a-1b53-4576-880e-999fe973f769', NULL);


--
-- Data for Name: plugins; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('af7b7819-1f72-4560-82f2-c75ab1d735f9', '2024-02-28 01:10:20+00', 'key-auth', NULL, '584ca95f-c02d-4bc4-867e-42319bbf7c59', '98717d79-4d15-4934-ab07-73391bcbfa93', '{"anonymous": null, "key_names": ["apikeyhere"], "key_in_body": true, "key_in_query": true, "key_in_header": true, "hide_credentials": false, "run_on_preflight": true}', true, 'plugins:key-auth:98717d79-4d15-4934-ab07-73391bcbfa93:584ca95f-c02d-4bc4-867e-42319bbf7c59:::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-one-ruby-v1-key-auth-plugin', '2024-02-28 01:15:50+00');
INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('64d067f4-ce87-43c0-9726-882d7421fbd6', '2024-03-02 02:21:11+00', 'basic-auth', NULL, 'aa358497-757a-4ccc-9cfc-b39958b990a8', '08a75442-532e-40db-bfa1-2cf067995b0a', '{"realm": "service", "anonymous": null, "hide_credentials": false}', true, 'plugins:basic-auth:08a75442-532e-40db-bfa1-2cf067995b0a:aa358497-757a-4ccc-9cfc-b39958b990a8:::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-two-nodejs-v4-basic-auth-plugin', '2024-03-02 02:21:11+00');
INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('b8e9cb6f-679a-4b0a-9a3f-0e93afe9c568', '2024-03-11 09:27:58+00', 'rate-limiting', NULL, NULL, 'c231b9f0-9af0-4915-b104-14789608fd45', '{"day": null, "hour": null, "path": null, "year": null, "month": null, "redis": {"ssl": false, "host": null, "port": 6379, "timeout": 2000, "database": 0, "password": null, "username": null, "ssl_verify": false, "server_name": null}, "minute": 5, "policy": "cluster", "second": null, "limit_by": "consumer", "sync_rate": -1, "error_code": 429, "header_name": null, "error_message": "API rate limit exceeded, bye bye my friend! See you later", "fault_tolerant": true, "hide_client_headers": false}', true, 'plugins:rate-limiting:c231b9f0-9af0-4915-b104-14789608fd45::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-one-ruby-v3-rate-limit-plugin', '2024-03-11 09:27:58+00');
INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('ee1351a7-e88c-4b3d-aeaa-a997f9f281ea', '2024-03-11 09:35:35+00', 'rate-limiting', NULL, NULL, '4d5b72df-2787-4954-80c5-5f57eb8f7a79', '{"day": null, "hour": null, "path": null, "year": null, "month": null, "redis": {"ssl": false, "host": null, "port": 6379, "timeout": 2000, "database": 0, "password": null, "username": null, "ssl_verify": false, "server_name": null}, "minute": 5, "policy": "cluster", "second": null, "limit_by": "consumer", "sync_rate": -1, "error_code": 429, "header_name": null, "error_message": "API rate limit exceeded, oh my god! the door is locked!", "fault_tolerant": true, "hide_client_headers": false}', true, 'plugins:rate-limiting:4d5b72df-2787-4954-80c5-5f57eb8f7a79::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-one-ruby-route-v4-rate-limit-plugin', '2024-03-11 09:35:35+00');
INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('eab789e8-bdd1-4cf6-96fd-78fac1bdb215', '2024-03-11 09:37:27+00', 'key-auth', NULL, NULL, '4d5b72df-2787-4954-80c5-5f57eb8f7a79', '{"anonymous": null, "key_names": ["putyourapikeyheremyfriend"], "key_in_body": true, "key_in_query": true, "key_in_header": true, "hide_credentials": false, "run_on_preflight": true}', true, 'plugins:key-auth:4d5b72df-2787-4954-80c5-5f57eb8f7a79::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-one-ruby-v4-key-auth-plugin', '2024-03-11 09:37:27+00');
INSERT INTO public.plugins (id, created_at, name, consumer_id, service_id, route_id, config, enabled, cache_key, protocols, tags, ws_id, instance_name, updated_at) VALUES ('88bdfd60-5d29-456d-a7ce-ac9df0a59370', '2024-03-11 10:25:28+00', 'jwt', NULL, NULL, '2f03377f-b530-427f-96bc-1a7b5131af0b', '{"anonymous": null, "cookie_names": [], "header_names": ["authorization"], "key_claim_name": "iss", "uri_param_names": ["jwttokenhere"], "claims_to_verify": ["exp"], "run_on_preflight": true, "secret_is_base64": false, "maximum_expiration": 300}', true, 'plugins:jwt:2f03377f-b530-427f-96bc-1a7b5131af0b::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '{http,https}', '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'service-two-nodejs-route-v5-jwt-plugin', '2024-03-11 10:39:04+00');


--
-- Data for Name: ratelimiting_metrics; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: response_ratelimiting_metrics; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('71b20d93-2897-4dbd-b734-1cf2127a7d72', '2024-02-28 01:11:24+00', '2024-02-28 01:11:24+00', 'service-one-ruby-route-v2', '584ca95f-c02d-4bc4-867e-42319bbf7c59', '{http,https}', NULL, NULL, '{/service-one-ruby/v2}', NULL, NULL, NULL, 0, true, false, '{service-one-ruby}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('98717d79-4d15-4934-ab07-73391bcbfa93', '2024-02-28 01:07:21+00', '2024-03-02 01:44:46+00', 'service-one-ruby-route-v1', '584ca95f-c02d-4bc4-867e-42319bbf7c59', '{http,https}', NULL, NULL, '{/service-one-ruby/v1}', NULL, NULL, NULL, 0, true, false, '{service-one-ruby}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('08a75442-532e-40db-bfa1-2cf067995b0a', '2024-03-02 02:07:59+00', '2024-03-02 02:07:59+00', 'service-two-nodejs-route-v3', 'aa358497-757a-4ccc-9cfc-b39958b990a8', '{http,https}', NULL, NULL, '{/service-two-nodejs/v3}', NULL, NULL, NULL, 0, true, false, '{service-two-nodejs}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('7cb3bdff-153a-43cd-a06c-0f3af9def0e9', '2024-03-02 02:08:42+00', '2024-03-02 02:09:08+00', 'service-two-nodejs-route-v4', 'aa358497-757a-4ccc-9cfc-b39958b990a8', '{http,https}', NULL, NULL, '{/second-option-for-service-two-nodejs}', NULL, NULL, NULL, 0, true, false, '{service-two-nodejs}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('c231b9f0-9af0-4915-b104-14789608fd45', '2024-03-11 09:24:14+00', '2024-03-11 09:24:14+00', 'service-one-ruby-route-v3', '584ca95f-c02d-4bc4-867e-42319bbf7c59', '{http,https}', NULL, NULL, '{/service-one-ruby/v3}', NULL, NULL, NULL, 0, true, false, '{service-one-ruby}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('4d5b72df-2787-4954-80c5-5f57eb8f7a79', '2024-03-11 09:34:21+00', '2024-03-11 09:34:21+00', 'service-one-ruby-route-v4', '584ca95f-c02d-4bc4-867e-42319bbf7c59', '{http,https}', NULL, NULL, '{/service-one-ruby/v4}', NULL, NULL, NULL, 0, true, false, '{service-one-ruby}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);
INSERT INTO public.routes (id, created_at, updated_at, name, service_id, protocols, methods, hosts, paths, snis, sources, destinations, regex_priority, strip_path, preserve_host, tags, https_redirect_status_code, headers, path_handling, ws_id, request_buffering, response_buffering, expression, priority) VALUES ('2f03377f-b530-427f-96bc-1a7b5131af0b', '2024-03-11 10:23:32+00', '2024-03-11 10:23:32+00', 'service-two-nodejs-route-v5', 'aa358497-757a-4ccc-9cfc-b39958b990a8', '{http,https}', NULL, NULL, '{/service-two-nodejs/v5}', NULL, NULL, NULL, 0, true, false, '{service-two-nodejs}', 426, NULL, 'v0', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true, true, NULL, NULL);


--
-- Data for Name: schema_meta; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'core', '022_350_to_360', '{000_base,003_100_to_110,004_110_to_120,005_120_to_130,006_130_to_140,007_140_to_150,008_150_to_200,009_200_to_210,010_210_to_211,011_212_to_213,012_213_to_220,013_220_to_230,014_230_to_270,015_270_to_280,016_280_to_300,017_300_to_310,018_310_to_320,019_320_to_330,020_330_to_340,021_340_to_350,022_350_to_360}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'rate-limiting', '006_350_to_360', '{000_base_rate_limiting,003_10_to_112,004_200_to_210,005_320_to_330,006_350_to_360}', NULL);
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'acl', '004_212_to_213', '{000_base_acl,002_130_to_140,003_200_to_210,004_212_to_213}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'response-ratelimiting', '001_350_to_360', '{000_base_response_rate_limiting,001_350_to_360}', NULL);
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'acme', '003_350_to_360', '{000_base_acme,001_280_to_300,002_320_to_330,003_350_to_360}', NULL);
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'basic-auth', '003_200_to_210', '{000_base_basic_auth,002_130_to_140,003_200_to_210}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'bot-detection', '001_200_to_210', '{001_200_to_210}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'session', '002_320_to_330', '{000_base_session,001_add_ttl_index,002_320_to_330}', NULL);
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'hmac-auth', '003_200_to_210', '{000_base_hmac_auth,002_130_to_140,003_200_to_210}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'http-log', '001_280_to_300', '{001_280_to_300}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'ip-restriction', '001_200_to_210', '{001_200_to_210}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'jwt', '003_200_to_210', '{000_base_jwt,002_130_to_140,003_200_to_210}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'key-auth', '004_320_to_330', '{000_base_key_auth,002_130_to_140,003_200_to_210,004_320_to_330}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'oauth2', '007_320_to_330', '{000_base_oauth2,003_130_to_140,004_200_to_210,005_210_to_211,006_320_to_330,007_320_to_330}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'post-function', '001_280_to_300', '{001_280_to_300}', '{}');
INSERT INTO public.schema_meta (key, subsystem, last_executed, executed, pending) VALUES ('schema_meta', 'pre-function', '001_280_to_300', '{001_280_to_300}', '{}');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.services (id, created_at, updated_at, name, retries, protocol, host, port, path, connect_timeout, write_timeout, read_timeout, tags, client_certificate_id, tls_verify, tls_verify_depth, ca_certificates, ws_id, enabled) VALUES ('584ca95f-c02d-4bc4-867e-42319bbf7c59', '2024-02-28 01:06:16+00', '2024-02-28 01:06:16+00', 'service-one-ruby-gateway-service', 5, 'http', 'service-one-ruby-upstream', 9292, NULL, 60000, 60000, 60000, '{service-one-ruby}', NULL, NULL, NULL, NULL, '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true);
INSERT INTO public.services (id, created_at, updated_at, name, retries, protocol, host, port, path, connect_timeout, write_timeout, read_timeout, tags, client_certificate_id, tls_verify, tls_verify_depth, ca_certificates, ws_id, enabled) VALUES ('aa358497-757a-4ccc-9cfc-b39958b990a8', '2024-03-02 02:07:03+00', '2024-03-02 02:07:03+00', 'service-two-nodejs-gateway-service', 5, 'http', 'service-two-nodejs-upstream', 3000, NULL, 60000, 60000, 60000, '{service-two-nodejs}', NULL, NULL, NULL, NULL, '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', true);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: sm_vaults; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: snis; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--



--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('be872ca3-e956-4b00-b26c-4bbf923d4a19', 'upstreams', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('6cabcffb-697c-4cdb-a853-7f389ac096a1', 'targets', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('8144d705-758a-4613-b615-808d5edfd238', 'targets', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('186bfaa2-c68e-4c2a-abcb-064e9ee410db', 'consumers', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('584ca95f-c02d-4bc4-867e-42319bbf7c59', 'services', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('dddd5139-6d65-4bdc-90cc-1e81b4424ca3', 'keyauth_credentials', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('71b20d93-2897-4dbd-b734-1cf2127a7d72', 'routes', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('af7b7819-1f72-4560-82f2-c75ab1d735f9', 'plugins', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('98717d79-4d15-4934-ab07-73391bcbfa93', 'routes', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('ff9c3cc6-6f73-47ab-844e-fac40ee02c97', 'upstreams', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('2849bd46-892d-47bf-9b5d-3009a7cd4044', 'targets', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('dacfefeb-49db-494a-8473-1df34785111e', 'targets', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('6590615b-bd71-492d-ab88-638f625a3295', 'targets', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('1bbb2639-2738-435e-8538-2a95f06066b2', 'consumers', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('aa358497-757a-4ccc-9cfc-b39958b990a8', 'services', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('08a75442-532e-40db-bfa1-2cf067995b0a', 'routes', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('7cb3bdff-153a-43cd-a06c-0f3af9def0e9', 'routes', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('64d067f4-ce87-43c0-9726-882d7421fbd6', 'plugins', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('7a0b260b-8aa6-4b93-a29d-b6c0ddb377ef', 'basicauth_credentials', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('c231b9f0-9af0-4915-b104-14789608fd45', 'routes', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('b8e9cb6f-679a-4b0a-9a3f-0e93afe9c568', 'plugins', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('4d5b72df-2787-4954-80c5-5f57eb8f7a79', 'routes', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('ee1351a7-e88c-4b3d-aeaa-a997f9f281ea', 'plugins', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('eab789e8-bdd1-4cf6-96fd-78fac1bdb215', 'plugins', '{service-one-ruby}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('2f03377f-b530-427f-96bc-1a7b5131af0b', 'routes', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('88bdfd60-5d29-456d-a7ce-ac9df0a59370', 'plugins', '{service-two-nodejs}');
INSERT INTO public.tags (entity_id, entity_name, tags) VALUES ('2fdfa1e9-5833-451e-9536-3b335a30ff15', 'jwt_secrets', '{service-two-nodejs}');


--
-- Data for Name: targets; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.targets (id, created_at, upstream_id, target, weight, tags, ws_id, cache_key, updated_at) VALUES ('6cabcffb-697c-4cdb-a853-7f389ac096a1', '2024-02-28 01:04:28.136+00', 'be872ca3-e956-4b00-b26c-4bbf923d4a19', 'service_one_ruby_replica01:9292', 100, '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'targets:be872ca3-e956-4b00-b26c-4bbf923d4a19:service_one_ruby_replica01:9292::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-02-28 01:04:28.136+00');
INSERT INTO public.targets (id, created_at, upstream_id, target, weight, tags, ws_id, cache_key, updated_at) VALUES ('8144d705-758a-4613-b615-808d5edfd238', '2024-02-28 01:04:40.37+00', 'be872ca3-e956-4b00-b26c-4bbf923d4a19', 'service_one_ruby_replica02:9292', 100, '{service-one-ruby}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'targets:be872ca3-e956-4b00-b26c-4bbf923d4a19:service_one_ruby_replica02:9292::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-02-28 01:04:40.37+00');
INSERT INTO public.targets (id, created_at, upstream_id, target, weight, tags, ws_id, cache_key, updated_at) VALUES ('2849bd46-892d-47bf-9b5d-3009a7cd4044', '2024-03-02 02:04:35.232+00', 'ff9c3cc6-6f73-47ab-844e-fac40ee02c97', 'service_two_nodejs_replica01:3000', 100, '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'targets:ff9c3cc6-6f73-47ab-844e-fac40ee02c97:service_two_nodejs_replica01:3000::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-03-02 02:04:35.232+00');
INSERT INTO public.targets (id, created_at, upstream_id, target, weight, tags, ws_id, cache_key, updated_at) VALUES ('dacfefeb-49db-494a-8473-1df34785111e', '2024-03-02 02:04:43.213+00', 'ff9c3cc6-6f73-47ab-844e-fac40ee02c97', 'service_two_nodejs_replica02:3000', 100, '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'targets:ff9c3cc6-6f73-47ab-844e-fac40ee02c97:service_two_nodejs_replica02:3000::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-03-02 02:04:43.213+00');
INSERT INTO public.targets (id, created_at, upstream_id, target, weight, tags, ws_id, cache_key, updated_at) VALUES ('6590615b-bd71-492d-ab88-638f625a3295', '2024-03-02 02:04:53.557+00', 'ff9c3cc6-6f73-47ab-844e-fac40ee02c97', 'service_two_nodejs_replica03:3000', 100, '{service-two-nodejs}', '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'targets:ff9c3cc6-6f73-47ab-844e-fac40ee02c97:service_two_nodejs_replica03:3000::::75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', '2024-03-02 02:04:53.557+00');


--
-- Data for Name: upstreams; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.upstreams (id, created_at, name, hash_on, hash_fallback, hash_on_header, hash_fallback_header, hash_on_cookie, hash_on_cookie_path, slots, healthchecks, tags, algorithm, host_header, client_certificate_id, ws_id, hash_on_query_arg, hash_fallback_query_arg, hash_on_uri_capture, hash_fallback_uri_capture, use_srv_name, updated_at) VALUES ('be872ca3-e956-4b00-b26c-4bbf923d4a19', '2024-02-28 01:03:50+00', 'service-one-ruby-upstream', 'none', 'none', NULL, NULL, NULL, '/', 10000, '{"active": {"type": "http", "headers": null, "healthy": {"interval": 0, "successes": 0, "http_statuses": [200, 302]}, "timeout": 1, "http_path": "/", "https_sni": null, "unhealthy": {"interval": 0, "timeouts": 0, "tcp_failures": 0, "http_failures": 0, "http_statuses": [429, 404, 500, 501, 502, 503, 504, 505]}, "concurrency": 10, "https_verify_certificate": true}, "passive": {"type": "http", "healthy": {"successes": 0, "http_statuses": [200, 201, 202, 203, 204, 205, 206, 207, 208, 226, 300, 301, 302, 303, 304, 305, 306, 307, 308]}, "unhealthy": {"timeouts": 0, "tcp_failures": 0, "http_failures": 0, "http_statuses": [429, 500, 503]}}, "threshold": 0}', '{service-one-ruby}', 'round-robin', NULL, NULL, '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', NULL, NULL, NULL, NULL, false, '2024-02-28 01:03:50+00');
INSERT INTO public.upstreams (id, created_at, name, hash_on, hash_fallback, hash_on_header, hash_fallback_header, hash_on_cookie, hash_on_cookie_path, slots, healthchecks, tags, algorithm, host_header, client_certificate_id, ws_id, hash_on_query_arg, hash_fallback_query_arg, hash_on_uri_capture, hash_fallback_uri_capture, use_srv_name, updated_at) VALUES ('ff9c3cc6-6f73-47ab-844e-fac40ee02c97', '2024-03-02 02:04:11+00', 'service-two-nodejs-upstream', 'none', 'none', NULL, NULL, NULL, '/', 10000, '{"active": {"type": "http", "headers": null, "healthy": {"interval": 0, "successes": 0, "http_statuses": [200, 302]}, "timeout": 1, "http_path": "/", "https_sni": null, "unhealthy": {"interval": 0, "timeouts": 0, "tcp_failures": 0, "http_failures": 0, "http_statuses": [429, 404, 500, 501, 502, 503, 504, 505]}, "concurrency": 10, "https_verify_certificate": true}, "passive": {"type": "http", "healthy": {"successes": 0, "http_statuses": [200, 201, 202, 203, 204, 205, 206, 207, 208, 226, 300, 301, 302, 303, 304, 305, 306, 307, 308]}, "unhealthy": {"timeouts": 0, "tcp_failures": 0, "http_failures": 0, "http_statuses": [429, 500, 503]}}, "threshold": 0}', '{service-two-nodejs}', 'round-robin', NULL, NULL, '75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', NULL, NULL, NULL, NULL, false, '2024-03-02 02:04:11+00');


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: kongdbuser
--

INSERT INTO public.workspaces (id, name, comment, created_at, meta, config, updated_at) VALUES ('75ea5b5c-5799-42ab-b2b0-8bb9caa3a3a1', 'default', NULL, '2024-02-28 01:02:54+00', NULL, NULL, '2024-02-28 01:02:54+00');


--
-- Name: acls acls_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_cache_key_key UNIQUE (cache_key);


--
-- Name: acls acls_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: acls acls_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_pkey PRIMARY KEY (id);


--
-- Name: acme_storage acme_storage_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acme_storage
    ADD CONSTRAINT acme_storage_key_key UNIQUE (key);


--
-- Name: acme_storage acme_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acme_storage
    ADD CONSTRAINT acme_storage_pkey PRIMARY KEY (id);


--
-- Name: basicauth_credentials basicauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: basicauth_credentials basicauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: basicauth_credentials basicauth_credentials_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: ca_certificates ca_certificates_cert_digest_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.ca_certificates
    ADD CONSTRAINT ca_certificates_cert_digest_key UNIQUE (cert_digest);


--
-- Name: ca_certificates ca_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.ca_certificates
    ADD CONSTRAINT ca_certificates_pkey PRIMARY KEY (id);


--
-- Name: certificates certificates_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: cluster_events cluster_events_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.cluster_events
    ADD CONSTRAINT cluster_events_pkey PRIMARY KEY (id);


--
-- Name: clustering_data_planes clustering_data_planes_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.clustering_data_planes
    ADD CONSTRAINT clustering_data_planes_pkey PRIMARY KEY (id);


--
-- Name: consumers consumers_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: consumers consumers_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_pkey PRIMARY KEY (id);


--
-- Name: consumers consumers_ws_id_custom_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_custom_id_unique UNIQUE (ws_id, custom_id);


--
-- Name: consumers consumers_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: filter_chains filter_chains_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_cache_key_key UNIQUE (cache_key);


--
-- Name: filter_chains filter_chains_name_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_name_key UNIQUE (name);


--
-- Name: filter_chains filter_chains_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_pkey PRIMARY KEY (id);


--
-- Name: hmacauth_credentials hmacauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: hmacauth_credentials hmacauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: hmacauth_credentials hmacauth_credentials_ws_id_username_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_ws_id_username_unique UNIQUE (ws_id, username);


--
-- Name: jwt_secrets jwt_secrets_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: jwt_secrets jwt_secrets_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_pkey PRIMARY KEY (id);


--
-- Name: jwt_secrets jwt_secrets_ws_id_key_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_ws_id_key_unique UNIQUE (ws_id, key);


--
-- Name: key_sets key_sets_name_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.key_sets
    ADD CONSTRAINT key_sets_name_key UNIQUE (name);


--
-- Name: key_sets key_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.key_sets
    ADD CONSTRAINT key_sets_pkey PRIMARY KEY (id);


--
-- Name: keyauth_credentials keyauth_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: keyauth_credentials keyauth_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_pkey PRIMARY KEY (id);


--
-- Name: keyauth_credentials keyauth_credentials_ws_id_key_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_ws_id_key_unique UNIQUE (ws_id, key);


--
-- Name: keys keys_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_cache_key_key UNIQUE (cache_key);


--
-- Name: keys keys_kid_set_id_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_kid_set_id_key UNIQUE (kid, set_id);


--
-- Name: keys keys_name_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_name_key UNIQUE (name);


--
-- Name: keys keys_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_pkey PRIMARY KEY (id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (key);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_ws_id_code_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_ws_id_code_unique UNIQUE (ws_id, code);


--
-- Name: oauth2_credentials oauth2_credentials_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_credentials oauth2_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_pkey PRIMARY KEY (id);


--
-- Name: oauth2_credentials oauth2_credentials_ws_id_client_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_ws_id_client_id_unique UNIQUE (ws_id, client_id);


--
-- Name: oauth2_tokens oauth2_tokens_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: oauth2_tokens oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_access_token_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_access_token_unique UNIQUE (ws_id, access_token);


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_refresh_token_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_refresh_token_unique UNIQUE (ws_id, refresh_token);


--
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (key);


--
-- Name: plugins plugins_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_cache_key_key UNIQUE (cache_key);


--
-- Name: plugins plugins_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: plugins plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_pkey PRIMARY KEY (id);


--
-- Name: plugins plugins_ws_id_instance_name_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_ws_id_instance_name_unique UNIQUE (ws_id, instance_name);


--
-- Name: ratelimiting_metrics ratelimiting_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.ratelimiting_metrics
    ADD CONSTRAINT ratelimiting_metrics_pkey PRIMARY KEY (identifier, period, period_date, service_id, route_id);


--
-- Name: response_ratelimiting_metrics response_ratelimiting_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.response_ratelimiting_metrics
    ADD CONSTRAINT response_ratelimiting_metrics_pkey PRIMARY KEY (identifier, period, period_date, service_id, route_id);


--
-- Name: routes routes_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: routes routes_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: schema_meta schema_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.schema_meta
    ADD CONSTRAINT schema_meta_pkey PRIMARY KEY (key, subsystem);


--
-- Name: services services_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services services_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_session_id_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);


--
-- Name: sm_vaults sm_vaults_id_ws_id_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sm_vaults
    ADD CONSTRAINT sm_vaults_id_ws_id_key UNIQUE (id, ws_id);


--
-- Name: sm_vaults sm_vaults_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sm_vaults
    ADD CONSTRAINT sm_vaults_pkey PRIMARY KEY (id);


--
-- Name: sm_vaults sm_vaults_prefix_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sm_vaults
    ADD CONSTRAINT sm_vaults_prefix_key UNIQUE (prefix);


--
-- Name: sm_vaults sm_vaults_prefix_ws_id_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sm_vaults
    ADD CONSTRAINT sm_vaults_prefix_ws_id_key UNIQUE (prefix, ws_id);


--
-- Name: snis snis_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: snis snis_name_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_name_key UNIQUE (name);


--
-- Name: snis snis_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (entity_id);


--
-- Name: targets targets_cache_key_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_cache_key_key UNIQUE (cache_key);


--
-- Name: targets targets_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: targets targets_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_pkey PRIMARY KEY (id);


--
-- Name: upstreams upstreams_id_ws_id_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_id_ws_id_unique UNIQUE (id, ws_id);


--
-- Name: upstreams upstreams_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_pkey PRIMARY KEY (id);


--
-- Name: upstreams upstreams_ws_id_name_unique; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_ws_id_name_unique UNIQUE (ws_id, name);


--
-- Name: workspaces workspaces_name_key; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_name_key UNIQUE (name);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: acls_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX acls_consumer_id_idx ON public.acls USING btree (consumer_id);


--
-- Name: acls_group_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX acls_group_idx ON public.acls USING btree ("group");


--
-- Name: acls_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX acls_tags_idex_tags_idx ON public.acls USING gin (tags);


--
-- Name: acme_storage_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX acme_storage_ttl_idx ON public.acme_storage USING btree (ttl);


--
-- Name: basicauth_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX basicauth_consumer_id_idx ON public.basicauth_credentials USING btree (consumer_id);


--
-- Name: basicauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX basicauth_tags_idex_tags_idx ON public.basicauth_credentials USING gin (tags);


--
-- Name: certificates_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX certificates_tags_idx ON public.certificates USING gin (tags);


--
-- Name: cluster_events_at_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX cluster_events_at_idx ON public.cluster_events USING btree (at);


--
-- Name: cluster_events_channel_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX cluster_events_channel_idx ON public.cluster_events USING btree (channel);


--
-- Name: cluster_events_expire_at_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX cluster_events_expire_at_idx ON public.cluster_events USING btree (expire_at);


--
-- Name: clustering_data_planes_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX clustering_data_planes_ttl_idx ON public.clustering_data_planes USING btree (ttl);


--
-- Name: consumers_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX consumers_tags_idx ON public.consumers USING gin (tags);


--
-- Name: consumers_username_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX consumers_username_idx ON public.consumers USING btree (lower(username));


--
-- Name: filter_chains_cache_key_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE UNIQUE INDEX filter_chains_cache_key_idx ON public.filter_chains USING btree (cache_key);


--
-- Name: filter_chains_name_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE UNIQUE INDEX filter_chains_name_idx ON public.filter_chains USING btree (name);


--
-- Name: filter_chains_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX filter_chains_tags_idx ON public.filter_chains USING gin (tags);


--
-- Name: hmacauth_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX hmacauth_credentials_consumer_id_idx ON public.hmacauth_credentials USING btree (consumer_id);


--
-- Name: hmacauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX hmacauth_tags_idex_tags_idx ON public.hmacauth_credentials USING gin (tags);


--
-- Name: jwt_secrets_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX jwt_secrets_consumer_id_idx ON public.jwt_secrets USING btree (consumer_id);


--
-- Name: jwt_secrets_secret_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX jwt_secrets_secret_idx ON public.jwt_secrets USING btree (secret);


--
-- Name: jwtsecrets_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX jwtsecrets_tags_idex_tags_idx ON public.jwt_secrets USING gin (tags);


--
-- Name: key_sets_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX key_sets_tags_idx ON public.key_sets USING gin (tags);


--
-- Name: keyauth_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX keyauth_credentials_consumer_id_idx ON public.keyauth_credentials USING btree (consumer_id);


--
-- Name: keyauth_credentials_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX keyauth_credentials_ttl_idx ON public.keyauth_credentials USING btree (ttl);


--
-- Name: keyauth_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX keyauth_tags_idex_tags_idx ON public.keyauth_credentials USING gin (tags);


--
-- Name: keys_fkey_key_sets; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX keys_fkey_key_sets ON public.keys USING btree (set_id);


--
-- Name: keys_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX keys_tags_idx ON public.keys USING gin (tags);


--
-- Name: locks_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX locks_ttl_idx ON public.locks USING btree (ttl);


--
-- Name: oauth2_authorization_codes_authenticated_userid_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_authorization_codes_authenticated_userid_idx ON public.oauth2_authorization_codes USING btree (authenticated_userid);


--
-- Name: oauth2_authorization_codes_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_authorization_codes_ttl_idx ON public.oauth2_authorization_codes USING btree (ttl);


--
-- Name: oauth2_authorization_credential_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_authorization_credential_id_idx ON public.oauth2_authorization_codes USING btree (credential_id);


--
-- Name: oauth2_authorization_service_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_authorization_service_id_idx ON public.oauth2_authorization_codes USING btree (service_id);


--
-- Name: oauth2_credentials_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_credentials_consumer_id_idx ON public.oauth2_credentials USING btree (consumer_id);


--
-- Name: oauth2_credentials_secret_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_credentials_secret_idx ON public.oauth2_credentials USING btree (client_secret);


--
-- Name: oauth2_credentials_tags_idex_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_credentials_tags_idex_tags_idx ON public.oauth2_credentials USING gin (tags);


--
-- Name: oauth2_tokens_authenticated_userid_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_tokens_authenticated_userid_idx ON public.oauth2_tokens USING btree (authenticated_userid);


--
-- Name: oauth2_tokens_credential_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_tokens_credential_id_idx ON public.oauth2_tokens USING btree (credential_id);


--
-- Name: oauth2_tokens_service_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_tokens_service_id_idx ON public.oauth2_tokens USING btree (service_id);


--
-- Name: oauth2_tokens_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX oauth2_tokens_ttl_idx ON public.oauth2_tokens USING btree (ttl);


--
-- Name: plugins_consumer_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX plugins_consumer_id_idx ON public.plugins USING btree (consumer_id);


--
-- Name: plugins_name_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX plugins_name_idx ON public.plugins USING btree (name);


--
-- Name: plugins_route_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX plugins_route_id_idx ON public.plugins USING btree (route_id);


--
-- Name: plugins_service_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX plugins_service_id_idx ON public.plugins USING btree (service_id);


--
-- Name: plugins_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX plugins_tags_idx ON public.plugins USING gin (tags);


--
-- Name: ratelimiting_metrics_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX ratelimiting_metrics_idx ON public.ratelimiting_metrics USING btree (service_id, route_id, period_date, period);


--
-- Name: ratelimiting_metrics_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX ratelimiting_metrics_ttl_idx ON public.ratelimiting_metrics USING btree (ttl);


--
-- Name: routes_service_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX routes_service_id_idx ON public.routes USING btree (service_id);


--
-- Name: routes_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX routes_tags_idx ON public.routes USING gin (tags);


--
-- Name: services_fkey_client_certificate; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX services_fkey_client_certificate ON public.services USING btree (client_certificate_id);


--
-- Name: services_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX services_tags_idx ON public.services USING gin (tags);


--
-- Name: session_sessions_expires_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX session_sessions_expires_idx ON public.sessions USING btree (expires);


--
-- Name: sessions_ttl_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX sessions_ttl_idx ON public.sessions USING btree (ttl);


--
-- Name: sm_vaults_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX sm_vaults_tags_idx ON public.sm_vaults USING gin (tags);


--
-- Name: snis_certificate_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX snis_certificate_id_idx ON public.snis USING btree (certificate_id);


--
-- Name: snis_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX snis_tags_idx ON public.snis USING gin (tags);


--
-- Name: tags_entity_name_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX tags_entity_name_idx ON public.tags USING btree (entity_name);


--
-- Name: tags_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX tags_tags_idx ON public.tags USING gin (tags);


--
-- Name: targets_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX targets_tags_idx ON public.targets USING gin (tags);


--
-- Name: targets_target_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX targets_target_idx ON public.targets USING btree (target);


--
-- Name: targets_upstream_id_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX targets_upstream_id_idx ON public.targets USING btree (upstream_id);


--
-- Name: upstreams_fkey_client_certificate; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX upstreams_fkey_client_certificate ON public.upstreams USING btree (client_certificate_id);


--
-- Name: upstreams_tags_idx; Type: INDEX; Schema: public; Owner: kongdbuser
--

CREATE INDEX upstreams_tags_idx ON public.upstreams USING gin (tags);


--
-- Name: acls acls_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER acls_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.acls FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: acme_storage acme_storage_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER acme_storage_ttl_trigger AFTER INSERT ON public.acme_storage FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: basicauth_credentials basicauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER basicauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.basicauth_credentials FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: ca_certificates ca_certificates_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER ca_certificates_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.ca_certificates FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: certificates certificates_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER certificates_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.certificates FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: cluster_events cluster_events_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER cluster_events_ttl_trigger AFTER INSERT ON public.cluster_events FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('expire_at');


--
-- Name: clustering_data_planes clustering_data_planes_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER clustering_data_planes_ttl_trigger AFTER INSERT ON public.clustering_data_planes FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: consumers consumers_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER consumers_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.consumers FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: filter_chains filter_chains_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER filter_chains_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.filter_chains FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: hmacauth_credentials hmacauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER hmacauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.hmacauth_credentials FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: jwt_secrets jwtsecrets_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER jwtsecrets_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.jwt_secrets FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: key_sets key_sets_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER key_sets_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.key_sets FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: keyauth_credentials keyauth_credentials_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER keyauth_credentials_ttl_trigger AFTER INSERT ON public.keyauth_credentials FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: keyauth_credentials keyauth_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER keyauth_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.keyauth_credentials FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: keys keys_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER keys_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.keys FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER oauth2_authorization_codes_ttl_trigger AFTER INSERT ON public.oauth2_authorization_codes FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: oauth2_credentials oauth2_credentials_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER oauth2_credentials_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.oauth2_credentials FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: oauth2_tokens oauth2_tokens_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER oauth2_tokens_ttl_trigger AFTER INSERT ON public.oauth2_tokens FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: plugins plugins_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER plugins_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.plugins FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: ratelimiting_metrics ratelimiting_metrics_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER ratelimiting_metrics_ttl_trigger AFTER INSERT ON public.ratelimiting_metrics FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: routes routes_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER routes_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.routes FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: services services_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER services_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.services FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: sessions sessions_ttl_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER sessions_ttl_trigger AFTER INSERT ON public.sessions FOR EACH STATEMENT EXECUTE PROCEDURE public.batch_delete_expired_rows('ttl');


--
-- Name: sm_vaults sm_vaults_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER sm_vaults_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.sm_vaults FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: snis snis_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER snis_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.snis FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: targets targets_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER targets_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.targets FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: upstreams upstreams_sync_tags_trigger; Type: TRIGGER; Schema: public; Owner: kongdbuser
--

CREATE TRIGGER upstreams_sync_tags_trigger AFTER INSERT OR DELETE OR UPDATE OF tags ON public.upstreams FOR EACH ROW EXECUTE PROCEDURE public.sync_tags();


--
-- Name: acls acls_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: acls acls_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.acls
    ADD CONSTRAINT acls_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: basicauth_credentials basicauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: basicauth_credentials basicauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.basicauth_credentials
    ADD CONSTRAINT basicauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: certificates certificates_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: consumers consumers_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.consumers
    ADD CONSTRAINT consumers_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: filter_chains filter_chains_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(id) ON DELETE CASCADE;


--
-- Name: filter_chains filter_chains_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: filter_chains filter_chains_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.filter_chains
    ADD CONSTRAINT filter_chains_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id) ON DELETE CASCADE;


--
-- Name: hmacauth_credentials hmacauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: hmacauth_credentials hmacauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.hmacauth_credentials
    ADD CONSTRAINT hmacauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: jwt_secrets jwt_secrets_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: jwt_secrets jwt_secrets_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.jwt_secrets
    ADD CONSTRAINT jwt_secrets_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: key_sets key_sets_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.key_sets
    ADD CONSTRAINT key_sets_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: keyauth_credentials keyauth_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: keyauth_credentials keyauth_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keyauth_credentials
    ADD CONSTRAINT keyauth_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: keys keys_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.key_sets(id) ON DELETE CASCADE;


--
-- Name: keys keys_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.keys
    ADD CONSTRAINT keys_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_credential_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_credential_id_fkey FOREIGN KEY (credential_id, ws_id) REFERENCES public.oauth2_credentials(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_plugin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_plugin_id_fkey FOREIGN KEY (plugin_id) REFERENCES public.plugins(id) ON DELETE CASCADE;


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_authorization_codes oauth2_authorization_codes_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_authorization_codes
    ADD CONSTRAINT oauth2_authorization_codes_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_credentials oauth2_credentials_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_credentials oauth2_credentials_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_credentials
    ADD CONSTRAINT oauth2_credentials_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: oauth2_tokens oauth2_tokens_credential_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_credential_id_fkey FOREIGN KEY (credential_id, ws_id) REFERENCES public.oauth2_credentials(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_tokens oauth2_tokens_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: oauth2_tokens oauth2_tokens_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: plugins plugins_consumer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_consumer_id_fkey FOREIGN KEY (consumer_id, ws_id) REFERENCES public.consumers(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_route_id_fkey FOREIGN KEY (route_id, ws_id) REFERENCES public.routes(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id) ON DELETE CASCADE;


--
-- Name: plugins plugins_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.plugins
    ADD CONSTRAINT plugins_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: routes routes_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_service_id_fkey FOREIGN KEY (service_id, ws_id) REFERENCES public.services(id, ws_id);


--
-- Name: routes routes_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: services services_client_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_client_certificate_id_fkey FOREIGN KEY (client_certificate_id, ws_id) REFERENCES public.certificates(id, ws_id);


--
-- Name: services services_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: sm_vaults sm_vaults_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.sm_vaults
    ADD CONSTRAINT sm_vaults_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: snis snis_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_certificate_id_fkey FOREIGN KEY (certificate_id, ws_id) REFERENCES public.certificates(id, ws_id);


--
-- Name: snis snis_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.snis
    ADD CONSTRAINT snis_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: targets targets_upstream_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_upstream_id_fkey FOREIGN KEY (upstream_id, ws_id) REFERENCES public.upstreams(id, ws_id) ON DELETE CASCADE;


--
-- Name: targets targets_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.targets
    ADD CONSTRAINT targets_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- Name: upstreams upstreams_client_certificate_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_client_certificate_id_fkey FOREIGN KEY (client_certificate_id) REFERENCES public.certificates(id);


--
-- Name: upstreams upstreams_ws_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kongdbuser
--

ALTER TABLE ONLY public.upstreams
    ADD CONSTRAINT upstreams_ws_id_fkey FOREIGN KEY (ws_id) REFERENCES public.workspaces(id);


--
-- PostgreSQL database dump complete
--

