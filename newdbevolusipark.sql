--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.0

-- Started on 2025-07-30 13:28:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 713340)
-- Name: public; Type: SCHEMA; Schema: -; Owner: evolusipark_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO evolusipark_owner;

--
-- TOC entry 910 (class 1247 OID 713342)
-- Name: enum_aktivitas_gerbang_kendaraans_buka_atau_tutup; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_buka_atau_tutup AS ENUM (
    'Buka',
    'Tutup',
    'Terbuka',
    'Tertutup'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_buka_atau_tutup OWNER TO evolusipark_owner;

--
-- TOC entry 1018 (class 1247 OID 1261569)
-- Name: enum_aktivitas_gerbang_kendaraans_lokasi_gerbang; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_lokasi_gerbang AS ENUM (
    'Masuk',
    'Keluar'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_lokasi_gerbang OWNER TO evolusipark_owner;

--
-- TOC entry 913 (class 1247 OID 713348)
-- Name: enum_aktivitas_gerbang_kendaraans_status_palang; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_status_palang AS ENUM (
    'Sukses',
    'Gagal',
    'Gagal (Sensor)'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_status_palang OWNER TO evolusipark_owner;

--
-- TOC entry 1047 (class 1247 OID 1351681)
-- Name: enum_aktivitas_gerbang_kendaraans_tipe_gerbang; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_tipe_gerbang AS ENUM (
    'In',
    'Out'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_tipe_gerbang OWNER TO evolusipark_owner;

--
-- TOC entry 1030 (class 1247 OID 811418)
-- Name: enum_dashboard_pendapatans_periode; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_dashboard_pendapatans_periode AS ENUM (
    'hari_ini',
    'minggu_ini',
    'bulan_ini',
    'tahun_ini'
);


ALTER TYPE public.enum_dashboard_pendapatans_periode OWNER TO evolusipark_owner;

--
-- TOC entry 925 (class 1247 OID 713382)
-- Name: enum_data_vouchers_model_bayar; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_data_vouchers_model_bayar AS ENUM (
    'Check In',
    'Check Out'
);


ALTER TYPE public.enum_data_vouchers_model_bayar OWNER TO evolusipark_owner;

--
-- TOC entry 928 (class 1247 OID 713388)
-- Name: enum_data_vouchers_verifikasi; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_data_vouchers_verifikasi AS ENUM (
    'Tiket',
    'Nopol'
);


ALTER TYPE public.enum_data_vouchers_verifikasi OWNER TO evolusipark_owner;

--
-- TOC entry 952 (class 1247 OID 713460)
-- Name: enum_permasalahan_atau_perbaikans_kategori_permasalahan; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_kategori_permasalahan AS ENUM (
    'Hardware/Alat',
    'Sistem',
    'SDM',
    'Operasional',
    'Lain-lain'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_kategori_permasalahan OWNER TO evolusipark_owner;

--
-- TOC entry 958 (class 1247 OID 713480)
-- Name: enum_permasalahan_atau_perbaikans_status_perbaikan; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_status_perbaikan AS ENUM (
    'Pending',
    'On Progress',
    'Done'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_status_perbaikan OWNER TO evolusipark_owner;

--
-- TOC entry 955 (class 1247 OID 713472)
-- Name: enum_permasalahan_atau_perbaikans_status_permasalahan; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_status_permasalahan AS ENUM (
    'Pending',
    'On Progress',
    'Done'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_status_permasalahan OWNER TO evolusipark_owner;

--
-- TOC entry 964 (class 1247 OID 713497)
-- Name: enum_perusahaans_jenis_perusahaan; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_perusahaans_jenis_perusahaan AS ENUM (
    'Pemilik Gedung',
    'Tenant',
    'Developer'
);


ALTER TYPE public.enum_perusahaans_jenis_perusahaan OWNER TO evolusipark_owner;

--
-- TOC entry 973 (class 1247 OID 713518)
-- Name: enum_pos_tipe_kendaraan; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_pos_tipe_kendaraan AS ENUM (
    'Mobil',
    'Motor',
    'All'
);


ALTER TYPE public.enum_pos_tipe_kendaraan OWNER TO evolusipark_owner;

--
-- TOC entry 970 (class 1247 OID 713513)
-- Name: enum_pos_tipe_pos; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_pos_tipe_pos AS ENUM (
    'In',
    'Out'
);


ALTER TYPE public.enum_pos_tipe_pos OWNER TO evolusipark_owner;

--
-- TOC entry 985 (class 1247 OID 713550)
-- Name: enum_produk_vouchers_metode_verifikasi; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_produk_vouchers_metode_verifikasi AS ENUM (
    'Tiket',
    'Nopol'
);


ALTER TYPE public.enum_produk_vouchers_metode_verifikasi OWNER TO evolusipark_owner;

--
-- TOC entry 982 (class 1247 OID 713544)
-- Name: enum_produk_vouchers_model_pembayaran; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_produk_vouchers_model_pembayaran AS ENUM (
    'Check In',
    'Check Out'
);


ALTER TYPE public.enum_produk_vouchers_model_pembayaran OWNER TO evolusipark_owner;

--
-- TOC entry 1015 (class 1247 OID 713652)
-- Name: enum_users_jenis_kelamin; Type: TYPE; Schema: public; Owner: evolusipark_owner
--

CREATE TYPE public.enum_users_jenis_kelamin AS ENUM (
    'Laki-laki',
    'Perempuan'
);


ALTER TYPE public.enum_users_jenis_kelamin OWNER TO evolusipark_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 1745742)
-- Name: aktivitas_gerbang_kendaraans; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.aktivitas_gerbang_kendaraans (
    id integer NOT NULL,
    tiket character varying(255),
    plat_nomor character varying(255),
    kendaraan_id integer,
    waktu time without time zone,
    lokasi_gerbang public.enum_aktivitas_gerbang_kendaraans_lokasi_gerbang,
    buka_atau_tutup public.enum_aktivitas_gerbang_kendaraans_buka_atau_tutup,
    petugas_id integer,
    status_palang public.enum_aktivitas_gerbang_kendaraans_status_palang,
    tipe_gerbang public.enum_aktivitas_gerbang_kendaraans_tipe_gerbang,
    data_member_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.aktivitas_gerbang_kendaraans OWNER TO evolusipark_owner;

--
-- TOC entry 218 (class 1259 OID 1745741)
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 218
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq OWNED BY public.aktivitas_gerbang_kendaraans.id;


--
-- TOC entry 271 (class 1259 OID 1745991)
-- Name: data_members; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.data_members (
    id integer NOT NULL,
    nama character varying(255),
    no_hp character varying(255),
    perusahaan_id integer,
    akses_tiket boolean,
    akses_kartu boolean,
    no_kartu character varying(255),
    tgl_input timestamp with time zone,
    produk_id integer,
    tarif integer NOT NULL,
    biaya_member integer NOT NULL,
    biaya_kartu integer NOT NULL,
    periode daterange,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.data_members OWNER TO evolusipark_owner;

--
-- TOC entry 270 (class 1259 OID 1745990)
-- Name: data_members_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.data_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_members_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 270
-- Name: data_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.data_members_id_seq OWNED BY public.data_members.id;


--
-- TOC entry 221 (class 1259 OID 1745760)
-- Name: data_nomor_polisis; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.data_nomor_polisis (
    id integer NOT NULL,
    data_member_id integer,
    kendaraan_id integer,
    nomor_polisi character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.data_nomor_polisis OWNER TO evolusipark_owner;

--
-- TOC entry 220 (class 1259 OID 1745759)
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.data_nomor_polisis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_nomor_polisis_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 220
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.data_nomor_polisis_id_seq OWNED BY public.data_nomor_polisis.id;


--
-- TOC entry 223 (class 1259 OID 1745769)
-- Name: data_vouchers; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.data_vouchers (
    id integer NOT NULL,
    produk_voucher_id integer,
    periode daterange,
    diskon integer NOT NULL,
    model_bayar public.enum_data_vouchers_model_bayar,
    verifikasi public.enum_data_vouchers_verifikasi,
    no_tiket character varying(255),
    nomor_polisi character varying(255),
    kendaraan_id integer,
    keterangan character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.data_vouchers OWNER TO evolusipark_owner;

--
-- TOC entry 222 (class 1259 OID 1745768)
-- Name: data_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.data_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_vouchers_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 222
-- Name: data_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.data_vouchers_id_seq OWNED BY public.data_vouchers.id;


--
-- TOC entry 225 (class 1259 OID 1745778)
-- Name: global_settings; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.global_settings (
    id integer NOT NULL,
    nama_operator character varying(255),
    email_operator character varying(255),
    no_telp_operator character varying(255),
    no_fax_operator character varying(255),
    alamat_operator character varying(255),
    nama_lokasi character varying(255),
    email_lokasi character varying(255),
    no_telp_lokasi character varying(255),
    no_fax_lokasi character varying(255),
    alamat_lokasi character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.global_settings OWNER TO evolusipark_owner;

--
-- TOC entry 224 (class 1259 OID 1745777)
-- Name: global_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.global_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.global_settings_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 224
-- Name: global_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.global_settings_id_seq OWNED BY public.global_settings.id;


--
-- TOC entry 227 (class 1259 OID 1745787)
-- Name: kendaraans; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.kendaraans (
    id integer NOT NULL,
    nama_kendaraan character varying(255),
    tipe_kendaraan_id integer,
    status boolean,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.kendaraans OWNER TO evolusipark_owner;

--
-- TOC entry 226 (class 1259 OID 1745786)
-- Name: kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kendaraans_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 226
-- Name: kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.kendaraans_id_seq OWNED BY public.kendaraans.id;


--
-- TOC entry 229 (class 1259 OID 1745794)
-- Name: laporan_riwayat_transaksi_members; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.laporan_riwayat_transaksi_members (
    id integer NOT NULL,
    no integer,
    nomor_tiket character varying(255),
    waktu_masuk timestamp with time zone,
    gerbang_masuk_id integer,
    jenis_kendaraan_id integer,
    nomor_polisi character varying(255),
    waktu_keluar character varying(255),
    pintu_keluar_id integer,
    durasi_parkir character varying(255),
    denda character varying(255),
    total_pembayaran character varying(255),
    jenis_transaksi character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.laporan_riwayat_transaksi_members OWNER TO evolusipark_owner;

--
-- TOC entry 228 (class 1259 OID 1745793)
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.laporan_riwayat_transaksi_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laporan_riwayat_transaksi_members_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 228
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.laporan_riwayat_transaksi_members_id_seq OWNED BY public.laporan_riwayat_transaksi_members.id;


--
-- TOC entry 231 (class 1259 OID 1745803)
-- Name: laporan_transaksi_batals; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.laporan_transaksi_batals (
    id integer NOT NULL,
    no_tiket character varying(255),
    tanggal_masuk timestamp with time zone,
    pintu_masuk_id integer,
    tanggal_pembatalan timestamp with time zone,
    alasan_pembatalan character varying(255),
    penjelasan_pembatalan character varying(255),
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.laporan_transaksi_batals OWNER TO evolusipark_owner;

--
-- TOC entry 230 (class 1259 OID 1745802)
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.laporan_transaksi_batals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laporan_transaksi_batals_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 230
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.laporan_transaksi_batals_id_seq OWNED BY public.laporan_transaksi_batals.id;


--
-- TOC entry 233 (class 1259 OID 1745812)
-- Name: level_penggunas; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.level_penggunas (
    id integer NOT NULL,
    nama character varying(255),
    hak_akses jsonb,
    perusahaan_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.level_penggunas OWNER TO evolusipark_owner;

--
-- TOC entry 232 (class 1259 OID 1745811)
-- Name: level_penggunas_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.level_penggunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.level_penggunas_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 232
-- Name: level_penggunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.level_penggunas_id_seq OWNED BY public.level_penggunas.id;


--
-- TOC entry 235 (class 1259 OID 1745823)
-- Name: nama_interfaces; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.nama_interfaces (
    id integer NOT NULL,
    nama_interface character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.nama_interfaces OWNER TO evolusipark_owner;

--
-- TOC entry 234 (class 1259 OID 1745822)
-- Name: nama_interfaces_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.nama_interfaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nama_interfaces_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 234
-- Name: nama_interfaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.nama_interfaces_id_seq OWNED BY public.nama_interfaces.id;


--
-- TOC entry 237 (class 1259 OID 1745830)
-- Name: nama_printers; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.nama_printers (
    id integer NOT NULL,
    nama_printer character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.nama_printers OWNER TO evolusipark_owner;

--
-- TOC entry 236 (class 1259 OID 1745829)
-- Name: nama_printers_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.nama_printers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nama_printers_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 236
-- Name: nama_printers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.nama_printers_id_seq OWNED BY public.nama_printers.id;


--
-- TOC entry 239 (class 1259 OID 1745837)
-- Name: parameters; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    nama character varying(255),
    nilai character varying(255),
    keterangan character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.parameters OWNER TO evolusipark_owner;

--
-- TOC entry 238 (class 1259 OID 1745836)
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parameters_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 238
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- TOC entry 241 (class 1259 OID 1745846)
-- Name: payments; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    jenis_payment character varying(255),
    status boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO evolusipark_owner;

--
-- TOC entry 240 (class 1259 OID 1745845)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 240
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 243 (class 1259 OID 1745853)
-- Name: permasalahan_atau_perbaikans; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.permasalahan_atau_perbaikans (
    id integer NOT NULL,
    judul_permasalahan character varying(255),
    tanggal_permasalahan character varying(255),
    kategori_permasalahan public.enum_permasalahan_atau_perbaikans_kategori_permasalahan,
    pos_id integer,
    hardware_atau_alat character varying(255),
    penyebab_permasalahan text,
    keterangan_permasalahan text,
    nama_pelapor character varying(255),
    status_permasalahan public.enum_permasalahan_atau_perbaikans_status_permasalahan,
    tanggal_perbaikan character varying(255),
    jenis_perbaikan character varying(255),
    status_perbaikan public.enum_permasalahan_atau_perbaikans_status_perbaikan,
    penanganan text,
    keterangan_penanganan text,
    nama_yang_menangani character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.permasalahan_atau_perbaikans OWNER TO evolusipark_owner;

--
-- TOC entry 242 (class 1259 OID 1745852)
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.permasalahan_atau_perbaikans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permasalahan_atau_perbaikans_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 242
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.permasalahan_atau_perbaikans_id_seq OWNED BY public.permasalahan_atau_perbaikans.id;


--
-- TOC entry 245 (class 1259 OID 1745862)
-- Name: perusahaans; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.perusahaans (
    id integer NOT NULL,
    nama character varying(255),
    jenis_perusahaan public.enum_perusahaans_jenis_perusahaan,
    kontak character varying(255),
    status boolean,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.perusahaans OWNER TO evolusipark_owner;

--
-- TOC entry 244 (class 1259 OID 1745861)
-- Name: perusahaans_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.perusahaans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perusahaans_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 244
-- Name: perusahaans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.perusahaans_id_seq OWNED BY public.perusahaans.id;


--
-- TOC entry 273 (class 1259 OID 1746000)
-- Name: pos; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.pos (
    id integer NOT NULL,
    kode character varying(255),
    keterangan character varying(255),
    tipe_pos public.enum_pos_tipe_pos,
    tipe_manless_id integer,
    tipe_kendaraan public.enum_pos_tipe_kendaraan,
    kamera_1 boolean,
    kamera_2 boolean,
    nama_printer_id integer,
    nama_interface_id integer,
    com_port character varying(255),
    otorisasi boolean,
    synchronize character varying(255),
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.pos OWNER TO evolusipark_owner;

--
-- TOC entry 272 (class 1259 OID 1745999)
-- Name: pos_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.pos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pos_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 272
-- Name: pos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.pos_id_seq OWNED BY public.pos.id;


--
-- TOC entry 247 (class 1259 OID 1745880)
-- Name: produk_members; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.produk_members (
    id integer NOT NULL,
    nama character varying(255),
    periode daterange,
    list_id_kendaraan character varying(255)[],
    max_kendaraan integer,
    tarif integer NOT NULL,
    biaya_kartu integer NOT NULL,
    biaya_ganti_nopol integer NOT NULL,
    status boolean,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.produk_members OWNER TO evolusipark_owner;

--
-- TOC entry 246 (class 1259 OID 1745879)
-- Name: produk_members_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.produk_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produk_members_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 246
-- Name: produk_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.produk_members_id_seq OWNED BY public.produk_members.id;


--
-- TOC entry 249 (class 1259 OID 1745889)
-- Name: produk_vouchers; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.produk_vouchers (
    id integer NOT NULL,
    nama character varying(255),
    periode daterange,
    list_id_kendaraan character varying(255)[],
    diskon integer NOT NULL,
    model_pembayaran public.enum_produk_vouchers_model_pembayaran,
    metode_verifikasi public.enum_produk_vouchers_metode_verifikasi,
    status boolean,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.produk_vouchers OWNER TO evolusipark_owner;

--
-- TOC entry 248 (class 1259 OID 1745888)
-- Name: produk_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.produk_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produk_vouchers_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 248
-- Name: produk_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.produk_vouchers_id_seq OWNED BY public.produk_vouchers.id;


--
-- TOC entry 251 (class 1259 OID 1745898)
-- Name: riwayat_transaksi_ganti_nopols; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.riwayat_transaksi_ganti_nopols (
    id integer NOT NULL,
    tgl_transaksi timestamp with time zone,
    nomor_polisi_lama character varying(255),
    nomor_polisi_baru character varying(255),
    tarif integer NOT NULL,
    keterangan character varying(255),
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.riwayat_transaksi_ganti_nopols OWNER TO evolusipark_owner;

--
-- TOC entry 250 (class 1259 OID 1745897)
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 250
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq OWNED BY public.riwayat_transaksi_ganti_nopols.id;


--
-- TOC entry 253 (class 1259 OID 1745907)
-- Name: riwayat_transaksi_kartu_members; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.riwayat_transaksi_kartu_members (
    id integer NOT NULL,
    tgl_transaksi timestamp with time zone,
    no_kartu character varying(255),
    tarif integer NOT NULL,
    keterangan character varying(255),
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.riwayat_transaksi_kartu_members OWNER TO evolusipark_owner;

--
-- TOC entry 252 (class 1259 OID 1745906)
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.riwayat_transaksi_kartu_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwayat_transaksi_kartu_members_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 252
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.riwayat_transaksi_kartu_members_id_seq OWNED BY public.riwayat_transaksi_kartu_members.id;


--
-- TOC entry 255 (class 1259 OID 1745916)
-- Name: shifts; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.shifts (
    id integer NOT NULL,
    nama_shift character varying(255),
    awal_shift time without time zone,
    akhir_shift time without time zone,
    status boolean,
    user_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.shifts OWNER TO evolusipark_owner;

--
-- TOC entry 254 (class 1259 OID 1745915)
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.shifts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shifts_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 254
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.shifts_id_seq OWNED BY public.shifts.id;


--
-- TOC entry 257 (class 1259 OID 1745923)
-- Name: tarif_dendas; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.tarif_dendas (
    id integer NOT NULL,
    kendaraan_id integer NOT NULL,
    denda_tiket integer NOT NULL,
    denda_stnk integer NOT NULL,
    denda_member boolean,
    status boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tarif_dendas OWNER TO evolusipark_owner;

--
-- TOC entry 256 (class 1259 OID 1745922)
-- Name: tarif_dendas_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.tarif_dendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarif_dendas_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 256
-- Name: tarif_dendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.tarif_dendas_id_seq OWNED BY public.tarif_dendas.id;


--
-- TOC entry 259 (class 1259 OID 1745930)
-- Name: tarif_parkirs; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.tarif_parkirs (
    id integer NOT NULL,
    kendaraan_id integer,
    grace_period integer,
    tarif_grace_period integer,
    rotasi_pertama integer,
    tarif_rotasi_pertama integer,
    rotasi_kedua integer,
    tarif_rotasi_kedua integer,
    rotasi_ketiga integer,
    tarif_rotasi_ketiga integer,
    tarif_maksimal integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tarif_parkirs OWNER TO evolusipark_owner;

--
-- TOC entry 258 (class 1259 OID 1745929)
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.tarif_parkirs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarif_parkirs_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 258
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.tarif_parkirs_id_seq OWNED BY public.tarif_parkirs.id;


--
-- TOC entry 261 (class 1259 OID 1745937)
-- Name: tipe_dendas; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.tipe_dendas (
    id integer NOT NULL,
    tipe_denda character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_dendas OWNER TO evolusipark_owner;

--
-- TOC entry 260 (class 1259 OID 1745936)
-- Name: tipe_dendas_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.tipe_dendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_dendas_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 260
-- Name: tipe_dendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.tipe_dendas_id_seq OWNED BY public.tipe_dendas.id;


--
-- TOC entry 263 (class 1259 OID 1745944)
-- Name: tipe_kendaraans; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.tipe_kendaraans (
    id integer NOT NULL,
    tipe_kendaraan character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_kendaraans OWNER TO evolusipark_owner;

--
-- TOC entry 262 (class 1259 OID 1745943)
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.tipe_kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_kendaraans_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.tipe_kendaraans_id_seq OWNED BY public.tipe_kendaraans.id;


--
-- TOC entry 265 (class 1259 OID 1745951)
-- Name: tipe_manlesses; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.tipe_manlesses (
    id integer NOT NULL,
    tipe_manless character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_manlesses OWNER TO evolusipark_owner;

--
-- TOC entry 264 (class 1259 OID 1745950)
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.tipe_manlesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_manlesses_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 264
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.tipe_manlesses_id_seq OWNED BY public.tipe_manlesses.id;


--
-- TOC entry 267 (class 1259 OID 1745958)
-- Name: transaksis; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.transaksis (
    id integer NOT NULL,
    tanggal_masuk timestamp with time zone,
    pintu_masuk_id integer,
    no_tiket character varying(255),
    is_manual boolean,
    kendaraan_id integer,
    nomor_polisi character varying(255),
    pintu_keluar_id integer,
    tanggal_keluar timestamp with time zone,
    petugas_id integer,
    shift_id integer,
    denda boolean,
    tipe_denda_id integer,
    is_active boolean,
    jenis_pembayaran_id integer,
    biaya_parkir character varying(255),
    id_data_voucher integer,
    jumlah_denda_stnk integer NOT NULL,
    jumlah_denda_tiket integer NOT NULL,
    "interval" character varying(255),
    keterangan_atau_penjelasan character varying(255),
    id_data_member integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.transaksis OWNER TO evolusipark_owner;

--
-- TOC entry 266 (class 1259 OID 1745957)
-- Name: transaksis_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.transaksis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksis_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 266
-- Name: transaksis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.transaksis_id_seq OWNED BY public.transaksis.id;


--
-- TOC entry 269 (class 1259 OID 1745967)
-- Name: users; Type: TABLE; Schema: public; Owner: evolusipark_owner
--

CREATE TABLE public.users (
    id integer NOT NULL,
    nama character varying(255),
    jenis_kelamin public.enum_users_jenis_kelamin,
    no_hp character varying(255),
    alamat_lengkap character varying(255),
    username character varying(255),
    password character varying(255),
    perusahaan_id integer,
    level_pengguna_id integer,
    status boolean,
    added_by integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO evolusipark_owner;

--
-- TOC entry 268 (class 1259 OID 1745966)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: evolusipark_owner
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO evolusipark_owner;

--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 268
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evolusipark_owner
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3387 (class 2604 OID 1745745)
-- Name: aktivitas_gerbang_kendaraans id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans ALTER COLUMN id SET DEFAULT nextval('public.aktivitas_gerbang_kendaraans_id_seq'::regclass);


--
-- TOC entry 3413 (class 2604 OID 1745994)
-- Name: data_members id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_members ALTER COLUMN id SET DEFAULT nextval('public.data_members_id_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 1745763)
-- Name: data_nomor_polisis id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis ALTER COLUMN id SET DEFAULT nextval('public.data_nomor_polisis_id_seq'::regclass);


--
-- TOC entry 3389 (class 2604 OID 1745772)
-- Name: data_vouchers id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_vouchers ALTER COLUMN id SET DEFAULT nextval('public.data_vouchers_id_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 1745781)
-- Name: global_settings id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.global_settings ALTER COLUMN id SET DEFAULT nextval('public.global_settings_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 1745790)
-- Name: kendaraans id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.kendaraans ALTER COLUMN id SET DEFAULT nextval('public.kendaraans_id_seq'::regclass);


--
-- TOC entry 3392 (class 2604 OID 1745797)
-- Name: laporan_riwayat_transaksi_members id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members ALTER COLUMN id SET DEFAULT nextval('public.laporan_riwayat_transaksi_members_id_seq'::regclass);


--
-- TOC entry 3393 (class 2604 OID 1745806)
-- Name: laporan_transaksi_batals id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_transaksi_batals ALTER COLUMN id SET DEFAULT nextval('public.laporan_transaksi_batals_id_seq'::regclass);


--
-- TOC entry 3394 (class 2604 OID 1745815)
-- Name: level_penggunas id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas ALTER COLUMN id SET DEFAULT nextval('public.level_penggunas_id_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 1745826)
-- Name: nama_interfaces id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.nama_interfaces ALTER COLUMN id SET DEFAULT nextval('public.nama_interfaces_id_seq'::regclass);


--
-- TOC entry 3396 (class 2604 OID 1745833)
-- Name: nama_printers id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.nama_printers ALTER COLUMN id SET DEFAULT nextval('public.nama_printers_id_seq'::regclass);


--
-- TOC entry 3397 (class 2604 OID 1745840)
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 1745849)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3399 (class 2604 OID 1745856)
-- Name: permasalahan_atau_perbaikans id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans ALTER COLUMN id SET DEFAULT nextval('public.permasalahan_atau_perbaikans_id_seq'::regclass);


--
-- TOC entry 3400 (class 2604 OID 1745865)
-- Name: perusahaans id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.perusahaans ALTER COLUMN id SET DEFAULT nextval('public.perusahaans_id_seq'::regclass);


--
-- TOC entry 3414 (class 2604 OID 1746003)
-- Name: pos id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos ALTER COLUMN id SET DEFAULT nextval('public.pos_id_seq'::regclass);


--
-- TOC entry 3401 (class 2604 OID 1745883)
-- Name: produk_members id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_members ALTER COLUMN id SET DEFAULT nextval('public.produk_members_id_seq'::regclass);


--
-- TOC entry 3402 (class 2604 OID 1745892)
-- Name: produk_vouchers id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_vouchers ALTER COLUMN id SET DEFAULT nextval('public.produk_vouchers_id_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 1745901)
-- Name: riwayat_transaksi_ganti_nopols id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols ALTER COLUMN id SET DEFAULT nextval('public.riwayat_transaksi_ganti_nopols_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 1745910)
-- Name: riwayat_transaksi_kartu_members id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members ALTER COLUMN id SET DEFAULT nextval('public.riwayat_transaksi_kartu_members_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 1745919)
-- Name: shifts id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.shifts ALTER COLUMN id SET DEFAULT nextval('public.shifts_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 1745926)
-- Name: tarif_dendas id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_dendas ALTER COLUMN id SET DEFAULT nextval('public.tarif_dendas_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 1745933)
-- Name: tarif_parkirs id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_parkirs ALTER COLUMN id SET DEFAULT nextval('public.tarif_parkirs_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 1745940)
-- Name: tipe_dendas id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_dendas ALTER COLUMN id SET DEFAULT nextval('public.tipe_dendas_id_seq'::regclass);


--
-- TOC entry 3409 (class 2604 OID 1745947)
-- Name: tipe_kendaraans id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_kendaraans ALTER COLUMN id SET DEFAULT nextval('public.tipe_kendaraans_id_seq'::regclass);


--
-- TOC entry 3410 (class 2604 OID 1745954)
-- Name: tipe_manlesses id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_manlesses ALTER COLUMN id SET DEFAULT nextval('public.tipe_manlesses_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 1745961)
-- Name: transaksis id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis ALTER COLUMN id SET DEFAULT nextval('public.transaksis_id_seq'::regclass);


--
-- TOC entry 3412 (class 2604 OID 1745970)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4312 (class 0 OID 1745742)
-- Dependencies: 219
-- Data for Name: aktivitas_gerbang_kendaraans; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.aktivitas_gerbang_kendaraans (id, tiket, plat_nomor, kendaraan_id, waktu, lokasi_gerbang, buka_atau_tutup, petugas_id, status_palang, tipe_gerbang, data_member_id, "createdAt", "updatedAt") FROM stdin;
78	TIK500	R1020A	1	05:30:00	Masuk	Tertutup	1	Sukses	Out	1	2025-07-30 06:12:49.981+00	2025-07-30 06:12:49.981+00
79	TIK500	R1020A	1	05:30:00	Masuk	Tertutup	1	Sukses	Out	1	2025-07-30 06:13:16.134+00	2025-07-30 06:13:16.134+00
\.


--
-- TOC entry 4364 (class 0 OID 1745991)
-- Dependencies: 271
-- Data for Name: data_members; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.data_members (id, nama, no_hp, perusahaan_id, akses_tiket, akses_kartu, no_kartu, tgl_input, produk_id, tarif, biaya_member, biaya_kartu, periode, user_id, "createdAt", "updatedAt") FROM stdin;
1	Itmamul Fahmi	082102342343	1	t	t	4435345345345	2000-05-31 00:00:00+00	1	50000	50000	50000	[2025-06-01,2025-06-03)	1	2025-07-27 08:22:20.417+00	2025-07-27 08:22:20.417+00
\.


--
-- TOC entry 4314 (class 0 OID 1745760)
-- Dependencies: 221
-- Data for Name: data_nomor_polisis; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.data_nomor_polisis (id, data_member_id, kendaraan_id, nomor_polisi, "createdAt", "updatedAt") FROM stdin;
1	1	1	AB1234AC	2025-07-27 08:22:20.946+00	2025-07-27 08:22:20.946+00
2	1	1	AB1235AC	2025-07-27 08:22:20.946+00	2025-07-27 08:22:20.946+00
3	1	1	AB1236AC	2025-07-27 08:22:20.946+00	2025-07-27 08:22:20.946+00
\.


--
-- TOC entry 4316 (class 0 OID 1745769)
-- Dependencies: 223
-- Data for Name: data_vouchers; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.data_vouchers (id, produk_voucher_id, periode, diskon, model_bayar, verifikasi, no_tiket, nomor_polisi, kendaraan_id, keterangan, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4318 (class 0 OID 1745778)
-- Dependencies: 225
-- Data for Name: global_settings; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.global_settings (id, nama_operator, email_operator, no_telp_operator, no_fax_operator, alamat_operator, nama_lokasi, email_lokasi, no_telp_lokasi, no_fax_lokasi, alamat_lokasi, "createdAt", "updatedAt") FROM stdin;
1	Evosist Parking	cs@evosist.com 	085817028312	085817028312	Jl. Alamanda No.227A Cilangkap Cipayung Jakarta Timur 	Pasar Megah Jaya	pasarmegahjaya@gmail.com	098768900232	08754345678	Pekuncen, Banyumas	2025-07-25 05:43:22.524+00	2025-07-27 09:51:57.865+00
\.


--
-- TOC entry 4320 (class 0 OID 1745787)
-- Dependencies: 227
-- Data for Name: kendaraans; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.kendaraans (id, nama_kendaraan, tipe_kendaraan_id, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Xenia	1	t	1	2025-07-27 07:29:25.466+00	2025-07-27 07:29:25.466+00
\.


--
-- TOC entry 4322 (class 0 OID 1745794)
-- Dependencies: 229
-- Data for Name: laporan_riwayat_transaksi_members; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.laporan_riwayat_transaksi_members (id, no, nomor_tiket, waktu_masuk, gerbang_masuk_id, jenis_kendaraan_id, nomor_polisi, waktu_keluar, pintu_keluar_id, durasi_parkir, denda, total_pembayaran, jenis_transaksi, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4324 (class 0 OID 1745803)
-- Dependencies: 231
-- Data for Name: laporan_transaksi_batals; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.laporan_transaksi_batals (id, no_tiket, tanggal_masuk, pintu_masuk_id, tanggal_pembatalan, alasan_pembatalan, penjelasan_pembatalan, user_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4326 (class 0 OID 1745812)
-- Dependencies: 233
-- Data for Name: level_penggunas; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.level_penggunas (id, nama, hak_akses, perusahaan_id, "createdAt", "updatedAt") FROM stdin;
1	Super Admin	[{"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama_menu": "Dashboard", "nama_sub_menu": null}, {"nama_menu": "Master Data", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Perusahaan"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "pengaturan": true}, "nama": "Level Pengguna"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Data Pengguna"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Pos (In/Out)"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Data Kendaraan"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Produk Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "perpanjang": true, "ganti_kartu": true, "riwayat_transaksi": true, "ganti_nomor_polisi": true}, "nama": "Data Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Produk Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Data Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Shift"}]}, {"nama_menu": "Laporan Data", "nama_sub_menu": [{"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Kendaraan"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Pendapatan Parkir"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "batalkan_transaksi": true}, "nama": "Transaksi Batal"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Audit Transaksi"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "unggah_file": true}, "nama": "Settlement Cashless"}]}, {"nama_menu": "Transaksi", "nama_sub_menu": [{"aksi": {"read": null, "create": true, "delete": null, "update": null}, "nama": "Tambah Transaksi"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Riwayat Transaksi"}]}, {"nama_menu": "Pengaturan", "nama_sub_menu": [{"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Tarif Parkir"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true, "aktif_nonaktif": true}, "nama": "Tarif Denda"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "aktif_nonaktif": true}, "nama": "Pembayaran"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Parameter"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Global"}]}, {"nama_menu": "Bantuan", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true, "proses_data_perbaikan": true}, "nama": "Tiket"}]}]	1	2025-07-24 05:10:55.045+00	2025-07-24 05:10:55.045+00
\.


--
-- TOC entry 4328 (class 0 OID 1745823)
-- Dependencies: 235
-- Data for Name: nama_interfaces; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.nama_interfaces (id, nama_interface, "createdAt", "updatedAt") FROM stdin;
1	BGI	2025-07-27 07:28:28.708+00	2025-07-27 07:28:28.708+00
\.


--
-- TOC entry 4330 (class 0 OID 1745830)
-- Dependencies: 237
-- Data for Name: nama_printers; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.nama_printers (id, nama_printer, "createdAt", "updatedAt") FROM stdin;
1	EPSON TM-T82 Receipt	2025-07-27 07:28:25.324+00	2025-07-27 07:28:25.324+00
\.


--
-- TOC entry 4332 (class 0 OID 1745837)
-- Dependencies: 239
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.parameters (id, nama, nilai, keterangan, "createdAt", "updatedAt") FROM stdin;
1	Bayar Member Secara Berjenjang	false	Pembayaran member secara berjenjang ketika keluar	2025-07-27 07:28:11.612+00	2025-07-27 07:28:11.612+00
\.


--
-- TOC entry 4334 (class 0 OID 1745846)
-- Dependencies: 241
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.payments (id, jenis_payment, status, "createdAt", "updatedAt") FROM stdin;
1	Prepaid Card	t	2025-07-27 07:27:49.716+00	2025-07-27 07:27:49.716+00
\.


--
-- TOC entry 4336 (class 0 OID 1745853)
-- Dependencies: 243
-- Data for Name: permasalahan_atau_perbaikans; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.permasalahan_atau_perbaikans (id, judul_permasalahan, tanggal_permasalahan, kategori_permasalahan, pos_id, hardware_atau_alat, penyebab_permasalahan, keterangan_permasalahan, nama_pelapor, status_permasalahan, tanggal_perbaikan, jenis_perbaikan, status_perbaikan, penanganan, keterangan_penanganan, nama_yang_menangani, "createdAt", "updatedAt") FROM stdin;
1	Error Barrier Gate	31-05-2021	Sistem	1	Hardware	Ada short dalam kelistrikan	Segera melakukan perbaikan	Fahmi	Pending	31-05-2004		Pending				2025-07-27 07:45:30.144+00	2025-07-27 07:45:30.144+00
\.


--
-- TOC entry 4338 (class 0 OID 1745862)
-- Dependencies: 245
-- Data for Name: perusahaans; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.perusahaans (id, nama, jenis_perusahaan, kontak, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Evolusi Sistem Digital	Pemilik Gedung	08235345345	t	\N	2025-07-24 05:10:52.493+00	2025-07-24 05:10:52.493+00
2	PT ABC	Pemilik Gedung	081345234543	f	1	2025-07-24 09:49:39.564+00	2025-07-24 09:49:39.564+00
\.


--
-- TOC entry 4366 (class 0 OID 1746000)
-- Dependencies: 273
-- Data for Name: pos; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.pos (id, kode, keterangan, tipe_pos, tipe_manless_id, tipe_kendaraan, kamera_1, kamera_2, nama_printer_id, nama_interface_id, com_port, otorisasi, synchronize, user_id, "createdAt", "updatedAt") FROM stdin;
1	P1	Pos 1	In	1	All	t	t	1	1	1	t	1	1	2025-07-27 07:34:39.62+00	2025-07-27 07:34:39.62+00
\.


--
-- TOC entry 4340 (class 0 OID 1745880)
-- Dependencies: 247
-- Data for Name: produk_members; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.produk_members (id, nama, periode, list_id_kendaraan, max_kendaraan, tarif, biaya_kartu, biaya_ganti_nopol, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Kartu Member 1	[2025-06-01,2025-06-10)	{1,1}	1	50000	50000	50000	t	1	2025-07-27 07:34:56.525+00	2025-07-27 07:34:56.525+00
\.


--
-- TOC entry 4342 (class 0 OID 1745889)
-- Dependencies: 249
-- Data for Name: produk_vouchers; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.produk_vouchers (id, nama, periode, list_id_kendaraan, diskon, model_pembayaran, metode_verifikasi, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Tamu	[2025-05-31,2025-06-01)	{1,1}	2000	Check In	Tiket	t	1	2025-07-27 07:34:50.499+00	2025-07-27 07:34:50.499+00
\.


--
-- TOC entry 4344 (class 0 OID 1745898)
-- Dependencies: 251
-- Data for Name: riwayat_transaksi_ganti_nopols; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.riwayat_transaksi_ganti_nopols (id, tgl_transaksi, nomor_polisi_lama, nomor_polisi_baru, tarif, keterangan, user_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4346 (class 0 OID 1745907)
-- Dependencies: 253
-- Data for Name: riwayat_transaksi_kartu_members; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.riwayat_transaksi_kartu_members (id, tgl_transaksi, no_kartu, tarif, keterangan, user_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 4348 (class 0 OID 1745916)
-- Dependencies: 255
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.shifts (id, nama_shift, awal_shift, akhir_shift, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Shift 1	08:00:00	16:00:00	t	1	2025-07-27 07:35:08.916+00	2025-07-27 07:35:08.916+00
\.


--
-- TOC entry 4350 (class 0 OID 1745923)
-- Dependencies: 257
-- Data for Name: tarif_dendas; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.tarif_dendas (id, kendaraan_id, denda_tiket, denda_stnk, denda_member, status, "createdAt", "updatedAt") FROM stdin;
1	1	7000	7000	t	t	2025-07-27 07:29:29.608+00	2025-07-27 07:29:29.608+00
\.


--
-- TOC entry 4352 (class 0 OID 1745930)
-- Dependencies: 259
-- Data for Name: tarif_parkirs; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.tarif_parkirs (id, kendaraan_id, grace_period, tarif_grace_period, rotasi_pertama, tarif_rotasi_pertama, rotasi_kedua, tarif_rotasi_kedua, rotasi_ketiga, tarif_rotasi_ketiga, tarif_maksimal, "createdAt", "updatedAt") FROM stdin;
3	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	2025-07-27 07:29:26.01+00	2025-07-27 07:29:26.01+00
\.


--
-- TOC entry 4354 (class 0 OID 1745937)
-- Dependencies: 261
-- Data for Name: tipe_dendas; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.tipe_dendas (id, tipe_denda, "createdAt", "updatedAt") FROM stdin;
1	Tidak Dapat Menunjukkan STNK	2025-07-27 07:28:16.823+00	2025-07-27 07:28:16.823+00
\.


--
-- TOC entry 4356 (class 0 OID 1745944)
-- Dependencies: 263
-- Data for Name: tipe_kendaraans; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.tipe_kendaraans (id, tipe_kendaraan, "createdAt", "updatedAt") FROM stdin;
1	Mobil	2025-07-27 07:28:07.031+00	2025-07-27 07:28:07.031+00
\.


--
-- TOC entry 4358 (class 0 OID 1745951)
-- Dependencies: 265
-- Data for Name: tipe_manlesses; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.tipe_manlesses (id, tipe_manless, "createdAt", "updatedAt") FROM stdin;
1	Loop 1 with Button and Feedback	2025-07-27 07:28:21.125+00	2025-07-27 07:28:21.125+00
\.


--
-- TOC entry 4360 (class 0 OID 1745958)
-- Dependencies: 267
-- Data for Name: transaksis; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.transaksis (id, tanggal_masuk, pintu_masuk_id, no_tiket, is_manual, kendaraan_id, nomor_polisi, pintu_keluar_id, tanggal_keluar, petugas_id, shift_id, denda, tipe_denda_id, is_active, jenis_pembayaran_id, biaya_parkir, id_data_voucher, jumlah_denda_stnk, jumlah_denda_tiket, "interval", keterangan_atau_penjelasan, id_data_member, "createdAt", "updatedAt") FROM stdin;
1	2025-05-04 07:00:00+00	1	AABBCC	f	1	R2020AJ	1	2025-05-04 17:00:00+00	1	1	f	1	t	1	0	\N	0	0	10	keterangan	\N	2025-07-27 07:42:06.698+00	2025-07-27 07:42:06.698+00
5	2025-07-29 11:07:39.209+00	1	TIK200_07	f	1	M4455ZZ	1	2025-07-29 11:07:45.957+00	1	1	f	\N	\N	1	0	\N	0	0	1	Sistem otomatis	1	2025-07-30 00:33:19.323+00	2025-07-30 00:33:19.323+00
\.


--
-- TOC entry 4362 (class 0 OID 1745967)
-- Dependencies: 269
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: evolusipark_owner
--

COPY public.users (id, nama, jenis_kelamin, no_hp, alamat_lengkap, username, password, perusahaan_id, level_pengguna_id, status, added_by, "createdAt", "updatedAt") FROM stdin;
1	Evosist	Laki-laki	0823234234234	Jakarta	admin	$argon2id$v=19$m=65536,t=3,p=4$j2sz6NfBRA03j1ODC9R3tg$+CxW5tZjrRknmCehj0Q23uqs7XzmE0wqdMzP9UEktg0	1	1	t	\N	2025-07-24 09:10:38.658+00	2025-07-24 09:10:38.658+00
\.


--
-- TOC entry 4401 (class 0 OID 0)
-- Dependencies: 218
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.aktivitas_gerbang_kendaraans_id_seq', 79, true);


--
-- TOC entry 4402 (class 0 OID 0)
-- Dependencies: 270
-- Name: data_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.data_members_id_seq', 2, true);


--
-- TOC entry 4403 (class 0 OID 0)
-- Dependencies: 220
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.data_nomor_polisis_id_seq', 3, true);


--
-- TOC entry 4404 (class 0 OID 0)
-- Dependencies: 222
-- Name: data_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.data_vouchers_id_seq', 1, true);


--
-- TOC entry 4405 (class 0 OID 0)
-- Dependencies: 224
-- Name: global_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.global_settings_id_seq', 1, true);


--
-- TOC entry 4406 (class 0 OID 0)
-- Dependencies: 226
-- Name: kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.kendaraans_id_seq', 1, true);


--
-- TOC entry 4407 (class 0 OID 0)
-- Dependencies: 228
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.laporan_riwayat_transaksi_members_id_seq', 1, false);


--
-- TOC entry 4408 (class 0 OID 0)
-- Dependencies: 230
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.laporan_transaksi_batals_id_seq', 1, false);


--
-- TOC entry 4409 (class 0 OID 0)
-- Dependencies: 232
-- Name: level_penggunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.level_penggunas_id_seq', 3, true);


--
-- TOC entry 4410 (class 0 OID 0)
-- Dependencies: 234
-- Name: nama_interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.nama_interfaces_id_seq', 1, true);


--
-- TOC entry 4411 (class 0 OID 0)
-- Dependencies: 236
-- Name: nama_printers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.nama_printers_id_seq', 1, true);


--
-- TOC entry 4412 (class 0 OID 0)
-- Dependencies: 238
-- Name: parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.parameters_id_seq', 1, true);


--
-- TOC entry 4413 (class 0 OID 0)
-- Dependencies: 240
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, true);


--
-- TOC entry 4414 (class 0 OID 0)
-- Dependencies: 242
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.permasalahan_atau_perbaikans_id_seq', 1, true);


--
-- TOC entry 4415 (class 0 OID 0)
-- Dependencies: 244
-- Name: perusahaans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.perusahaans_id_seq', 2, true);


--
-- TOC entry 4416 (class 0 OID 0)
-- Dependencies: 272
-- Name: pos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.pos_id_seq', 1, true);


--
-- TOC entry 4417 (class 0 OID 0)
-- Dependencies: 246
-- Name: produk_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.produk_members_id_seq', 1, true);


--
-- TOC entry 4418 (class 0 OID 0)
-- Dependencies: 248
-- Name: produk_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.produk_vouchers_id_seq', 1, true);


--
-- TOC entry 4419 (class 0 OID 0)
-- Dependencies: 250
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.riwayat_transaksi_ganti_nopols_id_seq', 1, false);


--
-- TOC entry 4420 (class 0 OID 0)
-- Dependencies: 252
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.riwayat_transaksi_kartu_members_id_seq', 1, false);


--
-- TOC entry 4421 (class 0 OID 0)
-- Dependencies: 254
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.shifts_id_seq', 1, true);


--
-- TOC entry 4422 (class 0 OID 0)
-- Dependencies: 256
-- Name: tarif_dendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.tarif_dendas_id_seq', 2, true);


--
-- TOC entry 4423 (class 0 OID 0)
-- Dependencies: 258
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.tarif_parkirs_id_seq', 3, true);


--
-- TOC entry 4424 (class 0 OID 0)
-- Dependencies: 260
-- Name: tipe_dendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.tipe_dendas_id_seq', 1, true);


--
-- TOC entry 4425 (class 0 OID 0)
-- Dependencies: 262
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.tipe_kendaraans_id_seq', 1, true);


--
-- TOC entry 4426 (class 0 OID 0)
-- Dependencies: 264
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.tipe_manlesses_id_seq', 1, true);


--
-- TOC entry 4427 (class 0 OID 0)
-- Dependencies: 266
-- Name: transaksis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.transaksis_id_seq', 5, true);


--
-- TOC entry 4428 (class 0 OID 0)
-- Dependencies: 268
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evolusipark_owner
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 3416 (class 2606 OID 1745749)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 4120 (class 2606 OID 1745998)
-- Name: data_members data_members_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 2277499)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key UNIQUE (nomor_polisi);


--
-- TOC entry 3420 (class 2606 OID 2277501)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key1; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key1 UNIQUE (nomor_polisi);


--
-- TOC entry 3422 (class 2606 OID 2277485)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key10; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key10 UNIQUE (nomor_polisi);


--
-- TOC entry 3424 (class 2606 OID 2277537)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key11; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key11 UNIQUE (nomor_polisi);


--
-- TOC entry 3426 (class 2606 OID 2277483)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key12; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key12 UNIQUE (nomor_polisi);


--
-- TOC entry 3428 (class 2606 OID 2277541)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key13; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key13 UNIQUE (nomor_polisi);


--
-- TOC entry 3430 (class 2606 OID 2277549)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key14; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key14 UNIQUE (nomor_polisi);


--
-- TOC entry 3432 (class 2606 OID 2277481)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key15; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key15 UNIQUE (nomor_polisi);


--
-- TOC entry 3434 (class 2606 OID 2277551)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key16; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key16 UNIQUE (nomor_polisi);


--
-- TOC entry 3436 (class 2606 OID 2277479)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key17; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key17 UNIQUE (nomor_polisi);


--
-- TOC entry 3438 (class 2606 OID 2277553)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key18; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key18 UNIQUE (nomor_polisi);


--
-- TOC entry 3440 (class 2606 OID 2277477)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key19; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key19 UNIQUE (nomor_polisi);


--
-- TOC entry 3442 (class 2606 OID 2277503)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key2; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key2 UNIQUE (nomor_polisi);


--
-- TOC entry 3444 (class 2606 OID 2277475)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key20; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key20 UNIQUE (nomor_polisi);


--
-- TOC entry 3446 (class 2606 OID 2277473)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key21; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key21 UNIQUE (nomor_polisi);


--
-- TOC entry 3448 (class 2606 OID 2277555)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key22; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key22 UNIQUE (nomor_polisi);


--
-- TOC entry 3450 (class 2606 OID 2277557)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key23; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key23 UNIQUE (nomor_polisi);


--
-- TOC entry 3452 (class 2606 OID 2277471)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key24; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key24 UNIQUE (nomor_polisi);


--
-- TOC entry 3454 (class 2606 OID 2277559)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key25; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key25 UNIQUE (nomor_polisi);


--
-- TOC entry 3456 (class 2606 OID 2277539)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key26; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key26 UNIQUE (nomor_polisi);


--
-- TOC entry 3458 (class 2606 OID 2277469)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key27; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key27 UNIQUE (nomor_polisi);


--
-- TOC entry 3460 (class 2606 OID 2277467)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key28; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key28 UNIQUE (nomor_polisi);


--
-- TOC entry 3462 (class 2606 OID 2277513)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key29; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key29 UNIQUE (nomor_polisi);


--
-- TOC entry 3464 (class 2606 OID 2277505)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key3; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key3 UNIQUE (nomor_polisi);


--
-- TOC entry 3466 (class 2606 OID 2277515)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key30; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key30 UNIQUE (nomor_polisi);


--
-- TOC entry 3468 (class 2606 OID 2277547)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key31; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key31 UNIQUE (nomor_polisi);


--
-- TOC entry 3470 (class 2606 OID 2277543)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key32; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key32 UNIQUE (nomor_polisi);


--
-- TOC entry 3472 (class 2606 OID 2277545)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key33; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key33 UNIQUE (nomor_polisi);


--
-- TOC entry 3474 (class 2606 OID 2277497)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key34; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key34 UNIQUE (nomor_polisi);


--
-- TOC entry 3476 (class 2606 OID 2277493)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key35; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key35 UNIQUE (nomor_polisi);


--
-- TOC entry 3478 (class 2606 OID 2277495)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key36; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key36 UNIQUE (nomor_polisi);


--
-- TOC entry 3480 (class 2606 OID 2277463)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key37; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key37 UNIQUE (nomor_polisi);


--
-- TOC entry 3482 (class 2606 OID 2277517)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key38; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key38 UNIQUE (nomor_polisi);


--
-- TOC entry 3484 (class 2606 OID 2277461)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key39; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key39 UNIQUE (nomor_polisi);


--
-- TOC entry 3486 (class 2606 OID 2277491)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key4; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key4 UNIQUE (nomor_polisi);


--
-- TOC entry 3488 (class 2606 OID 2277457)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key40; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key40 UNIQUE (nomor_polisi);


--
-- TOC entry 3490 (class 2606 OID 2277465)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key41; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key41 UNIQUE (nomor_polisi);


--
-- TOC entry 3492 (class 2606 OID 2277455)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key42; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key42 UNIQUE (nomor_polisi);


--
-- TOC entry 3494 (class 2606 OID 2277459)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key43; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key43 UNIQUE (nomor_polisi);


--
-- TOC entry 3496 (class 2606 OID 2277519)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key44; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key44 UNIQUE (nomor_polisi);


--
-- TOC entry 3498 (class 2606 OID 2277451)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key45; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key45 UNIQUE (nomor_polisi);


--
-- TOC entry 3500 (class 2606 OID 2277521)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key46; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key46 UNIQUE (nomor_polisi);


--
-- TOC entry 3502 (class 2606 OID 2277449)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key47; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key47 UNIQUE (nomor_polisi);


--
-- TOC entry 3504 (class 2606 OID 2277523)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key48; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key48 UNIQUE (nomor_polisi);


--
-- TOC entry 3506 (class 2606 OID 2277533)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key49; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key49 UNIQUE (nomor_polisi);


--
-- TOC entry 3508 (class 2606 OID 2277507)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key5; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key5 UNIQUE (nomor_polisi);


--
-- TOC entry 3510 (class 2606 OID 2277525)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key50; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key50 UNIQUE (nomor_polisi);


--
-- TOC entry 3512 (class 2606 OID 2277531)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key51; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key51 UNIQUE (nomor_polisi);


--
-- TOC entry 3514 (class 2606 OID 2277527)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key52; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key52 UNIQUE (nomor_polisi);


--
-- TOC entry 3516 (class 2606 OID 2277529)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key53; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key53 UNIQUE (nomor_polisi);


--
-- TOC entry 3518 (class 2606 OID 2277511)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key54; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key54 UNIQUE (nomor_polisi);


--
-- TOC entry 3520 (class 2606 OID 2277561)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key55; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key55 UNIQUE (nomor_polisi);


--
-- TOC entry 3522 (class 2606 OID 2277447)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key56; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key56 UNIQUE (nomor_polisi);


--
-- TOC entry 3524 (class 2606 OID 2277563)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key57; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key57 UNIQUE (nomor_polisi);


--
-- TOC entry 3526 (class 2606 OID 2277445)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key58; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key58 UNIQUE (nomor_polisi);


--
-- TOC entry 3528 (class 2606 OID 2277565)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key59; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key59 UNIQUE (nomor_polisi);


--
-- TOC entry 3530 (class 2606 OID 2277489)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key6; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key6 UNIQUE (nomor_polisi);


--
-- TOC entry 3532 (class 2606 OID 2277441)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key60; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key60 UNIQUE (nomor_polisi);


--
-- TOC entry 3534 (class 2606 OID 2277567)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key61; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key61 UNIQUE (nomor_polisi);


--
-- TOC entry 3536 (class 2606 OID 2277439)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key62; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key62 UNIQUE (nomor_polisi);


--
-- TOC entry 3538 (class 2606 OID 2277569)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key63; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key63 UNIQUE (nomor_polisi);


--
-- TOC entry 3540 (class 2606 OID 2277437)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key64; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key64 UNIQUE (nomor_polisi);


--
-- TOC entry 3542 (class 2606 OID 2277571)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key65; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key65 UNIQUE (nomor_polisi);


--
-- TOC entry 3544 (class 2606 OID 2277435)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key66; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key66 UNIQUE (nomor_polisi);


--
-- TOC entry 3546 (class 2606 OID 2277573)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key67; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key67 UNIQUE (nomor_polisi);


--
-- TOC entry 3548 (class 2606 OID 2277433)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key68; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key68 UNIQUE (nomor_polisi);


--
-- TOC entry 3550 (class 2606 OID 2277431)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key69; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key69 UNIQUE (nomor_polisi);


--
-- TOC entry 3552 (class 2606 OID 2277509)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key7; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key7 UNIQUE (nomor_polisi);


--
-- TOC entry 3554 (class 2606 OID 2277453)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key70; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key70 UNIQUE (nomor_polisi);


--
-- TOC entry 3556 (class 2606 OID 2277575)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key71; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key71 UNIQUE (nomor_polisi);


--
-- TOC entry 3558 (class 2606 OID 2277429)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key72; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key72 UNIQUE (nomor_polisi);


--
-- TOC entry 3560 (class 2606 OID 2277577)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key73; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key73 UNIQUE (nomor_polisi);


--
-- TOC entry 3562 (class 2606 OID 2277427)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key74; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key74 UNIQUE (nomor_polisi);


--
-- TOC entry 3564 (class 2606 OID 2277579)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key75; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key75 UNIQUE (nomor_polisi);


--
-- TOC entry 3566 (class 2606 OID 2277425)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key76; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key76 UNIQUE (nomor_polisi);


--
-- TOC entry 3568 (class 2606 OID 2277581)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key77; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key77 UNIQUE (nomor_polisi);


--
-- TOC entry 3570 (class 2606 OID 2277423)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key78; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key78 UNIQUE (nomor_polisi);


--
-- TOC entry 3572 (class 2606 OID 2277583)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key79; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key79 UNIQUE (nomor_polisi);


--
-- TOC entry 3574 (class 2606 OID 2277487)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key8; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key8 UNIQUE (nomor_polisi);


--
-- TOC entry 3576 (class 2606 OID 2277421)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key80; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key80 UNIQUE (nomor_polisi);


--
-- TOC entry 3578 (class 2606 OID 2277443)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key81; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key81 UNIQUE (nomor_polisi);


--
-- TOC entry 3580 (class 2606 OID 2277419)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key82; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key82 UNIQUE (nomor_polisi);


--
-- TOC entry 3582 (class 2606 OID 2277585)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key83; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key83 UNIQUE (nomor_polisi);


--
-- TOC entry 3584 (class 2606 OID 2277535)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key9; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key9 UNIQUE (nomor_polisi);


--
-- TOC entry 3586 (class 2606 OID 1745765)
-- Name: data_nomor_polisis data_nomor_polisis_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 1745776)
-- Name: data_vouchers data_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 3590 (class 2606 OID 1745785)
-- Name: global_settings global_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.global_settings
    ADD CONSTRAINT global_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3592 (class 2606 OID 1745792)
-- Name: kendaraans kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 3594 (class 2606 OID 1745801)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 1745810)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_pkey PRIMARY KEY (id);


--
-- TOC entry 3598 (class 2606 OID 2277712)
-- Name: level_penggunas level_penggunas_nama_key; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key UNIQUE (nama);


--
-- TOC entry 3600 (class 2606 OID 2277714)
-- Name: level_penggunas level_penggunas_nama_key1; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key1 UNIQUE (nama);


--
-- TOC entry 3602 (class 2606 OID 2277744)
-- Name: level_penggunas level_penggunas_nama_key10; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key10 UNIQUE (nama);


--
-- TOC entry 3604 (class 2606 OID 2277698)
-- Name: level_penggunas level_penggunas_nama_key11; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key11 UNIQUE (nama);


--
-- TOC entry 3606 (class 2606 OID 2277696)
-- Name: level_penggunas level_penggunas_nama_key12; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key12 UNIQUE (nama);


--
-- TOC entry 3608 (class 2606 OID 2277692)
-- Name: level_penggunas level_penggunas_nama_key13; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key13 UNIQUE (nama);


--
-- TOC entry 3610 (class 2606 OID 2277694)
-- Name: level_penggunas level_penggunas_nama_key14; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key14 UNIQUE (nama);


--
-- TOC entry 3612 (class 2606 OID 2277746)
-- Name: level_penggunas level_penggunas_nama_key15; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key15 UNIQUE (nama);


--
-- TOC entry 3614 (class 2606 OID 2277762)
-- Name: level_penggunas level_penggunas_nama_key16; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key16 UNIQUE (nama);


--
-- TOC entry 3616 (class 2606 OID 2277760)
-- Name: level_penggunas level_penggunas_nama_key17; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key17 UNIQUE (nama);


--
-- TOC entry 3618 (class 2606 OID 2277750)
-- Name: level_penggunas level_penggunas_nama_key18; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key18 UNIQUE (nama);


--
-- TOC entry 3620 (class 2606 OID 2277758)
-- Name: level_penggunas level_penggunas_nama_key19; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key19 UNIQUE (nama);


--
-- TOC entry 3622 (class 2606 OID 2277716)
-- Name: level_penggunas level_penggunas_nama_key2; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key2 UNIQUE (nama);


--
-- TOC entry 3624 (class 2606 OID 2277752)
-- Name: level_penggunas level_penggunas_nama_key20; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key20 UNIQUE (nama);


--
-- TOC entry 3626 (class 2606 OID 2277754)
-- Name: level_penggunas level_penggunas_nama_key21; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key21 UNIQUE (nama);


--
-- TOC entry 3628 (class 2606 OID 2277756)
-- Name: level_penggunas level_penggunas_nama_key22; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key22 UNIQUE (nama);


--
-- TOC entry 3630 (class 2606 OID 2277722)
-- Name: level_penggunas level_penggunas_nama_key23; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key23 UNIQUE (nama);


--
-- TOC entry 3632 (class 2606 OID 2277740)
-- Name: level_penggunas level_penggunas_nama_key24; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key24 UNIQUE (nama);


--
-- TOC entry 3634 (class 2606 OID 2277724)
-- Name: level_penggunas level_penggunas_nama_key25; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key25 UNIQUE (nama);


--
-- TOC entry 3636 (class 2606 OID 2277738)
-- Name: level_penggunas level_penggunas_nama_key26; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key26 UNIQUE (nama);


--
-- TOC entry 3638 (class 2606 OID 2277726)
-- Name: level_penggunas level_penggunas_nama_key27; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key27 UNIQUE (nama);


--
-- TOC entry 3640 (class 2606 OID 2277728)
-- Name: level_penggunas level_penggunas_nama_key28; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key28 UNIQUE (nama);


--
-- TOC entry 3642 (class 2606 OID 2277736)
-- Name: level_penggunas level_penggunas_nama_key29; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key29 UNIQUE (nama);


--
-- TOC entry 3644 (class 2606 OID 2277710)
-- Name: level_penggunas level_penggunas_nama_key3; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key3 UNIQUE (nama);


--
-- TOC entry 3646 (class 2606 OID 2277730)
-- Name: level_penggunas level_penggunas_nama_key30; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key30 UNIQUE (nama);


--
-- TOC entry 3648 (class 2606 OID 2277732)
-- Name: level_penggunas level_penggunas_nama_key31; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key31 UNIQUE (nama);


--
-- TOC entry 3650 (class 2606 OID 2277734)
-- Name: level_penggunas level_penggunas_nama_key32; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key32 UNIQUE (nama);


--
-- TOC entry 3652 (class 2606 OID 2277690)
-- Name: level_penggunas level_penggunas_nama_key33; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key33 UNIQUE (nama);


--
-- TOC entry 3654 (class 2606 OID 2277764)
-- Name: level_penggunas level_penggunas_nama_key34; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key34 UNIQUE (nama);


--
-- TOC entry 3656 (class 2606 OID 2277688)
-- Name: level_penggunas level_penggunas_nama_key35; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key35 UNIQUE (nama);


--
-- TOC entry 3658 (class 2606 OID 2277766)
-- Name: level_penggunas level_penggunas_nama_key36; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key36 UNIQUE (nama);


--
-- TOC entry 3660 (class 2606 OID 2277686)
-- Name: level_penggunas level_penggunas_nama_key37; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key37 UNIQUE (nama);


--
-- TOC entry 3662 (class 2606 OID 2277768)
-- Name: level_penggunas level_penggunas_nama_key38; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key38 UNIQUE (nama);


--
-- TOC entry 3664 (class 2606 OID 2277684)
-- Name: level_penggunas level_penggunas_nama_key39; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key39 UNIQUE (nama);


--
-- TOC entry 3666 (class 2606 OID 2277718)
-- Name: level_penggunas level_penggunas_nama_key4; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key4 UNIQUE (nama);


--
-- TOC entry 3668 (class 2606 OID 2277770)
-- Name: level_penggunas level_penggunas_nama_key40; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key40 UNIQUE (nama);


--
-- TOC entry 3670 (class 2606 OID 2277678)
-- Name: level_penggunas level_penggunas_nama_key41; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key41 UNIQUE (nama);


--
-- TOC entry 3672 (class 2606 OID 2277772)
-- Name: level_penggunas level_penggunas_nama_key42; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key42 UNIQUE (nama);


--
-- TOC entry 3674 (class 2606 OID 2277676)
-- Name: level_penggunas level_penggunas_nama_key43; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key43 UNIQUE (nama);


--
-- TOC entry 3676 (class 2606 OID 2277774)
-- Name: level_penggunas level_penggunas_nama_key44; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key44 UNIQUE (nama);


--
-- TOC entry 3678 (class 2606 OID 2277674)
-- Name: level_penggunas level_penggunas_nama_key45; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key45 UNIQUE (nama);


--
-- TOC entry 3680 (class 2606 OID 2277776)
-- Name: level_penggunas level_penggunas_nama_key46; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key46 UNIQUE (nama);


--
-- TOC entry 3682 (class 2606 OID 2277668)
-- Name: level_penggunas level_penggunas_nama_key47; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key47 UNIQUE (nama);


--
-- TOC entry 3684 (class 2606 OID 2277778)
-- Name: level_penggunas level_penggunas_nama_key48; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key48 UNIQUE (nama);


--
-- TOC entry 3686 (class 2606 OID 2277666)
-- Name: level_penggunas level_penggunas_nama_key49; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key49 UNIQUE (nama);


--
-- TOC entry 3688 (class 2606 OID 2277708)
-- Name: level_penggunas level_penggunas_nama_key5; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key5 UNIQUE (nama);


--
-- TOC entry 3690 (class 2606 OID 2277780)
-- Name: level_penggunas level_penggunas_nama_key50; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key50 UNIQUE (nama);


--
-- TOC entry 3692 (class 2606 OID 2277782)
-- Name: level_penggunas level_penggunas_nama_key51; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key51 UNIQUE (nama);


--
-- TOC entry 3694 (class 2606 OID 2277664)
-- Name: level_penggunas level_penggunas_nama_key52; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key52 UNIQUE (nama);


--
-- TOC entry 3696 (class 2606 OID 2277748)
-- Name: level_penggunas level_penggunas_nama_key53; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key53 UNIQUE (nama);


--
-- TOC entry 3698 (class 2606 OID 2277662)
-- Name: level_penggunas level_penggunas_nama_key54; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key54 UNIQUE (nama);


--
-- TOC entry 3700 (class 2606 OID 2277784)
-- Name: level_penggunas level_penggunas_nama_key55; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key55 UNIQUE (nama);


--
-- TOC entry 3702 (class 2606 OID 2277660)
-- Name: level_penggunas level_penggunas_nama_key56; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key56 UNIQUE (nama);


--
-- TOC entry 3704 (class 2606 OID 2277658)
-- Name: level_penggunas level_penggunas_nama_key57; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key57 UNIQUE (nama);


--
-- TOC entry 3706 (class 2606 OID 2277680)
-- Name: level_penggunas level_penggunas_nama_key58; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key58 UNIQUE (nama);


--
-- TOC entry 3708 (class 2606 OID 2277786)
-- Name: level_penggunas level_penggunas_nama_key59; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key59 UNIQUE (nama);


--
-- TOC entry 3710 (class 2606 OID 2277720)
-- Name: level_penggunas level_penggunas_nama_key6; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key6 UNIQUE (nama);


--
-- TOC entry 3712 (class 2606 OID 2277656)
-- Name: level_penggunas level_penggunas_nama_key60; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key60 UNIQUE (nama);


--
-- TOC entry 3714 (class 2606 OID 2277788)
-- Name: level_penggunas level_penggunas_nama_key61; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key61 UNIQUE (nama);


--
-- TOC entry 3716 (class 2606 OID 2277654)
-- Name: level_penggunas level_penggunas_nama_key62; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key62 UNIQUE (nama);


--
-- TOC entry 3718 (class 2606 OID 2277650)
-- Name: level_penggunas level_penggunas_nama_key63; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key63 UNIQUE (nama);


--
-- TOC entry 3720 (class 2606 OID 2277682)
-- Name: level_penggunas level_penggunas_nama_key64; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key64 UNIQUE (nama);


--
-- TOC entry 3722 (class 2606 OID 2277648)
-- Name: level_penggunas level_penggunas_nama_key65; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key65 UNIQUE (nama);


--
-- TOC entry 3724 (class 2606 OID 2277700)
-- Name: level_penggunas level_penggunas_nama_key66; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key66 UNIQUE (nama);


--
-- TOC entry 3726 (class 2606 OID 2277790)
-- Name: level_penggunas level_penggunas_nama_key67; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key67 UNIQUE (nama);


--
-- TOC entry 3728 (class 2606 OID 2277646)
-- Name: level_penggunas level_penggunas_nama_key68; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key68 UNIQUE (nama);


--
-- TOC entry 3730 (class 2606 OID 2277644)
-- Name: level_penggunas level_penggunas_nama_key69; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key69 UNIQUE (nama);


--
-- TOC entry 3732 (class 2606 OID 2277706)
-- Name: level_penggunas level_penggunas_nama_key7; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key7 UNIQUE (nama);


--
-- TOC entry 3734 (class 2606 OID 2277702)
-- Name: level_penggunas level_penggunas_nama_key70; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key70 UNIQUE (nama);


--
-- TOC entry 3736 (class 2606 OID 2277642)
-- Name: level_penggunas level_penggunas_nama_key71; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key71 UNIQUE (nama);


--
-- TOC entry 3738 (class 2606 OID 2277670)
-- Name: level_penggunas level_penggunas_nama_key72; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key72 UNIQUE (nama);


--
-- TOC entry 3740 (class 2606 OID 2277792)
-- Name: level_penggunas level_penggunas_nama_key73; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key73 UNIQUE (nama);


--
-- TOC entry 3742 (class 2606 OID 2277640)
-- Name: level_penggunas level_penggunas_nama_key74; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key74 UNIQUE (nama);


--
-- TOC entry 3744 (class 2606 OID 2277794)
-- Name: level_penggunas level_penggunas_nama_key75; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key75 UNIQUE (nama);


--
-- TOC entry 3746 (class 2606 OID 2277638)
-- Name: level_penggunas level_penggunas_nama_key76; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key76 UNIQUE (nama);


--
-- TOC entry 3748 (class 2606 OID 2277636)
-- Name: level_penggunas level_penggunas_nama_key77; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key77 UNIQUE (nama);


--
-- TOC entry 3750 (class 2606 OID 2277672)
-- Name: level_penggunas level_penggunas_nama_key78; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key78 UNIQUE (nama);


--
-- TOC entry 3752 (class 2606 OID 2277652)
-- Name: level_penggunas level_penggunas_nama_key79; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key79 UNIQUE (nama);


--
-- TOC entry 3754 (class 2606 OID 2277742)
-- Name: level_penggunas level_penggunas_nama_key8; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key8 UNIQUE (nama);


--
-- TOC entry 3756 (class 2606 OID 2277634)
-- Name: level_penggunas level_penggunas_nama_key80; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key80 UNIQUE (nama);


--
-- TOC entry 3758 (class 2606 OID 2277796)
-- Name: level_penggunas level_penggunas_nama_key81; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key81 UNIQUE (nama);


--
-- TOC entry 3760 (class 2606 OID 2277704)
-- Name: level_penggunas level_penggunas_nama_key9; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key9 UNIQUE (nama);


--
-- TOC entry 3762 (class 2606 OID 1745819)
-- Name: level_penggunas level_penggunas_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 1745828)
-- Name: nama_interfaces nama_interfaces_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.nama_interfaces
    ADD CONSTRAINT nama_interfaces_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 1745835)
-- Name: nama_printers nama_printers_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.nama_printers
    ADD CONSTRAINT nama_printers_pkey PRIMARY KEY (id);


--
-- TOC entry 3768 (class 2606 OID 1745844)
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- TOC entry 3770 (class 2606 OID 1745851)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3772 (class 2606 OID 1745860)
-- Name: permasalahan_atau_perbaikans permasalahan_atau_perbaikans_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans
    ADD CONSTRAINT permasalahan_atau_perbaikans_pkey PRIMARY KEY (id);


--
-- TOC entry 3774 (class 2606 OID 1745869)
-- Name: perusahaans perusahaans_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.perusahaans
    ADD CONSTRAINT perusahaans_pkey PRIMARY KEY (id);


--
-- TOC entry 4122 (class 2606 OID 1746007)
-- Name: pos pos_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_pkey PRIMARY KEY (id);


--
-- TOC entry 3776 (class 2606 OID 1745887)
-- Name: produk_members produk_members_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_members
    ADD CONSTRAINT produk_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3778 (class 2606 OID 1745896)
-- Name: produk_vouchers produk_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_vouchers
    ADD CONSTRAINT produk_vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 3780 (class 2606 OID 1745905)
-- Name: riwayat_transaksi_ganti_nopols riwayat_transaksi_ganti_nopols_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols
    ADD CONSTRAINT riwayat_transaksi_ganti_nopols_pkey PRIMARY KEY (id);


--
-- TOC entry 3782 (class 2606 OID 1745914)
-- Name: riwayat_transaksi_kartu_members riwayat_transaksi_kartu_members_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members
    ADD CONSTRAINT riwayat_transaksi_kartu_members_pkey PRIMARY KEY (id);


--
-- TOC entry 3784 (class 2606 OID 1745921)
-- Name: shifts shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- TOC entry 3786 (class 2606 OID 1745928)
-- Name: tarif_dendas tarif_dendas_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_dendas
    ADD CONSTRAINT tarif_dendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 1745935)
-- Name: tarif_parkirs tarif_parkirs_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_parkirs
    ADD CONSTRAINT tarif_parkirs_pkey PRIMARY KEY (id);


--
-- TOC entry 3790 (class 2606 OID 1745942)
-- Name: tipe_dendas tipe_dendas_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_dendas
    ADD CONSTRAINT tipe_dendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3792 (class 2606 OID 1745949)
-- Name: tipe_kendaraans tipe_kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_kendaraans
    ADD CONSTRAINT tipe_kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 1745956)
-- Name: tipe_manlesses tipe_manlesses_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tipe_manlesses
    ADD CONSTRAINT tipe_manlesses_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 1745965)
-- Name: transaksis transaksis_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pkey PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 2277921)
-- Name: users users_nama_key; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key UNIQUE (nama);


--
-- TOC entry 3800 (class 2606 OID 2277937)
-- Name: users users_nama_key1; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key1 UNIQUE (nama);


--
-- TOC entry 3802 (class 2606 OID 2278061)
-- Name: users users_nama_key10; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key10 UNIQUE (nama);


--
-- TOC entry 3804 (class 2606 OID 2277965)
-- Name: users users_nama_key11; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key11 UNIQUE (nama);


--
-- TOC entry 3806 (class 2606 OID 2277923)
-- Name: users users_nama_key12; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key12 UNIQUE (nama);


--
-- TOC entry 3808 (class 2606 OID 2278059)
-- Name: users users_nama_key13; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key13 UNIQUE (nama);


--
-- TOC entry 3810 (class 2606 OID 2277971)
-- Name: users users_nama_key14; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key14 UNIQUE (nama);


--
-- TOC entry 3812 (class 2606 OID 2278057)
-- Name: users users_nama_key15; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key15 UNIQUE (nama);


--
-- TOC entry 3814 (class 2606 OID 2277973)
-- Name: users users_nama_key16; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key16 UNIQUE (nama);


--
-- TOC entry 3816 (class 2606 OID 2278055)
-- Name: users users_nama_key17; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key17 UNIQUE (nama);


--
-- TOC entry 3818 (class 2606 OID 2278053)
-- Name: users users_nama_key18; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key18 UNIQUE (nama);


--
-- TOC entry 3820 (class 2606 OID 2277981)
-- Name: users users_nama_key19; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key19 UNIQUE (nama);


--
-- TOC entry 3822 (class 2606 OID 2277919)
-- Name: users users_nama_key2; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key2 UNIQUE (nama);


--
-- TOC entry 3824 (class 2606 OID 2278001)
-- Name: users users_nama_key20; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key20 UNIQUE (nama);


--
-- TOC entry 3826 (class 2606 OID 2277999)
-- Name: users users_nama_key21; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key21 UNIQUE (nama);


--
-- TOC entry 3828 (class 2606 OID 2277997)
-- Name: users users_nama_key22; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key22 UNIQUE (nama);


--
-- TOC entry 3830 (class 2606 OID 2277983)
-- Name: users users_nama_key23; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key23 UNIQUE (nama);


--
-- TOC entry 3832 (class 2606 OID 2277995)
-- Name: users users_nama_key24; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key24 UNIQUE (nama);


--
-- TOC entry 3834 (class 2606 OID 2277989)
-- Name: users users_nama_key25; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key25 UNIQUE (nama);


--
-- TOC entry 3836 (class 2606 OID 2277985)
-- Name: users users_nama_key26; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key26 UNIQUE (nama);


--
-- TOC entry 3838 (class 2606 OID 2277987)
-- Name: users users_nama_key27; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key27 UNIQUE (nama);


--
-- TOC entry 3840 (class 2606 OID 2277935)
-- Name: users users_nama_key28; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key28 UNIQUE (nama);


--
-- TOC entry 3842 (class 2606 OID 2277925)
-- Name: users users_nama_key29; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key29 UNIQUE (nama);


--
-- TOC entry 3844 (class 2606 OID 2277941)
-- Name: users users_nama_key3; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key3 UNIQUE (nama);


--
-- TOC entry 3846 (class 2606 OID 2277927)
-- Name: users users_nama_key30; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key30 UNIQUE (nama);


--
-- TOC entry 3848 (class 2606 OID 2277933)
-- Name: users users_nama_key31; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key31 UNIQUE (nama);


--
-- TOC entry 3850 (class 2606 OID 2277929)
-- Name: users users_nama_key32; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key32 UNIQUE (nama);


--
-- TOC entry 3852 (class 2606 OID 2277931)
-- Name: users users_nama_key33; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key33 UNIQUE (nama);


--
-- TOC entry 3854 (class 2606 OID 2278051)
-- Name: users users_nama_key34; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key34 UNIQUE (nama);


--
-- TOC entry 3856 (class 2606 OID 2278069)
-- Name: users users_nama_key35; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key35 UNIQUE (nama);


--
-- TOC entry 3858 (class 2606 OID 2278049)
-- Name: users users_nama_key36; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key36 UNIQUE (nama);


--
-- TOC entry 3860 (class 2606 OID 2278029)
-- Name: users users_nama_key37; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key37 UNIQUE (nama);


--
-- TOC entry 3862 (class 2606 OID 2278003)
-- Name: users users_nama_key38; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key38 UNIQUE (nama);


--
-- TOC entry 3864 (class 2606 OID 2278027)
-- Name: users users_nama_key39; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key39 UNIQUE (nama);


--
-- TOC entry 3866 (class 2606 OID 2277943)
-- Name: users users_nama_key4; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key4 UNIQUE (nama);


--
-- TOC entry 3868 (class 2606 OID 2278005)
-- Name: users users_nama_key40; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key40 UNIQUE (nama);


--
-- TOC entry 3870 (class 2606 OID 2278025)
-- Name: users users_nama_key41; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key41 UNIQUE (nama);


--
-- TOC entry 3872 (class 2606 OID 2278021)
-- Name: users users_nama_key42; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key42 UNIQUE (nama);


--
-- TOC entry 3874 (class 2606 OID 2278023)
-- Name: users users_nama_key43; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key43 UNIQUE (nama);


--
-- TOC entry 3876 (class 2606 OID 2277977)
-- Name: users users_nama_key44; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key44 UNIQUE (nama);


--
-- TOC entry 3878 (class 2606 OID 2278047)
-- Name: users users_nama_key45; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key45 UNIQUE (nama);


--
-- TOC entry 3880 (class 2606 OID 2277979)
-- Name: users users_nama_key46; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key46 UNIQUE (nama);


--
-- TOC entry 3882 (class 2606 OID 2278045)
-- Name: users users_nama_key47; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key47 UNIQUE (nama);


--
-- TOC entry 3884 (class 2606 OID 2278031)
-- Name: users users_nama_key48; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key48 UNIQUE (nama);


--
-- TOC entry 3886 (class 2606 OID 2278043)
-- Name: users users_nama_key49; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key49 UNIQUE (nama);


--
-- TOC entry 3888 (class 2606 OID 2278067)
-- Name: users users_nama_key5; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key5 UNIQUE (nama);


--
-- TOC entry 3890 (class 2606 OID 2278035)
-- Name: users users_nama_key50; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key50 UNIQUE (nama);


--
-- TOC entry 3892 (class 2606 OID 2278037)
-- Name: users users_nama_key51; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key51 UNIQUE (nama);


--
-- TOC entry 3894 (class 2606 OID 2278041)
-- Name: users users_nama_key52; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key52 UNIQUE (nama);


--
-- TOC entry 3896 (class 2606 OID 2278039)
-- Name: users users_nama_key53; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key53 UNIQUE (nama);


--
-- TOC entry 3898 (class 2606 OID 2278019)
-- Name: users users_nama_key54; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key54 UNIQUE (nama);


--
-- TOC entry 3900 (class 2606 OID 2277993)
-- Name: users users_nama_key55; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key55 UNIQUE (nama);


--
-- TOC entry 3902 (class 2606 OID 2278017)
-- Name: users users_nama_key56; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key56 UNIQUE (nama);


--
-- TOC entry 3904 (class 2606 OID 2278007)
-- Name: users users_nama_key57; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key57 UNIQUE (nama);


--
-- TOC entry 3906 (class 2606 OID 2278015)
-- Name: users users_nama_key58; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key58 UNIQUE (nama);


--
-- TOC entry 3908 (class 2606 OID 2278011)
-- Name: users users_nama_key59; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key59 UNIQUE (nama);


--
-- TOC entry 3910 (class 2606 OID 2278065)
-- Name: users users_nama_key6; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key6 UNIQUE (nama);


--
-- TOC entry 3912 (class 2606 OID 2278013)
-- Name: users users_nama_key60; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key60 UNIQUE (nama);


--
-- TOC entry 3914 (class 2606 OID 2277939)
-- Name: users users_nama_key61; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key61 UNIQUE (nama);


--
-- TOC entry 3916 (class 2606 OID 2277963)
-- Name: users users_nama_key62; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key62 UNIQUE (nama);


--
-- TOC entry 3918 (class 2606 OID 2277949)
-- Name: users users_nama_key63; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key63 UNIQUE (nama);


--
-- TOC entry 3920 (class 2606 OID 2277961)
-- Name: users users_nama_key64; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key64 UNIQUE (nama);


--
-- TOC entry 3922 (class 2606 OID 2277951)
-- Name: users users_nama_key65; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key65 UNIQUE (nama);


--
-- TOC entry 3924 (class 2606 OID 2277959)
-- Name: users users_nama_key66; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key66 UNIQUE (nama);


--
-- TOC entry 3926 (class 2606 OID 2277975)
-- Name: users users_nama_key67; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key67 UNIQUE (nama);


--
-- TOC entry 3928 (class 2606 OID 2277957)
-- Name: users users_nama_key68; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key68 UNIQUE (nama);


--
-- TOC entry 3930 (class 2606 OID 2277991)
-- Name: users users_nama_key69; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key69 UNIQUE (nama);


--
-- TOC entry 3932 (class 2606 OID 2277945)
-- Name: users users_nama_key7; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key7 UNIQUE (nama);


--
-- TOC entry 3934 (class 2606 OID 2277967)
-- Name: users users_nama_key70; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key70 UNIQUE (nama);


--
-- TOC entry 3936 (class 2606 OID 2278009)
-- Name: users users_nama_key71; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key71 UNIQUE (nama);


--
-- TOC entry 3938 (class 2606 OID 2277955)
-- Name: users users_nama_key72; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key72 UNIQUE (nama);


--
-- TOC entry 3940 (class 2606 OID 2277953)
-- Name: users users_nama_key73; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key73 UNIQUE (nama);


--
-- TOC entry 3942 (class 2606 OID 2277969)
-- Name: users users_nama_key74; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key74 UNIQUE (nama);


--
-- TOC entry 3944 (class 2606 OID 2278071)
-- Name: users users_nama_key75; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key75 UNIQUE (nama);


--
-- TOC entry 3946 (class 2606 OID 2277917)
-- Name: users users_nama_key76; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key76 UNIQUE (nama);


--
-- TOC entry 3948 (class 2606 OID 2278073)
-- Name: users users_nama_key77; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key77 UNIQUE (nama);


--
-- TOC entry 3950 (class 2606 OID 2277915)
-- Name: users users_nama_key78; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key78 UNIQUE (nama);


--
-- TOC entry 3952 (class 2606 OID 2278033)
-- Name: users users_nama_key79; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key79 UNIQUE (nama);


--
-- TOC entry 3954 (class 2606 OID 2278063)
-- Name: users users_nama_key8; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key8 UNIQUE (nama);


--
-- TOC entry 3956 (class 2606 OID 2277947)
-- Name: users users_nama_key9; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key9 UNIQUE (nama);


--
-- TOC entry 3958 (class 2606 OID 1745974)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3960 (class 2606 OID 2278227)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3962 (class 2606 OID 2278173)
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- TOC entry 3964 (class 2606 OID 2278213)
-- Name: users users_username_key10; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);


--
-- TOC entry 3966 (class 2606 OID 2278141)
-- Name: users users_username_key11; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);


--
-- TOC entry 3968 (class 2606 OID 2278161)
-- Name: users users_username_key12; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);


--
-- TOC entry 3970 (class 2606 OID 2278159)
-- Name: users users_username_key13; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);


--
-- TOC entry 3972 (class 2606 OID 2278143)
-- Name: users users_username_key14; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);


--
-- TOC entry 3974 (class 2606 OID 2278157)
-- Name: users users_username_key15; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);


--
-- TOC entry 3976 (class 2606 OID 2278149)
-- Name: users users_username_key16; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);


--
-- TOC entry 3978 (class 2606 OID 2278155)
-- Name: users users_username_key17; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);


--
-- TOC entry 3980 (class 2606 OID 2278153)
-- Name: users users_username_key18; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);


--
-- TOC entry 3982 (class 2606 OID 2278151)
-- Name: users users_username_key19; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);


--
-- TOC entry 3984 (class 2606 OID 2278225)
-- Name: users users_username_key2; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);


--
-- TOC entry 3986 (class 2606 OID 2278183)
-- Name: users users_username_key20; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);


--
-- TOC entry 3988 (class 2606 OID 2278211)
-- Name: users users_username_key21; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);


--
-- TOC entry 3990 (class 2606 OID 2278209)
-- Name: users users_username_key22; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);


--
-- TOC entry 3992 (class 2606 OID 2278185)
-- Name: users users_username_key23; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);


--
-- TOC entry 3994 (class 2606 OID 2278207)
-- Name: users users_username_key24; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);


--
-- TOC entry 3996 (class 2606 OID 2278205)
-- Name: users users_username_key25; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);


--
-- TOC entry 3998 (class 2606 OID 2278167)
-- Name: users users_username_key26; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);


--
-- TOC entry 4000 (class 2606 OID 2278189)
-- Name: users users_username_key27; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);


--
-- TOC entry 4002 (class 2606 OID 2278163)
-- Name: users users_username_key28; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);


--
-- TOC entry 4004 (class 2606 OID 2278191)
-- Name: users users_username_key29; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);


--
-- TOC entry 4006 (class 2606 OID 2278175)
-- Name: users users_username_key3; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);


--
-- TOC entry 4008 (class 2606 OID 2278215)
-- Name: users users_username_key30; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);


--
-- TOC entry 4010 (class 2606 OID 2278135)
-- Name: users users_username_key31; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);


--
-- TOC entry 4012 (class 2606 OID 2278133)
-- Name: users users_username_key32; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);


--
-- TOC entry 4014 (class 2606 OID 2278193)
-- Name: users users_username_key33; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);


--
-- TOC entry 4016 (class 2606 OID 2278131)
-- Name: users users_username_key34; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);


--
-- TOC entry 4018 (class 2606 OID 2278195)
-- Name: users users_username_key35; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);


--
-- TOC entry 4020 (class 2606 OID 2278129)
-- Name: users users_username_key36; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);


--
-- TOC entry 4022 (class 2606 OID 2278125)
-- Name: users users_username_key37; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);


--
-- TOC entry 4024 (class 2606 OID 2278121)
-- Name: users users_username_key38; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);


--
-- TOC entry 4026 (class 2606 OID 2278119)
-- Name: users users_username_key39; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);


--
-- TOC entry 4028 (class 2606 OID 2278177)
-- Name: users users_username_key4; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);


--
-- TOC entry 4030 (class 2606 OID 2278197)
-- Name: users users_username_key40; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);


--
-- TOC entry 4032 (class 2606 OID 2278081)
-- Name: users users_username_key41; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);


--
-- TOC entry 4034 (class 2606 OID 2278199)
-- Name: users users_username_key42; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);


--
-- TOC entry 4036 (class 2606 OID 2278077)
-- Name: users users_username_key43; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key43 UNIQUE (username);


--
-- TOC entry 4038 (class 2606 OID 2278079)
-- Name: users users_username_key44; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key44 UNIQUE (username);


--
-- TOC entry 4040 (class 2606 OID 2278137)
-- Name: users users_username_key45; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key45 UNIQUE (username);


--
-- TOC entry 4042 (class 2606 OID 2278139)
-- Name: users users_username_key46; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key46 UNIQUE (username);


--
-- TOC entry 4044 (class 2606 OID 2278083)
-- Name: users users_username_key47; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key47 UNIQUE (username);


--
-- TOC entry 4046 (class 2606 OID 2278085)
-- Name: users users_username_key48; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key48 UNIQUE (username);


--
-- TOC entry 4048 (class 2606 OID 2278117)
-- Name: users users_username_key49; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key49 UNIQUE (username);


--
-- TOC entry 4050 (class 2606 OID 2278223)
-- Name: users users_username_key5; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);


--
-- TOC entry 4052 (class 2606 OID 2278087)
-- Name: users users_username_key50; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key50 UNIQUE (username);


--
-- TOC entry 4054 (class 2606 OID 2278089)
-- Name: users users_username_key51; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key51 UNIQUE (username);


--
-- TOC entry 4056 (class 2606 OID 2278111)
-- Name: users users_username_key52; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key52 UNIQUE (username);


--
-- TOC entry 4058 (class 2606 OID 2278107)
-- Name: users users_username_key53; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key53 UNIQUE (username);


--
-- TOC entry 4060 (class 2606 OID 2278145)
-- Name: users users_username_key54; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key54 UNIQUE (username);


--
-- TOC entry 4062 (class 2606 OID 2278091)
-- Name: users users_username_key55; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key55 UNIQUE (username);


--
-- TOC entry 4064 (class 2606 OID 2278105)
-- Name: users users_username_key56; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key56 UNIQUE (username);


--
-- TOC entry 4066 (class 2606 OID 2278103)
-- Name: users users_username_key57; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key57 UNIQUE (username);


--
-- TOC entry 4068 (class 2606 OID 2278171)
-- Name: users users_username_key58; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key58 UNIQUE (username);


--
-- TOC entry 4070 (class 2606 OID 2278229)
-- Name: users users_username_key59; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key59 UNIQUE (username);


--
-- TOC entry 4072 (class 2606 OID 2278219)
-- Name: users users_username_key6; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);


--
-- TOC entry 4074 (class 2606 OID 2278169)
-- Name: users users_username_key60; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key60 UNIQUE (username);


--
-- TOC entry 4076 (class 2606 OID 2278231)
-- Name: users users_username_key61; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key61 UNIQUE (username);


--
-- TOC entry 4078 (class 2606 OID 2278233)
-- Name: users users_username_key62; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key62 UNIQUE (username);


--
-- TOC entry 4080 (class 2606 OID 2278109)
-- Name: users users_username_key63; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key63 UNIQUE (username);


--
-- TOC entry 4082 (class 2606 OID 2278123)
-- Name: users users_username_key64; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key64 UNIQUE (username);


--
-- TOC entry 4084 (class 2606 OID 2278097)
-- Name: users users_username_key65; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key65 UNIQUE (username);


--
-- TOC entry 4086 (class 2606 OID 2278099)
-- Name: users users_username_key66; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key66 UNIQUE (username);


--
-- TOC entry 4088 (class 2606 OID 2278101)
-- Name: users users_username_key67; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key67 UNIQUE (username);


--
-- TOC entry 4090 (class 2606 OID 2278201)
-- Name: users users_username_key68; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key68 UNIQUE (username);


--
-- TOC entry 4092 (class 2606 OID 2278203)
-- Name: users users_username_key69; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key69 UNIQUE (username);


--
-- TOC entry 4094 (class 2606 OID 2278179)
-- Name: users users_username_key7; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);


--
-- TOC entry 4096 (class 2606 OID 2278093)
-- Name: users users_username_key70; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key70 UNIQUE (username);


--
-- TOC entry 4098 (class 2606 OID 2278095)
-- Name: users users_username_key71; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key71 UNIQUE (username);


--
-- TOC entry 4100 (class 2606 OID 2278113)
-- Name: users users_username_key72; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key72 UNIQUE (username);


--
-- TOC entry 4102 (class 2606 OID 2278147)
-- Name: users users_username_key73; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key73 UNIQUE (username);


--
-- TOC entry 4104 (class 2606 OID 2278127)
-- Name: users users_username_key74; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key74 UNIQUE (username);


--
-- TOC entry 4106 (class 2606 OID 2278187)
-- Name: users users_username_key75; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key75 UNIQUE (username);


--
-- TOC entry 4108 (class 2606 OID 2278115)
-- Name: users users_username_key76; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key76 UNIQUE (username);


--
-- TOC entry 4110 (class 2606 OID 2278221)
-- Name: users users_username_key77; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key77 UNIQUE (username);


--
-- TOC entry 4112 (class 2606 OID 2278165)
-- Name: users users_username_key78; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key78 UNIQUE (username);


--
-- TOC entry 4114 (class 2606 OID 2278235)
-- Name: users users_username_key79; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key79 UNIQUE (username);


--
-- TOC entry 4116 (class 2606 OID 2278217)
-- Name: users users_username_key8; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);


--
-- TOC entry 4118 (class 2606 OID 2278181)
-- Name: users users_username_key9; Type: CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);


--
-- TOC entry 4123 (class 2606 OID 2277386)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_data_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_data_member_id_fkey FOREIGN KEY (data_member_id) REFERENCES public.data_members(id) ON UPDATE CASCADE;


--
-- TOC entry 4124 (class 2606 OID 2277376)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4125 (class 2606 OID 2277381)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_petugas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_petugas_id_fkey FOREIGN KEY (petugas_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4159 (class 2606 OID 2277391)
-- Name: data_members data_members_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


--
-- TOC entry 4160 (class 2606 OID 2277396)
-- Name: data_members data_members_produk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_produk_id_fkey FOREIGN KEY (produk_id) REFERENCES public.produk_members(id) ON UPDATE CASCADE;


--
-- TOC entry 4161 (class 2606 OID 2277401)
-- Name: data_members data_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4126 (class 2606 OID 2277406)
-- Name: data_nomor_polisis data_nomor_polisis_data_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_data_member_id_fkey FOREIGN KEY (data_member_id) REFERENCES public.data_members(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4127 (class 2606 OID 2277411)
-- Name: data_nomor_polisis data_nomor_polisis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4128 (class 2606 OID 2277591)
-- Name: data_vouchers data_vouchers_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4129 (class 2606 OID 2277586)
-- Name: data_vouchers data_vouchers_produk_voucher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_produk_voucher_id_fkey FOREIGN KEY (produk_voucher_id) REFERENCES public.produk_vouchers(id) ON UPDATE CASCADE;


--
-- TOC entry 4130 (class 2606 OID 2277596)
-- Name: kendaraans kendaraans_tipe_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_tipe_kendaraan_id_fkey FOREIGN KEY (tipe_kendaraan_id) REFERENCES public.tipe_kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4131 (class 2606 OID 2277601)
-- Name: kendaraans kendaraans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4132 (class 2606 OID 2277606)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_gerbang_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_gerbang_masuk_id_fkey FOREIGN KEY (gerbang_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4133 (class 2606 OID 2277611)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_jenis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_jenis_kendaraan_id_fkey FOREIGN KEY (jenis_kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4134 (class 2606 OID 2277616)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_pintu_keluar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_pintu_keluar_id_fkey FOREIGN KEY (pintu_keluar_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4135 (class 2606 OID 2277621)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_pintu_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_pintu_masuk_id_fkey FOREIGN KEY (pintu_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4136 (class 2606 OID 2277626)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4137 (class 2606 OID 2277797)
-- Name: level_penggunas level_penggunas_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


--
-- TOC entry 4138 (class 2606 OID 2277802)
-- Name: permasalahan_atau_perbaikans permasalahan_atau_perbaikans_pos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans
    ADD CONSTRAINT permasalahan_atau_perbaikans_pos_id_fkey FOREIGN KEY (pos_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4139 (class 2606 OID 2277807)
-- Name: perusahaans perusahaans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.perusahaans
    ADD CONSTRAINT perusahaans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4162 (class 2606 OID 2277822)
-- Name: pos pos_nama_interface_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_nama_interface_id_fkey FOREIGN KEY (nama_interface_id) REFERENCES public.nama_interfaces(id) ON UPDATE CASCADE;


--
-- TOC entry 4163 (class 2606 OID 2277817)
-- Name: pos pos_nama_printer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_nama_printer_id_fkey FOREIGN KEY (nama_printer_id) REFERENCES public.nama_printers(id) ON UPDATE CASCADE;


--
-- TOC entry 4164 (class 2606 OID 2277812)
-- Name: pos pos_tipe_manless_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_tipe_manless_id_fkey FOREIGN KEY (tipe_manless_id) REFERENCES public.tipe_manlesses(id) ON UPDATE CASCADE;


--
-- TOC entry 4165 (class 2606 OID 2277827)
-- Name: pos pos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4140 (class 2606 OID 2277832)
-- Name: produk_members produk_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_members
    ADD CONSTRAINT produk_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4141 (class 2606 OID 2277837)
-- Name: produk_vouchers produk_vouchers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.produk_vouchers
    ADD CONSTRAINT produk_vouchers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4142 (class 2606 OID 2277842)
-- Name: riwayat_transaksi_ganti_nopols riwayat_transaksi_ganti_nopols_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols
    ADD CONSTRAINT riwayat_transaksi_ganti_nopols_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4143 (class 2606 OID 2277847)
-- Name: riwayat_transaksi_kartu_members riwayat_transaksi_kartu_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members
    ADD CONSTRAINT riwayat_transaksi_kartu_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4144 (class 2606 OID 2277852)
-- Name: shifts shifts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4145 (class 2606 OID 2277857)
-- Name: tarif_dendas tarif_dendas_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_dendas
    ADD CONSTRAINT tarif_dendas_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4146 (class 2606 OID 2277862)
-- Name: tarif_parkirs tarif_parkirs_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.tarif_parkirs
    ADD CONSTRAINT tarif_parkirs_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4147 (class 2606 OID 2277907)
-- Name: transaksis transaksis_id_data_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_id_data_member_fkey FOREIGN KEY (id_data_member) REFERENCES public.data_members(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4148 (class 2606 OID 2277902)
-- Name: transaksis transaksis_id_data_voucher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_id_data_voucher_fkey FOREIGN KEY (id_data_voucher) REFERENCES public.data_vouchers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4149 (class 2606 OID 2277897)
-- Name: transaksis transaksis_jenis_pembayaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_jenis_pembayaran_id_fkey FOREIGN KEY (jenis_pembayaran_id) REFERENCES public.payments(id) ON UPDATE CASCADE;


--
-- TOC entry 4150 (class 2606 OID 2277872)
-- Name: transaksis transaksis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 4151 (class 2606 OID 2277882)
-- Name: transaksis transaksis_petugas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_petugas_id_fkey FOREIGN KEY (petugas_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4152 (class 2606 OID 2277877)
-- Name: transaksis transaksis_pintu_keluar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pintu_keluar_id_fkey FOREIGN KEY (pintu_keluar_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4153 (class 2606 OID 2277867)
-- Name: transaksis transaksis_pintu_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pintu_masuk_id_fkey FOREIGN KEY (pintu_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 4154 (class 2606 OID 2277887)
-- Name: transaksis transaksis_shift_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_shift_id_fkey FOREIGN KEY (shift_id) REFERENCES public.shifts(id) ON UPDATE CASCADE;


--
-- TOC entry 4155 (class 2606 OID 2277892)
-- Name: transaksis transaksis_tipe_denda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_tipe_denda_id_fkey FOREIGN KEY (tipe_denda_id) REFERENCES public.tipe_dendas(id) ON UPDATE CASCADE;


--
-- TOC entry 4156 (class 2606 OID 2278246)
-- Name: users users_added_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_added_by_fkey FOREIGN KEY (added_by) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 4157 (class 2606 OID 2278241)
-- Name: users users_level_pengguna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_level_pengguna_id_fkey FOREIGN KEY (level_pengguna_id) REFERENCES public.level_penggunas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4158 (class 2606 OID 2278236)
-- Name: users users_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evolusipark_owner
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: evolusipark_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- TOC entry 2245 (class 826 OID 1392641)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2244 (class 826 OID 1392640)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-07-30 13:29:58

--
-- PostgreSQL database dump complete
--

