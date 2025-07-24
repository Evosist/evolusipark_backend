--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-07-24 13:07:45

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
-- TOC entry 986 (class 1247 OID 1979548)
-- Name: enum_aktivitas_gerbang_kendaraans_buka_atau_tutup; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_buka_atau_tutup AS ENUM (
    'Buka',
    'Tutup',
    'Terbuka',
    'Tertutup'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_buka_atau_tutup OWNER TO postgres;

--
-- TOC entry 1024 (class 1247 OID 3083898)
-- Name: enum_aktivitas_gerbang_kendaraans_lokasi_gerbang; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_lokasi_gerbang AS ENUM (
    'Masuk',
    'Keluar'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_lokasi_gerbang OWNER TO postgres;

--
-- TOC entry 989 (class 1247 OID 1979554)
-- Name: enum_aktivitas_gerbang_kendaraans_status_palang; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_status_palang AS ENUM (
    'Sukses',
    'Gagal',
    'Gagal (Sensor)'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_status_palang OWNER TO postgres;

--
-- TOC entry 1009 (class 1247 OID 3222101)
-- Name: enum_aktivitas_gerbang_kendaraans_tipe_gerbang; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_aktivitas_gerbang_kendaraans_tipe_gerbang AS ENUM (
    'In',
    'Out'
);


ALTER TYPE public.enum_aktivitas_gerbang_kendaraans_tipe_gerbang OWNER TO postgres;

--
-- TOC entry 1057 (class 1247 OID 2414568)
-- Name: enum_dashboard_pendapatans_periode; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_dashboard_pendapatans_periode AS ENUM (
    'hari_ini',
    'minggu_ini',
    'bulan_ini',
    'tahun_ini'
);


ALTER TYPE public.enum_dashboard_pendapatans_periode OWNER TO postgres;

--
-- TOC entry 901 (class 1247 OID 1930836)
-- Name: enum_data_vouchers_model_bayar; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_data_vouchers_model_bayar AS ENUM (
    'Check In',
    'Check Out'
);


ALTER TYPE public.enum_data_vouchers_model_bayar OWNER TO postgres;

--
-- TOC entry 904 (class 1247 OID 1930842)
-- Name: enum_data_vouchers_verifikasi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_data_vouchers_verifikasi AS ENUM (
    'Tiket',
    'Nopol'
);


ALTER TYPE public.enum_data_vouchers_verifikasi OWNER TO postgres;

--
-- TOC entry 907 (class 1247 OID 1930848)
-- Name: enum_kendaraans_tipe_kendaraan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_kendaraans_tipe_kendaraan AS ENUM (
    'Mobil',
    'Motor',
    'All'
);


ALTER TYPE public.enum_kendaraans_tipe_kendaraan OWNER TO postgres;

--
-- TOC entry 910 (class 1247 OID 1930856)
-- Name: enum_permasalahan_atau_perbaikans_kategori_permasalahan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_kategori_permasalahan AS ENUM (
    'Hardware/Alat',
    'Sistem',
    'SDM',
    'Operasional',
    'Lain-lain'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_kategori_permasalahan OWNER TO postgres;

--
-- TOC entry 913 (class 1247 OID 1930868)
-- Name: enum_permasalahan_atau_perbaikans_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_status AS ENUM (
    'Pending',
    'On Progress',
    'Done'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_status OWNER TO postgres;

--
-- TOC entry 916 (class 1247 OID 1930876)
-- Name: enum_permasalahan_atau_perbaikans_status_perbaikan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_status_perbaikan AS ENUM (
    'Pending',
    'On Progress',
    'Done'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_status_perbaikan OWNER TO postgres;

--
-- TOC entry 919 (class 1247 OID 1930884)
-- Name: enum_permasalahan_atau_perbaikans_status_permasalahan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_permasalahan_atau_perbaikans_status_permasalahan AS ENUM (
    'Pending',
    'On Progress',
    'Done'
);


ALTER TYPE public.enum_permasalahan_atau_perbaikans_status_permasalahan OWNER TO postgres;

--
-- TOC entry 983 (class 1247 OID 1938201)
-- Name: enum_perusahaans_jenis_perusahaan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_perusahaans_jenis_perusahaan AS ENUM (
    'Pemilik Gedung',
    'Pemilik Kendaraan',
    'Tenant',
    'Developer'
);


ALTER TYPE public.enum_perusahaans_jenis_perusahaan OWNER TO postgres;

--
-- TOC entry 922 (class 1247 OID 1930892)
-- Name: enum_pos_nama_interface; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_nama_interface AS ENUM (
    'BGI',
    'TWS',
    'PAWL',
    'SMART PARKING',
    'SER TELINKS',
    'USB TELINKS'
);


ALTER TYPE public.enum_pos_nama_interface OWNER TO postgres;

--
-- TOC entry 925 (class 1247 OID 1930906)
-- Name: enum_pos_nama_printer; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_nama_printer AS ENUM (
    'Epson TM-T81 Receipt',
    'Epson TM-T82 Receipt',
    'Epson TM-U220 Receipt',
    ''
);


ALTER TYPE public.enum_pos_nama_printer OWNER TO postgres;

--
-- TOC entry 992 (class 1247 OID 2284079)
-- Name: enum_pos_nama_printer_id; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_nama_printer_id AS ENUM (
    'Epson TM-T81 Receipt',
    'Epson TM-T82 Receipt',
    'Epson TM-U220 Receipt',
    'Epson TM-T88III Receipt',
    'Epson TM-T88IV Receipt',
    'Epson TM-T88V Receipt',
    'Epson TM-T82II Receipt'
);


ALTER TYPE public.enum_pos_nama_printer_id OWNER TO postgres;

--
-- TOC entry 928 (class 1247 OID 1930916)
-- Name: enum_pos_tipe_kendaraan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_tipe_kendaraan AS ENUM (
    'Mobil',
    'Motor',
    'All'
);


ALTER TYPE public.enum_pos_tipe_kendaraan OWNER TO postgres;

--
-- TOC entry 931 (class 1247 OID 1930924)
-- Name: enum_pos_tipe_manless; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_tipe_manless AS ENUM (
    'Loop 1 with Button',
    'Loop 1 with Button and Feedback',
    'Feedback with Button',
    'Button Only'
);


ALTER TYPE public.enum_pos_tipe_manless OWNER TO postgres;

--
-- TOC entry 934 (class 1247 OID 1930934)
-- Name: enum_pos_tipe_pos; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pos_tipe_pos AS ENUM (
    'In',
    'Out'
);


ALTER TYPE public.enum_pos_tipe_pos OWNER TO postgres;

--
-- TOC entry 937 (class 1247 OID 1930940)
-- Name: enum_produk_members_periode_unit; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_produk_members_periode_unit AS ENUM (
    'Hari',
    'Bulan',
    'Tahun'
);


ALTER TYPE public.enum_produk_members_periode_unit OWNER TO postgres;

--
-- TOC entry 940 (class 1247 OID 1930948)
-- Name: enum_produk_vouchers_metode_verifikasi; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_produk_vouchers_metode_verifikasi AS ENUM (
    'Tiket',
    'Nopol'
);


ALTER TYPE public.enum_produk_vouchers_metode_verifikasi OWNER TO postgres;

--
-- TOC entry 943 (class 1247 OID 1930954)
-- Name: enum_produk_vouchers_model_pembayaran; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_produk_vouchers_model_pembayaran AS ENUM (
    'Check In',
    'Check Out'
);


ALTER TYPE public.enum_produk_vouchers_model_pembayaran OWNER TO postgres;

--
-- TOC entry 946 (class 1247 OID 1930960)
-- Name: enum_produk_vouchers_periode_unit; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_produk_vouchers_periode_unit AS ENUM (
    'Keluar',
    'Hari',
    'Bulan'
);


ALTER TYPE public.enum_produk_vouchers_periode_unit OWNER TO postgres;

--
-- TOC entry 949 (class 1247 OID 1930968)
-- Name: enum_users_jenis_kelamin; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_jenis_kelamin AS ENUM (
    'Laki-laki',
    'Perempuan'
);


ALTER TYPE public.enum_users_jenis_kelamin OWNER TO postgres;

--
-- TOC entry 952 (class 1247 OID 1930974)
-- Name: enum_users_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_level AS ENUM (
    'Administrator',
    'Operator',
    'Reporting',
    'No Akses',
    'Kepala Lokasi',
    'Front Office'
);


ALTER TYPE public.enum_users_level OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 262 (class 1259 OID 3223174)
-- Name: aktivitas_gerbang_kendaraans; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.aktivitas_gerbang_kendaraans OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 3223173)
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq OWNER TO postgres;

--
-- TOC entry 6440 (class 0 OID 0)
-- Dependencies: 261
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aktivitas_gerbang_kendaraans_id_seq OWNED BY public.aktivitas_gerbang_kendaraans.id;


--
-- TOC entry 264 (class 1259 OID 3256360)
-- Name: data_members; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.data_members OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 3256359)
-- Name: data_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_members_id_seq OWNER TO postgres;

--
-- TOC entry 6441 (class 0 OID 0)
-- Dependencies: 263
-- Name: data_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_members_id_seq OWNED BY public.data_members.id;


--
-- TOC entry 218 (class 1259 OID 3216992)
-- Name: data_nomor_polisis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_nomor_polisis (
    id integer NOT NULL,
    data_member_id integer,
    kendaraan_id integer,
    nomor_polisi character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.data_nomor_polisis OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 3216991)
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_nomor_polisis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_nomor_polisis_id_seq OWNER TO postgres;

--
-- TOC entry 6442 (class 0 OID 0)
-- Dependencies: 217
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_nomor_polisis_id_seq OWNED BY public.data_nomor_polisis.id;


--
-- TOC entry 268 (class 1259 OID 3262033)
-- Name: data_vouchers; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.data_vouchers OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 3262032)
-- Name: data_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_vouchers_id_seq OWNER TO postgres;

--
-- TOC entry 6443 (class 0 OID 0)
-- Dependencies: 267
-- Name: data_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_vouchers_id_seq OWNED BY public.data_vouchers.id;


--
-- TOC entry 220 (class 1259 OID 3217010)
-- Name: global_settings; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.global_settings OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 3217009)
-- Name: global_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.global_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.global_settings_id_seq OWNER TO postgres;

--
-- TOC entry 6444 (class 0 OID 0)
-- Dependencies: 219
-- Name: global_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.global_settings_id_seq OWNED BY public.global_settings.id;


--
-- TOC entry 222 (class 1259 OID 3217019)
-- Name: kendaraans; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.kendaraans OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 3217018)
-- Name: kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kendaraans_id_seq OWNER TO postgres;

--
-- TOC entry 6445 (class 0 OID 0)
-- Dependencies: 221
-- Name: kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kendaraans_id_seq OWNED BY public.kendaraans.id;


--
-- TOC entry 224 (class 1259 OID 3217026)
-- Name: laporan_riwayat_transaksi_members; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.laporan_riwayat_transaksi_members OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 3217025)
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laporan_riwayat_transaksi_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laporan_riwayat_transaksi_members_id_seq OWNER TO postgres;

--
-- TOC entry 6446 (class 0 OID 0)
-- Dependencies: 223
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laporan_riwayat_transaksi_members_id_seq OWNED BY public.laporan_riwayat_transaksi_members.id;


--
-- TOC entry 272 (class 1259 OID 3315425)
-- Name: laporan_transaksi_batals; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.laporan_transaksi_batals OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 3315424)
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laporan_transaksi_batals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laporan_transaksi_batals_id_seq OWNER TO postgres;

--
-- TOC entry 6447 (class 0 OID 0)
-- Dependencies: 271
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laporan_transaksi_batals_id_seq OWNED BY public.laporan_transaksi_batals.id;


--
-- TOC entry 226 (class 1259 OID 3217044)
-- Name: level_penggunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_penggunas (
    id integer NOT NULL,
    nama character varying(255),
    hak_akses jsonb,
    perusahaan_id integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.level_penggunas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 3217043)
-- Name: level_penggunas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.level_penggunas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.level_penggunas_id_seq OWNER TO postgres;

--
-- TOC entry 6448 (class 0 OID 0)
-- Dependencies: 225
-- Name: level_penggunas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.level_penggunas_id_seq OWNED BY public.level_penggunas.id;


--
-- TOC entry 228 (class 1259 OID 3217055)
-- Name: nama_interfaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nama_interfaces (
    id integer NOT NULL,
    nama_interface character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.nama_interfaces OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 3217054)
-- Name: nama_interfaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nama_interfaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nama_interfaces_id_seq OWNER TO postgres;

--
-- TOC entry 6449 (class 0 OID 0)
-- Dependencies: 227
-- Name: nama_interfaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nama_interfaces_id_seq OWNED BY public.nama_interfaces.id;


--
-- TOC entry 230 (class 1259 OID 3217062)
-- Name: nama_printers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nama_printers (
    id integer NOT NULL,
    nama_printer character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.nama_printers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 3217061)
-- Name: nama_printers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nama_printers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nama_printers_id_seq OWNER TO postgres;

--
-- TOC entry 6450 (class 0 OID 0)
-- Dependencies: 229
-- Name: nama_printers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nama_printers_id_seq OWNED BY public.nama_printers.id;


--
-- TOC entry 232 (class 1259 OID 3217069)
-- Name: parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parameters (
    id integer NOT NULL,
    nama character varying(255),
    nilai character varying(255),
    keterangan character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.parameters OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 3217068)
-- Name: parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parameters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parameters_id_seq OWNER TO postgres;

--
-- TOC entry 6451 (class 0 OID 0)
-- Dependencies: 231
-- Name: parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parameters_id_seq OWNED BY public.parameters.id;


--
-- TOC entry 234 (class 1259 OID 3217078)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    jenis_payment character varying(255),
    status boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 3217077)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 6452 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 236 (class 1259 OID 3217085)
-- Name: permasalahan_atau_perbaikans; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.permasalahan_atau_perbaikans OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 3217084)
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permasalahan_atau_perbaikans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permasalahan_atau_perbaikans_id_seq OWNER TO postgres;

--
-- TOC entry 6453 (class 0 OID 0)
-- Dependencies: 235
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permasalahan_atau_perbaikans_id_seq OWNED BY public.permasalahan_atau_perbaikans.id;


--
-- TOC entry 238 (class 1259 OID 3217094)
-- Name: perusahaans; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.perusahaans OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 3217093)
-- Name: perusahaans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perusahaans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perusahaans_id_seq OWNER TO postgres;

--
-- TOC entry 6454 (class 0 OID 0)
-- Dependencies: 237
-- Name: perusahaans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perusahaans_id_seq OWNED BY public.perusahaans.id;


--
-- TOC entry 240 (class 1259 OID 3217103)
-- Name: pos; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.pos OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 3217102)
-- Name: pos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pos_id_seq OWNER TO postgres;

--
-- TOC entry 6455 (class 0 OID 0)
-- Dependencies: 239
-- Name: pos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pos_id_seq OWNED BY public.pos.id;


--
-- TOC entry 242 (class 1259 OID 3217112)
-- Name: produk_members; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.produk_members OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 3217111)
-- Name: produk_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produk_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produk_members_id_seq OWNER TO postgres;

--
-- TOC entry 6456 (class 0 OID 0)
-- Dependencies: 241
-- Name: produk_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produk_members_id_seq OWNED BY public.produk_members.id;


--
-- TOC entry 266 (class 1259 OID 3261815)
-- Name: produk_vouchers; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.produk_vouchers OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 3261814)
-- Name: produk_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produk_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produk_vouchers_id_seq OWNER TO postgres;

--
-- TOC entry 6457 (class 0 OID 0)
-- Dependencies: 265
-- Name: produk_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produk_vouchers_id_seq OWNED BY public.produk_vouchers.id;


--
-- TOC entry 244 (class 1259 OID 3217130)
-- Name: riwayat_transaksi_ganti_nopols; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.riwayat_transaksi_ganti_nopols OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 3217129)
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq OWNER TO postgres;

--
-- TOC entry 6458 (class 0 OID 0)
-- Dependencies: 243
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwayat_transaksi_ganti_nopols_id_seq OWNED BY public.riwayat_transaksi_ganti_nopols.id;


--
-- TOC entry 246 (class 1259 OID 3217139)
-- Name: riwayat_transaksi_kartu_members; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.riwayat_transaksi_kartu_members OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 3217138)
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwayat_transaksi_kartu_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwayat_transaksi_kartu_members_id_seq OWNER TO postgres;

--
-- TOC entry 6459 (class 0 OID 0)
-- Dependencies: 245
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwayat_transaksi_kartu_members_id_seq OWNED BY public.riwayat_transaksi_kartu_members.id;


--
-- TOC entry 248 (class 1259 OID 3217148)
-- Name: shifts; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.shifts OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 3217147)
-- Name: shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shifts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shifts_id_seq OWNER TO postgres;

--
-- TOC entry 6460 (class 0 OID 0)
-- Dependencies: 247
-- Name: shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shifts_id_seq OWNED BY public.shifts.id;


--
-- TOC entry 250 (class 1259 OID 3217155)
-- Name: tarif_dendas; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.tarif_dendas OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 3217154)
-- Name: tarif_dendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarif_dendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarif_dendas_id_seq OWNER TO postgres;

--
-- TOC entry 6461 (class 0 OID 0)
-- Dependencies: 249
-- Name: tarif_dendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarif_dendas_id_seq OWNED BY public.tarif_dendas.id;


--
-- TOC entry 252 (class 1259 OID 3217162)
-- Name: tarif_parkirs; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.tarif_parkirs OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 3217161)
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarif_parkirs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tarif_parkirs_id_seq OWNER TO postgres;

--
-- TOC entry 6462 (class 0 OID 0)
-- Dependencies: 251
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarif_parkirs_id_seq OWNED BY public.tarif_parkirs.id;


--
-- TOC entry 254 (class 1259 OID 3217169)
-- Name: tipe_dendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipe_dendas (
    id integer NOT NULL,
    tipe_denda character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_dendas OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 3217168)
-- Name: tipe_dendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipe_dendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_dendas_id_seq OWNER TO postgres;

--
-- TOC entry 6463 (class 0 OID 0)
-- Dependencies: 253
-- Name: tipe_dendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipe_dendas_id_seq OWNED BY public.tipe_dendas.id;


--
-- TOC entry 256 (class 1259 OID 3217176)
-- Name: tipe_kendaraans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipe_kendaraans (
    id integer NOT NULL,
    tipe_kendaraan character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_kendaraans OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 3217175)
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipe_kendaraans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_kendaraans_id_seq OWNER TO postgres;

--
-- TOC entry 6464 (class 0 OID 0)
-- Dependencies: 255
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipe_kendaraans_id_seq OWNED BY public.tipe_kendaraans.id;


--
-- TOC entry 258 (class 1259 OID 3217183)
-- Name: tipe_manlesses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipe_manlesses (
    id integer NOT NULL,
    tipe_manless character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.tipe_manlesses OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 3217182)
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipe_manlesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipe_manlesses_id_seq OWNER TO postgres;

--
-- TOC entry 6465 (class 0 OID 0)
-- Dependencies: 257
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipe_manlesses_id_seq OWNED BY public.tipe_manlesses.id;


--
-- TOC entry 270 (class 1259 OID 3266110)
-- Name: transaksis; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.transaksis OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 3266109)
-- Name: transaksis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksis_id_seq OWNER TO postgres;

--
-- TOC entry 6466 (class 0 OID 0)
-- Dependencies: 269
-- Name: transaksis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksis_id_seq OWNED BY public.transaksis.id;


--
-- TOC entry 260 (class 1259 OID 3217208)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 3217207)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 6467 (class 0 OID 0)
-- Dependencies: 259
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4927 (class 2604 OID 3223177)
-- Name: aktivitas_gerbang_kendaraans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans ALTER COLUMN id SET DEFAULT nextval('public.aktivitas_gerbang_kendaraans_id_seq'::regclass);


--
-- TOC entry 4928 (class 2604 OID 3256363)
-- Name: data_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_members ALTER COLUMN id SET DEFAULT nextval('public.data_members_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 3216995)
-- Name: data_nomor_polisis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis ALTER COLUMN id SET DEFAULT nextval('public.data_nomor_polisis_id_seq'::regclass);


--
-- TOC entry 4930 (class 2604 OID 3262036)
-- Name: data_vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_vouchers ALTER COLUMN id SET DEFAULT nextval('public.data_vouchers_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 3217013)
-- Name: global_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings ALTER COLUMN id SET DEFAULT nextval('public.global_settings_id_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 3217022)
-- Name: kendaraans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kendaraans ALTER COLUMN id SET DEFAULT nextval('public.kendaraans_id_seq'::regclass);


--
-- TOC entry 4908 (class 2604 OID 3217029)
-- Name: laporan_riwayat_transaksi_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members ALTER COLUMN id SET DEFAULT nextval('public.laporan_riwayat_transaksi_members_id_seq'::regclass);


--
-- TOC entry 4932 (class 2604 OID 3315428)
-- Name: laporan_transaksi_batals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_transaksi_batals ALTER COLUMN id SET DEFAULT nextval('public.laporan_transaksi_batals_id_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 3217047)
-- Name: level_penggunas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas ALTER COLUMN id SET DEFAULT nextval('public.level_penggunas_id_seq'::regclass);


--
-- TOC entry 4910 (class 2604 OID 3217058)
-- Name: nama_interfaces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nama_interfaces ALTER COLUMN id SET DEFAULT nextval('public.nama_interfaces_id_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 3217065)
-- Name: nama_printers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nama_printers ALTER COLUMN id SET DEFAULT nextval('public.nama_printers_id_seq'::regclass);


--
-- TOC entry 4912 (class 2604 OID 3217072)
-- Name: parameters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters ALTER COLUMN id SET DEFAULT nextval('public.parameters_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 3217081)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 4914 (class 2604 OID 3217088)
-- Name: permasalahan_atau_perbaikans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans ALTER COLUMN id SET DEFAULT nextval('public.permasalahan_atau_perbaikans_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 3217097)
-- Name: perusahaans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perusahaans ALTER COLUMN id SET DEFAULT nextval('public.perusahaans_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 3217106)
-- Name: pos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos ALTER COLUMN id SET DEFAULT nextval('public.pos_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 3217115)
-- Name: produk_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_members ALTER COLUMN id SET DEFAULT nextval('public.produk_members_id_seq'::regclass);


--
-- TOC entry 4929 (class 2604 OID 3261818)
-- Name: produk_vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_vouchers ALTER COLUMN id SET DEFAULT nextval('public.produk_vouchers_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 3217133)
-- Name: riwayat_transaksi_ganti_nopols id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols ALTER COLUMN id SET DEFAULT nextval('public.riwayat_transaksi_ganti_nopols_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 3217142)
-- Name: riwayat_transaksi_kartu_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members ALTER COLUMN id SET DEFAULT nextval('public.riwayat_transaksi_kartu_members_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 3217151)
-- Name: shifts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shifts ALTER COLUMN id SET DEFAULT nextval('public.shifts_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 3217158)
-- Name: tarif_dendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_dendas ALTER COLUMN id SET DEFAULT nextval('public.tarif_dendas_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 3217165)
-- Name: tarif_parkirs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_parkirs ALTER COLUMN id SET DEFAULT nextval('public.tarif_parkirs_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 3217172)
-- Name: tipe_dendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_dendas ALTER COLUMN id SET DEFAULT nextval('public.tipe_dendas_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 3217179)
-- Name: tipe_kendaraans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_kendaraans ALTER COLUMN id SET DEFAULT nextval('public.tipe_kendaraans_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 3217186)
-- Name: tipe_manlesses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_manlesses ALTER COLUMN id SET DEFAULT nextval('public.tipe_manlesses_id_seq'::regclass);


--
-- TOC entry 4931 (class 2604 OID 3266113)
-- Name: transaksis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis ALTER COLUMN id SET DEFAULT nextval('public.transaksis_id_seq'::regclass);


--
-- TOC entry 4926 (class 2604 OID 3217211)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 6424 (class 0 OID 3223174)
-- Dependencies: 262
-- Data for Name: aktivitas_gerbang_kendaraans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aktivitas_gerbang_kendaraans (id, tiket, plat_nomor, kendaraan_id, waktu, lokasi_gerbang, buka_atau_tutup, petugas_id, status_palang, tipe_gerbang, data_member_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 6426 (class 0 OID 3256360)
-- Dependencies: 264
-- Data for Name: data_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_members (id, nama, no_hp, perusahaan_id, akses_tiket, akses_kartu, no_kartu, tgl_input, produk_id, tarif, biaya_member, biaya_kartu, periode, user_id, "createdAt", "updatedAt") FROM stdin;
1	Itmamul Fahmi	082102342343	1	t	t	4435345345345	2000-05-31 07:00:00+07	1	50000	50000	50000	[2025-06-01,2025-06-03)	1	2025-07-18 17:09:04.718+07	2025-07-18 17:09:04.718+07
2	Maska Nuwaila Syairoji	89765467890234	1	t	t	3453535345345	2025-07-21 00:00:00+07	2	5000	5000	10000	[2025-07-01,2025-07-31)	1	2025-07-21 10:23:11.113+07	2025-07-21 10:23:11.113+07
\.


--
-- TOC entry 6380 (class 0 OID 3216992)
-- Dependencies: 218
-- Data for Name: data_nomor_polisis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_nomor_polisis (id, data_member_id, kendaraan_id, nomor_polisi, "createdAt", "updatedAt") FROM stdin;
10	1	1	AB1234AC	2025-07-18 17:09:04.849+07	2025-07-18 17:09:04.849+07
11	1	1	AB1235AC	2025-07-18 17:09:04.849+07	2025-07-18 17:09:04.849+07
12	1	1	AB1236AC	2025-07-18 17:09:04.849+07	2025-07-18 17:09:04.849+07
13	2	1	R3453B	2025-07-21 10:23:11.338+07	2025-07-21 10:23:11.338+07
14	2	1	R2342C	2025-07-21 10:23:11.338+07	2025-07-21 10:23:11.338+07
\.


--
-- TOC entry 6430 (class 0 OID 3262033)
-- Dependencies: 268
-- Data for Name: data_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.data_vouchers (id, produk_voucher_id, periode, diskon, model_bayar, verifikasi, no_tiket, nomor_polisi, kendaraan_id, keterangan, "createdAt", "updatedAt") FROM stdin;
1	1	[2025-06-01,2025-06-03)	2000	Check In	Tiket	\N	\N	1	Data Voucher	2025-07-21 10:15:06.233+07	2025-07-21 10:15:06.233+07
2	2	[2025-06-01,2025-06-03)	1300	Check In	Tiket	\N	\N	1	Data Voucher	2025-07-21 10:15:06.233+07	2025-07-21 10:15:06.233+07
\.


--
-- TOC entry 6382 (class 0 OID 3217010)
-- Dependencies: 220
-- Data for Name: global_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_settings (id, nama_operator, email_operator, no_telp_operator, no_fax_operator, alamat_operator, nama_lokasi, email_lokasi, no_telp_lokasi, no_fax_lokasi, alamat_lokasi, "createdAt", "updatedAt") FROM stdin;
1	Evosist Parking	evosistparking@gmail.com	08121324343	08342342423	Pekuncen, Banyumas	Pasar Megah Jaya	pasarmegahjaya@gmail.com	098768900232	08754345678	Pekuncen, Banyumas	2025-07-15 16:31:45.406+07	2025-07-15 16:31:45.406+07
\.


--
-- TOC entry 6384 (class 0 OID 3217019)
-- Dependencies: 222
-- Data for Name: kendaraans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kendaraans (id, nama_kendaraan, tipe_kendaraan_id, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Xenia	1	t	1	2025-07-15 16:33:03.799+07	2025-07-15 16:33:03.799+07
\.


--
-- TOC entry 6386 (class 0 OID 3217026)
-- Dependencies: 224
-- Data for Name: laporan_riwayat_transaksi_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laporan_riwayat_transaksi_members (id, no, nomor_tiket, waktu_masuk, gerbang_masuk_id, jenis_kendaraan_id, nomor_polisi, waktu_keluar, pintu_keluar_id, durasi_parkir, denda, total_pembayaran, jenis_transaksi, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 6434 (class 0 OID 3315425)
-- Dependencies: 272
-- Data for Name: laporan_transaksi_batals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laporan_transaksi_batals (id, no_tiket, tanggal_masuk, pintu_masuk_id, tanggal_pembatalan, alasan_pembatalan, penjelasan_pembatalan, user_id, "createdAt", "updatedAt") FROM stdin;
4	TIK2	2025-07-21 00:00:00+07	1	2025-07-23 12:48:43.8+07	Alasan Pembatalan	Penjelasan Pembatalan	\N	2025-07-23 12:48:43.8+07	2025-07-23 12:48:43.8+07
\.


--
-- TOC entry 6388 (class 0 OID 3217044)
-- Dependencies: 226
-- Data for Name: level_penggunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_penggunas (id, nama, hak_akses, perusahaan_id, "createdAt", "updatedAt") FROM stdin;
1	Super Admin	[{"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama_menu": "Dashboard", "nama_sub_menu": null}, {"nama_menu": "Master Data", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Perusahaan"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "pengaturan": true}, "nama": "Level Pengguna"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Data Pengguna"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Pos (In/Out)"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Data Kendaraan"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Produk Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "perpanjang": true, "ganti_kartu": true, "riwayat_transaksi": true, "ganti_nomor_polisi": true}, "nama": "Data Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Produk Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Data Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "aktif_nonaktif": true}, "nama": "Shift"}]}, {"nama_menu": "Laporan Data", "nama_sub_menu": [{"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Kendaraan"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Pendapatan Parkir"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "batalkan_transaksi": true}, "nama": "Transaksi Batal"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Audit Transaksi"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "unggah_file": true}, "nama": "Settlement Cashless"}]}, {"nama_menu": "Transaksi", "nama_sub_menu": [{"aksi": {"read": null, "create": true, "delete": null, "update": null}, "nama": "Tambah Transaksi"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null}, "nama": "Riwayat Transaksi"}]}, {"nama_menu": "Pengaturan", "nama_sub_menu": [{"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Tarif Parkir"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true, "aktif_nonaktif": true}, "nama": "Tarif Denda"}, {"aksi": {"read": true, "create": null, "delete": null, "update": null, "aktif_nonaktif": true}, "nama": "Pembayaran"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Parameter"}, {"aksi": {"read": true, "create": null, "delete": null, "update": true}, "nama": "Global"}]}, {"nama_menu": "Bantuan", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true, "proses_data_perbaikan": true}, "nama": "Tiket"}]}]	1	2025-07-15 16:31:05.475+07	2025-07-15 16:31:05.475+07
2	Super Administrator	[{"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama_menu": "Dashboard", "nama_sub_menu": null}, {"nama_menu": "Master", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "User"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "konfigurasi_menu": true}, "nama": "Level Akses"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Produk Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Produk Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true, "perpanjang": true, "ganti_kartu": true, "ganti_nopol": true}, "nama": "Data Member"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Data Voucher"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "POS"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Kendaraan"}, {"aksi": {"create": true, "delete": true, "update": true}, "nama": "Shift"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Perusahaan"}]}, {"nama_menu": "Setting", "nama_sub_menu": [{"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Tarif Parkir"}, {"aksi": {"read": true, "create": true, "delete": true, "update": true}, "nama": "Tarif Denda"}, {"aksi": {"read": true, "update": true}, "nama": "Parameter"}, {"aksi": {"read": true, "update": true}, "nama": "Global"}, {"aksi": {"read": true, "update": true}, "nama": "Payment"}]}, {"nama_menu": "Transaksi", "nama_sub_menu": [{"aksi": null, "nama": "Manual mix"}, {"aksi": null, "nama": "Pembatalan Transaksi"}, {"aksi": {"read": true, "delete": true, "update": true, "create_perbaikan": true, "create_permasalahan": true}, "nama": "Permasalahan atau Perbaikan"}]}, {"nama_menu": "Report", "nama_sub_menu": [{"aksi": null, "nama": "Kendaraan"}, {"aksi": null, "nama": "Overnight"}, {"aksi": null, "nama": "Pendapatan Parkir"}, {"aksi": null, "nama": "Pendapatan Gabungan"}, {"aksi": null, "nama": "Pendapatan Member"}, {"aksi": null, "nama": "Pendapatan Voucher"}, {"aksi": null, "nama": "Pembatalan Transaksi"}, {"aksi": null, "nama": "Audit Transaksi"}, {"aksi": null, "nama": "Settlement Cashless"}]}]	\N	2025-07-17 20:38:34.003+07	2025-07-17 20:38:34.003+07
\.


--
-- TOC entry 6390 (class 0 OID 3217055)
-- Dependencies: 228
-- Data for Name: nama_interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nama_interfaces (id, nama_interface, "createdAt", "updatedAt") FROM stdin;
1	BGI	2025-07-15 16:32:33.288+07	2025-07-15 16:32:33.288+07
\.


--
-- TOC entry 6392 (class 0 OID 3217062)
-- Dependencies: 230
-- Data for Name: nama_printers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nama_printers (id, nama_printer, "createdAt", "updatedAt") FROM stdin;
1	EPSON TM-T82 Receipt	2025-07-15 16:32:22.802+07	2025-07-15 16:32:22.802+07
\.


--
-- TOC entry 6394 (class 0 OID 3217069)
-- Dependencies: 232
-- Data for Name: parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parameters (id, nama, nilai, keterangan, "createdAt", "updatedAt") FROM stdin;
1	Bayar Member Secara Berjenjang	false	Pembayaran member secara berjenjang ketika keluar	2025-07-15 16:32:05.16+07	2025-07-15 16:32:05.16+07
\.


--
-- TOC entry 6396 (class 0 OID 3217078)
-- Dependencies: 234
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, jenis_payment, status, "createdAt", "updatedAt") FROM stdin;
1	Member	f	2025-07-17 20:38:34.018+07	2025-07-17 20:46:09.298+07
2	Transfer Bank	f	2025-07-17 20:38:34.018+07	2025-07-17 20:46:10.92+07
3	E-Wallet	f	2025-07-17 20:38:34.018+07	2025-07-17 20:46:12.459+07
4	Prepaid	f	2025-07-17 20:38:34.018+07	2025-07-17 20:46:14.353+07
5	Cash	f	2025-07-17 20:38:34.018+07	2025-07-17 20:46:15.771+07
\.


--
-- TOC entry 6398 (class 0 OID 3217085)
-- Dependencies: 236
-- Data for Name: permasalahan_atau_perbaikans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permasalahan_atau_perbaikans (id, judul_permasalahan, tanggal_permasalahan, kategori_permasalahan, pos_id, hardware_atau_alat, penyebab_permasalahan, keterangan_permasalahan, nama_pelapor, status_permasalahan, tanggal_perbaikan, jenis_perbaikan, status_perbaikan, penanganan, keterangan_penanganan, nama_yang_menangani, "createdAt", "updatedAt") FROM stdin;
1	Error Barrier Gate	31-05-2021	Sistem	1	Hardware	Ada short dalam kelistrikan	Segera melakukan perbaikan	Fahmi	Pending	31-05-2004		Pending				2025-07-15 16:53:14.904+07	2025-07-15 16:53:14.904+07
\.


--
-- TOC entry 6400 (class 0 OID 3217094)
-- Dependencies: 238
-- Data for Name: perusahaans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perusahaans (id, nama, jenis_perusahaan, kontak, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Evolusi Sistem Digital	Pemilik Gedung	08235345345	t	\N	2025-07-15 16:30:50.874+07	2025-07-15 16:30:50.874+07
\.


--
-- TOC entry 6402 (class 0 OID 3217103)
-- Dependencies: 240
-- Data for Name: pos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pos (id, kode, keterangan, tipe_pos, tipe_manless_id, tipe_kendaraan, kamera_1, kamera_2, nama_printer_id, nama_interface_id, com_port, otorisasi, synchronize, user_id, "createdAt", "updatedAt") FROM stdin;
1	P1	Pos 1	In	1	All	t	t	1	1	1	t	1	1	2025-07-15 16:35:05.617+07	2025-07-15 16:35:05.617+07
\.


--
-- TOC entry 6404 (class 0 OID 3217112)
-- Dependencies: 242
-- Data for Name: produk_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk_members (id, nama, periode, list_id_kendaraan, max_kendaraan, tarif, biaya_kartu, biaya_ganti_nopol, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Kartu Member 1	[2025-06-01,2025-06-10)	{1,1}	1	50000	50000	50000	t	1	2025-07-15 16:35:20.688+07	2025-07-15 16:35:20.688+07
2	Produk 1	[2025-07-01,2025-07-31)	{1}	5	5000	10000	10000	t	1	2025-07-21 10:21:47.576+07	2025-07-21 10:22:09.219+07
\.


--
-- TOC entry 6428 (class 0 OID 3261815)
-- Dependencies: 266
-- Data for Name: produk_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produk_vouchers (id, nama, periode, list_id_kendaraan, diskon, model_pembayaran, metode_verifikasi, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Tamu	[2025-05-31,2025-06-01)	{1,1}	2000	Check In	Tiket	t	1	2025-07-21 10:14:58.604+07	2025-07-21 10:14:58.604+07
2	Tamu1	[2025-05-31,2025-06-01)	{1,1}	1300	Check In	Tiket	t	1	2025-07-21 10:14:58.604+07	2025-07-21 10:14:58.604+07
\.


--
-- TOC entry 6406 (class 0 OID 3217130)
-- Dependencies: 244
-- Data for Name: riwayat_transaksi_ganti_nopols; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwayat_transaksi_ganti_nopols (id, tgl_transaksi, nomor_polisi_lama, nomor_polisi_baru, tarif, keterangan, user_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 6408 (class 0 OID 3217139)
-- Dependencies: 246
-- Data for Name: riwayat_transaksi_kartu_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwayat_transaksi_kartu_members (id, tgl_transaksi, no_kartu, tarif, keterangan, user_id, "createdAt", "updatedAt") FROM stdin;
\.


--
-- TOC entry 6410 (class 0 OID 3217148)
-- Dependencies: 248
-- Data for Name: shifts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shifts (id, nama_shift, awal_shift, akhir_shift, status, user_id, "createdAt", "updatedAt") FROM stdin;
1	Shift 1	08:00:00	16:00:00	t	1	2025-07-15 16:35:12.053+07	2025-07-15 16:35:12.053+07
\.


--
-- TOC entry 6412 (class 0 OID 3217155)
-- Dependencies: 250
-- Data for Name: tarif_dendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarif_dendas (id, kendaraan_id, denda_tiket, denda_stnk, denda_member, status, "createdAt", "updatedAt") FROM stdin;
1	1	7000	7000	t	t	2025-07-15 16:47:34.6+07	2025-07-15 16:47:34.6+07
\.


--
-- TOC entry 6414 (class 0 OID 3217162)
-- Dependencies: 252
-- Data for Name: tarif_parkirs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarif_parkirs (id, kendaraan_id, grace_period, tarif_grace_period, rotasi_pertama, tarif_rotasi_pertama, rotasi_kedua, tarif_rotasi_kedua, rotasi_ketiga, tarif_rotasi_ketiga, tarif_maksimal, "createdAt", "updatedAt") FROM stdin;
1	1	10	1000	2	5000	3	9000	3	8000	0	2025-07-15 16:34:24.429+07	2025-07-15 16:34:24.429+07
\.


--
-- TOC entry 6416 (class 0 OID 3217169)
-- Dependencies: 254
-- Data for Name: tipe_dendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipe_dendas (id, tipe_denda, "createdAt", "updatedAt") FROM stdin;
1	Tidak Dapat Menunjukkan STNK	2025-07-15 16:32:13.789+07	2025-07-15 16:32:13.789+07
\.


--
-- TOC entry 6418 (class 0 OID 3217176)
-- Dependencies: 256
-- Data for Name: tipe_kendaraans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipe_kendaraans (id, tipe_kendaraan, "createdAt", "updatedAt") FROM stdin;
1	Mobil	2025-07-15 16:32:09.386+07	2025-07-15 16:32:09.386+07
\.


--
-- TOC entry 6420 (class 0 OID 3217183)
-- Dependencies: 258
-- Data for Name: tipe_manlesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipe_manlesses (id, tipe_manless, "createdAt", "updatedAt") FROM stdin;
1	Loop 1 with Button and Feedback	2025-07-15 16:32:17.857+07	2025-07-15 16:32:17.857+07
\.


--
-- TOC entry 6432 (class 0 OID 3266110)
-- Dependencies: 270
-- Data for Name: transaksis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksis (id, tanggal_masuk, pintu_masuk_id, no_tiket, is_manual, kendaraan_id, nomor_polisi, pintu_keluar_id, tanggal_keluar, petugas_id, shift_id, denda, tipe_denda_id, is_active, jenis_pembayaran_id, biaya_parkir, id_data_voucher, jumlah_denda_stnk, jumlah_denda_tiket, "interval", keterangan_atau_penjelasan, id_data_member, "createdAt", "updatedAt") FROM stdin;
1	2025-07-21 00:00:00+07	1	TIK1	t	1	AB1234BC	1	2025-07-21 00:00:00+07	1	1	f	1	t	1	80000	2	0	0	0	Transaksi	1	2025-07-21 00:00:00+07	2025-07-21 00:00:00+07
2	2025-07-21 00:00:00+07	1	TIK2	t	1	AB1234BC	1	2025-07-21 00:00:00+07	1	1	f	1	f	2	80000	1	0	0	0	Transaksi	\N	2025-07-21 00:00:00+07	2025-07-23 12:48:43.789+07
\.


--
-- TOC entry 6422 (class 0 OID 3217208)
-- Dependencies: 260
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nama, jenis_kelamin, no_hp, alamat_lengkap, username, password, perusahaan_id, level_pengguna_id, status, added_by, "createdAt", "updatedAt") FROM stdin;
1	Evosist	Laki-laki	0823234234234	Jakarta	evosist	$argon2id$v=19$m=65536,t=3,p=4$LlFYA3/k5Ernu0x2dOb70w$/cL2rVE8HdFpGt5I0xeNNfm6Pn/6lZ1YCPKl3S0PR/k	1	1	t	\N	2025-07-15 16:31:07.749+07	2025-07-15 16:31:07.749+07
\.


--
-- TOC entry 6468 (class 0 OID 0)
-- Dependencies: 261
-- Name: aktivitas_gerbang_kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aktivitas_gerbang_kendaraans_id_seq', 4, true);


--
-- TOC entry 6469 (class 0 OID 0)
-- Dependencies: 263
-- Name: data_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_members_id_seq', 2, true);


--
-- TOC entry 6470 (class 0 OID 0)
-- Dependencies: 217
-- Name: data_nomor_polisis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_nomor_polisis_id_seq', 14, true);


--
-- TOC entry 6471 (class 0 OID 0)
-- Dependencies: 267
-- Name: data_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.data_vouchers_id_seq', 4, true);


--
-- TOC entry 6472 (class 0 OID 0)
-- Dependencies: 219
-- Name: global_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.global_settings_id_seq', 1, true);


--
-- TOC entry 6473 (class 0 OID 0)
-- Dependencies: 221
-- Name: kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kendaraans_id_seq', 1, true);


--
-- TOC entry 6474 (class 0 OID 0)
-- Dependencies: 223
-- Name: laporan_riwayat_transaksi_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laporan_riwayat_transaksi_members_id_seq', 1, false);


--
-- TOC entry 6475 (class 0 OID 0)
-- Dependencies: 271
-- Name: laporan_transaksi_batals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laporan_transaksi_batals_id_seq', 4, true);


--
-- TOC entry 6476 (class 0 OID 0)
-- Dependencies: 225
-- Name: level_penggunas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.level_penggunas_id_seq', 1, true);


--
-- TOC entry 6477 (class 0 OID 0)
-- Dependencies: 227
-- Name: nama_interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nama_interfaces_id_seq', 1, true);


--
-- TOC entry 6478 (class 0 OID 0)
-- Dependencies: 229
-- Name: nama_printers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nama_printers_id_seq', 1, true);


--
-- TOC entry 6479 (class 0 OID 0)
-- Dependencies: 231
-- Name: parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parameters_id_seq', 1, true);


--
-- TOC entry 6480 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 10, true);


--
-- TOC entry 6481 (class 0 OID 0)
-- Dependencies: 235
-- Name: permasalahan_atau_perbaikans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permasalahan_atau_perbaikans_id_seq', 1, true);


--
-- TOC entry 6482 (class 0 OID 0)
-- Dependencies: 237
-- Name: perusahaans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perusahaans_id_seq', 1, true);


--
-- TOC entry 6483 (class 0 OID 0)
-- Dependencies: 239
-- Name: pos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pos_id_seq', 1, true);


--
-- TOC entry 6484 (class 0 OID 0)
-- Dependencies: 241
-- Name: produk_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_members_id_seq', 2, true);


--
-- TOC entry 6485 (class 0 OID 0)
-- Dependencies: 265
-- Name: produk_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produk_vouchers_id_seq', 2, true);


--
-- TOC entry 6486 (class 0 OID 0)
-- Dependencies: 243
-- Name: riwayat_transaksi_ganti_nopols_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwayat_transaksi_ganti_nopols_id_seq', 1, false);


--
-- TOC entry 6487 (class 0 OID 0)
-- Dependencies: 245
-- Name: riwayat_transaksi_kartu_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwayat_transaksi_kartu_members_id_seq', 1, false);


--
-- TOC entry 6488 (class 0 OID 0)
-- Dependencies: 247
-- Name: shifts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shifts_id_seq', 1, true);


--
-- TOC entry 6489 (class 0 OID 0)
-- Dependencies: 249
-- Name: tarif_dendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarif_dendas_id_seq', 1, true);


--
-- TOC entry 6490 (class 0 OID 0)
-- Dependencies: 251
-- Name: tarif_parkirs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarif_parkirs_id_seq', 5, true);


--
-- TOC entry 6491 (class 0 OID 0)
-- Dependencies: 253
-- Name: tipe_dendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipe_dendas_id_seq', 1, true);


--
-- TOC entry 6492 (class 0 OID 0)
-- Dependencies: 255
-- Name: tipe_kendaraans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipe_kendaraans_id_seq', 1, true);


--
-- TOC entry 6493 (class 0 OID 0)
-- Dependencies: 257
-- Name: tipe_manlesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipe_manlesses_id_seq', 1, true);


--
-- TOC entry 6494 (class 0 OID 0)
-- Dependencies: 269
-- Name: transaksis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksis_id_seq', 2, true);


--
-- TOC entry 6495 (class 0 OID 0)
-- Dependencies: 259
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 6180 (class 2606 OID 3223181)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 6182 (class 2606 OID 3256367)
-- Name: data_members data_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 3342710)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key UNIQUE (nomor_polisi);


--
-- TOC entry 4936 (class 2606 OID 3342742)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key1 UNIQUE (nomor_polisi);


--
-- TOC entry 4938 (class 2606 OID 3342766)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key10 UNIQUE (nomor_polisi);


--
-- TOC entry 4940 (class 2606 OID 3342768)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key100 UNIQUE (nomor_polisi);


--
-- TOC entry 4942 (class 2606 OID 3342720)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key101 UNIQUE (nomor_polisi);


--
-- TOC entry 4944 (class 2606 OID 3342770)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key102 UNIQUE (nomor_polisi);


--
-- TOC entry 4946 (class 2606 OID 3342772)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key103 UNIQUE (nomor_polisi);


--
-- TOC entry 4948 (class 2606 OID 3342774)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key104 UNIQUE (nomor_polisi);


--
-- TOC entry 4950 (class 2606 OID 3342776)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key105 UNIQUE (nomor_polisi);


--
-- TOC entry 4952 (class 2606 OID 3342718)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key106 UNIQUE (nomor_polisi);


--
-- TOC entry 4954 (class 2606 OID 3342778)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key107 UNIQUE (nomor_polisi);


--
-- TOC entry 4956 (class 2606 OID 3342780)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key108 UNIQUE (nomor_polisi);


--
-- TOC entry 4958 (class 2606 OID 3342782)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key109 UNIQUE (nomor_polisi);


--
-- TOC entry 4960 (class 2606 OID 3342738)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key11 UNIQUE (nomor_polisi);


--
-- TOC entry 4962 (class 2606 OID 3342564)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key110 UNIQUE (nomor_polisi);


--
-- TOC entry 4964 (class 2606 OID 3342566)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key111 UNIQUE (nomor_polisi);


--
-- TOC entry 4966 (class 2606 OID 3342568)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key112 UNIQUE (nomor_polisi);


--
-- TOC entry 4968 (class 2606 OID 3342570)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key113 UNIQUE (nomor_polisi);


--
-- TOC entry 4970 (class 2606 OID 3342572)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key114 UNIQUE (nomor_polisi);


--
-- TOC entry 4972 (class 2606 OID 3342834)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key115 UNIQUE (nomor_polisi);


--
-- TOC entry 4974 (class 2606 OID 3342574)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key116 UNIQUE (nomor_polisi);


--
-- TOC entry 4976 (class 2606 OID 3342576)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key117 UNIQUE (nomor_polisi);


--
-- TOC entry 4978 (class 2606 OID 3342578)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key118 UNIQUE (nomor_polisi);


--
-- TOC entry 4980 (class 2606 OID 3342812)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key119 UNIQUE (nomor_polisi);


--
-- TOC entry 4982 (class 2606 OID 3342786)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key12 UNIQUE (nomor_polisi);


--
-- TOC entry 4984 (class 2606 OID 3342580)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key120 UNIQUE (nomor_polisi);


--
-- TOC entry 4986 (class 2606 OID 3342582)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key121 UNIQUE (nomor_polisi);


--
-- TOC entry 4988 (class 2606 OID 3342810)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key122 UNIQUE (nomor_polisi);


--
-- TOC entry 4990 (class 2606 OID 3342584)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key123 UNIQUE (nomor_polisi);


--
-- TOC entry 4992 (class 2606 OID 3342586)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key124 UNIQUE (nomor_polisi);


--
-- TOC entry 4994 (class 2606 OID 3342808)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key125 UNIQUE (nomor_polisi);


--
-- TOC entry 4996 (class 2606 OID 3342806)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key126 UNIQUE (nomor_polisi);


--
-- TOC entry 4998 (class 2606 OID 3342588)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key127 UNIQUE (nomor_polisi);


--
-- TOC entry 5000 (class 2606 OID 3342590)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key128 UNIQUE (nomor_polisi);


--
-- TOC entry 5002 (class 2606 OID 3342804)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key129 UNIQUE (nomor_polisi);


--
-- TOC entry 5004 (class 2606 OID 3342654)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key13 UNIQUE (nomor_polisi);


--
-- TOC entry 5006 (class 2606 OID 3342592)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key130 UNIQUE (nomor_polisi);


--
-- TOC entry 5008 (class 2606 OID 3342594)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key131 UNIQUE (nomor_polisi);


--
-- TOC entry 5010 (class 2606 OID 3342802)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key132 UNIQUE (nomor_polisi);


--
-- TOC entry 5012 (class 2606 OID 3342596)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key133 UNIQUE (nomor_polisi);


--
-- TOC entry 5014 (class 2606 OID 3342598)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key134 UNIQUE (nomor_polisi);


--
-- TOC entry 5016 (class 2606 OID 3342660)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key135 UNIQUE (nomor_polisi);


--
-- TOC entry 5018 (class 2606 OID 3342600)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key136 UNIQUE (nomor_polisi);


--
-- TOC entry 5020 (class 2606 OID 3342602)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key137 UNIQUE (nomor_polisi);


--
-- TOC entry 5022 (class 2606 OID 3342658)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key138 UNIQUE (nomor_polisi);


--
-- TOC entry 5024 (class 2606 OID 3342604)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key139 UNIQUE (nomor_polisi);


--
-- TOC entry 5026 (class 2606 OID 3342704)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key14 UNIQUE (nomor_polisi);


--
-- TOC entry 5028 (class 2606 OID 3342832)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key140 UNIQUE (nomor_polisi);


--
-- TOC entry 5030 (class 2606 OID 3342606)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key141 UNIQUE (nomor_polisi);


--
-- TOC entry 5032 (class 2606 OID 3342686)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key142 UNIQUE (nomor_polisi);


--
-- TOC entry 5034 (class 2606 OID 3342608)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key143 UNIQUE (nomor_polisi);


--
-- TOC entry 5036 (class 2606 OID 3342684)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key144 UNIQUE (nomor_polisi);


--
-- TOC entry 5038 (class 2606 OID 3342682)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key145 UNIQUE (nomor_polisi);


--
-- TOC entry 5040 (class 2606 OID 3342610)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key146 UNIQUE (nomor_polisi);


--
-- TOC entry 5042 (class 2606 OID 3342612)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key147 UNIQUE (nomor_polisi);


--
-- TOC entry 5044 (class 2606 OID 3342664)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key148 UNIQUE (nomor_polisi);


--
-- TOC entry 5046 (class 2606 OID 3342620)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key149 UNIQUE (nomor_polisi);


--
-- TOC entry 5048 (class 2606 OID 3342656)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key15 UNIQUE (nomor_polisi);


--
-- TOC entry 5050 (class 2606 OID 3342614)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key150 UNIQUE (nomor_polisi);


--
-- TOC entry 5052 (class 2606 OID 3342616)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key151 UNIQUE (nomor_polisi);


--
-- TOC entry 5054 (class 2606 OID 3342618)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key152 UNIQUE (nomor_polisi);


--
-- TOC entry 5056 (class 2606 OID 3342876)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key153 UNIQUE (nomor_polisi);


--
-- TOC entry 5058 (class 2606 OID 3342714)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key154 UNIQUE (nomor_polisi);


--
-- TOC entry 5060 (class 2606 OID 3342878)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key155 UNIQUE (nomor_polisi);


--
-- TOC entry 5062 (class 2606 OID 3342880)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key156 UNIQUE (nomor_polisi);


--
-- TOC entry 5064 (class 2606 OID 3342712)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key157; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key157 UNIQUE (nomor_polisi);


--
-- TOC entry 5066 (class 2606 OID 3342882)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key158; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key158 UNIQUE (nomor_polisi);


--
-- TOC entry 5068 (class 2606 OID 3342666)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key159; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key159 UNIQUE (nomor_polisi);


--
-- TOC entry 5070 (class 2606 OID 3342702)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key16 UNIQUE (nomor_polisi);


--
-- TOC entry 5072 (class 2606 OID 3342884)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key160; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key160 UNIQUE (nomor_polisi);


--
-- TOC entry 5074 (class 2606 OID 3342562)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key161; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key161 UNIQUE (nomor_polisi);


--
-- TOC entry 5076 (class 2606 OID 3342854)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key17 UNIQUE (nomor_polisi);


--
-- TOC entry 5078 (class 2606 OID 3342680)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key18 UNIQUE (nomor_polisi);


--
-- TOC entry 5080 (class 2606 OID 3342872)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key19 UNIQUE (nomor_polisi);


--
-- TOC entry 5082 (class 2606 OID 3342708)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key2 UNIQUE (nomor_polisi);


--
-- TOC entry 5084 (class 2606 OID 3342678)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key20 UNIQUE (nomor_polisi);


--
-- TOC entry 5086 (class 2606 OID 3342874)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key21 UNIQUE (nomor_polisi);


--
-- TOC entry 5088 (class 2606 OID 3342676)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key22 UNIQUE (nomor_polisi);


--
-- TOC entry 5090 (class 2606 OID 3342716)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key23 UNIQUE (nomor_polisi);


--
-- TOC entry 5092 (class 2606 OID 3342830)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key24 UNIQUE (nomor_polisi);


--
-- TOC entry 5094 (class 2606 OID 3342792)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key25 UNIQUE (nomor_polisi);


--
-- TOC entry 5096 (class 2606 OID 3342828)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key26 UNIQUE (nomor_polisi);


--
-- TOC entry 5098 (class 2606 OID 3342794)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key27 UNIQUE (nomor_polisi);


--
-- TOC entry 5100 (class 2606 OID 3342868)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key28 UNIQUE (nomor_polisi);


--
-- TOC entry 5102 (class 2606 OID 3342796)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key29 UNIQUE (nomor_polisi);


--
-- TOC entry 5104 (class 2606 OID 3342628)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key3 UNIQUE (nomor_polisi);


--
-- TOC entry 5106 (class 2606 OID 3342798)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key30 UNIQUE (nomor_polisi);


--
-- TOC entry 5108 (class 2606 OID 3342800)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key31 UNIQUE (nomor_polisi);


--
-- TOC entry 5110 (class 2606 OID 3342630)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key32 UNIQUE (nomor_polisi);


--
-- TOC entry 5112 (class 2606 OID 3342866)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key33 UNIQUE (nomor_polisi);


--
-- TOC entry 5114 (class 2606 OID 3342632)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key34 UNIQUE (nomor_polisi);


--
-- TOC entry 5116 (class 2606 OID 3342634)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key35 UNIQUE (nomor_polisi);


--
-- TOC entry 5118 (class 2606 OID 3342636)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key36 UNIQUE (nomor_polisi);


--
-- TOC entry 5120 (class 2606 OID 3342864)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key37 UNIQUE (nomor_polisi);


--
-- TOC entry 5122 (class 2606 OID 3342814)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key38 UNIQUE (nomor_polisi);


--
-- TOC entry 5124 (class 2606 OID 3342816)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key39 UNIQUE (nomor_polisi);


--
-- TOC entry 5126 (class 2606 OID 3342706)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key4 UNIQUE (nomor_polisi);


--
-- TOC entry 5128 (class 2606 OID 3342860)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key40 UNIQUE (nomor_polisi);


--
-- TOC entry 5130 (class 2606 OID 3342734)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key41 UNIQUE (nomor_polisi);


--
-- TOC entry 5132 (class 2606 OID 3342858)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key42 UNIQUE (nomor_polisi);


--
-- TOC entry 5134 (class 2606 OID 3342736)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key43 UNIQUE (nomor_polisi);


--
-- TOC entry 5136 (class 2606 OID 3342674)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key44 UNIQUE (nomor_polisi);


--
-- TOC entry 5138 (class 2606 OID 3342856)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key45 UNIQUE (nomor_polisi);


--
-- TOC entry 5140 (class 2606 OID 3342688)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key46 UNIQUE (nomor_polisi);


--
-- TOC entry 5142 (class 2606 OID 3342698)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key47 UNIQUE (nomor_polisi);


--
-- TOC entry 5144 (class 2606 OID 3342788)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key48 UNIQUE (nomor_polisi);


--
-- TOC entry 5146 (class 2606 OID 3342696)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key49 UNIQUE (nomor_polisi);


--
-- TOC entry 5148 (class 2606 OID 3342824)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key5 UNIQUE (nomor_polisi);


--
-- TOC entry 5150 (class 2606 OID 3342790)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key50 UNIQUE (nomor_polisi);


--
-- TOC entry 5152 (class 2606 OID 3342694)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key51 UNIQUE (nomor_polisi);


--
-- TOC entry 5154 (class 2606 OID 3342836)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key52 UNIQUE (nomor_polisi);


--
-- TOC entry 5156 (class 2606 OID 3342692)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key53 UNIQUE (nomor_polisi);


--
-- TOC entry 5158 (class 2606 OID 3342838)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key54 UNIQUE (nomor_polisi);


--
-- TOC entry 5160 (class 2606 OID 3342690)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key55 UNIQUE (nomor_polisi);


--
-- TOC entry 5162 (class 2606 OID 3342840)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key56 UNIQUE (nomor_polisi);


--
-- TOC entry 5164 (class 2606 OID 3342852)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key57 UNIQUE (nomor_polisi);


--
-- TOC entry 5166 (class 2606 OID 3342842)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key58 UNIQUE (nomor_polisi);


--
-- TOC entry 5168 (class 2606 OID 3342844)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key59 UNIQUE (nomor_polisi);


--
-- TOC entry 5170 (class 2606 OID 3342784)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key6 UNIQUE (nomor_polisi);


--
-- TOC entry 5172 (class 2606 OID 3342638)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key60 UNIQUE (nomor_polisi);


--
-- TOC entry 5174 (class 2606 OID 3342652)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key61 UNIQUE (nomor_polisi);


--
-- TOC entry 5176 (class 2606 OID 3342640)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key62 UNIQUE (nomor_polisi);


--
-- TOC entry 5178 (class 2606 OID 3342650)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key63 UNIQUE (nomor_polisi);


--
-- TOC entry 5180 (class 2606 OID 3342642)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key64 UNIQUE (nomor_polisi);


--
-- TOC entry 5182 (class 2606 OID 3342646)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key65 UNIQUE (nomor_polisi);


--
-- TOC entry 5184 (class 2606 OID 3342862)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key66 UNIQUE (nomor_polisi);


--
-- TOC entry 5186 (class 2606 OID 3342644)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key67 UNIQUE (nomor_polisi);


--
-- TOC entry 5188 (class 2606 OID 3342850)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key68 UNIQUE (nomor_polisi);


--
-- TOC entry 5190 (class 2606 OID 3342846)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key69 UNIQUE (nomor_polisi);


--
-- TOC entry 5192 (class 2606 OID 3342700)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key7 UNIQUE (nomor_polisi);


--
-- TOC entry 5194 (class 2606 OID 3342848)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key70 UNIQUE (nomor_polisi);


--
-- TOC entry 5196 (class 2606 OID 3342626)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key71 UNIQUE (nomor_polisi);


--
-- TOC entry 5198 (class 2606 OID 3342870)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key72 UNIQUE (nomor_polisi);


--
-- TOC entry 5200 (class 2606 OID 3342622)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key73 UNIQUE (nomor_polisi);


--
-- TOC entry 5202 (class 2606 OID 3342624)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key74 UNIQUE (nomor_polisi);


--
-- TOC entry 5204 (class 2606 OID 3342764)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key75 UNIQUE (nomor_polisi);


--
-- TOC entry 5206 (class 2606 OID 3342648)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key76 UNIQUE (nomor_polisi);


--
-- TOC entry 5208 (class 2606 OID 3342744)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key77 UNIQUE (nomor_polisi);


--
-- TOC entry 5210 (class 2606 OID 3342746)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key78 UNIQUE (nomor_polisi);


--
-- TOC entry 5212 (class 2606 OID 3342762)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key79 UNIQUE (nomor_polisi);


--
-- TOC entry 5214 (class 2606 OID 3342826)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key8 UNIQUE (nomor_polisi);


--
-- TOC entry 5216 (class 2606 OID 3342748)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key80 UNIQUE (nomor_polisi);


--
-- TOC entry 5218 (class 2606 OID 3342760)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key81 UNIQUE (nomor_polisi);


--
-- TOC entry 5220 (class 2606 OID 3342750)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key82 UNIQUE (nomor_polisi);


--
-- TOC entry 5222 (class 2606 OID 3342758)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key83 UNIQUE (nomor_polisi);


--
-- TOC entry 5224 (class 2606 OID 3342752)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key84 UNIQUE (nomor_polisi);


--
-- TOC entry 5226 (class 2606 OID 3342756)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key85 UNIQUE (nomor_polisi);


--
-- TOC entry 5228 (class 2606 OID 3342754)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key86 UNIQUE (nomor_polisi);


--
-- TOC entry 5230 (class 2606 OID 3342818)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key87 UNIQUE (nomor_polisi);


--
-- TOC entry 5232 (class 2606 OID 3342732)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key88 UNIQUE (nomor_polisi);


--
-- TOC entry 5234 (class 2606 OID 3342820)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key89 UNIQUE (nomor_polisi);


--
-- TOC entry 5236 (class 2606 OID 3342662)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key9 UNIQUE (nomor_polisi);


--
-- TOC entry 5238 (class 2606 OID 3342730)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key90 UNIQUE (nomor_polisi);


--
-- TOC entry 5240 (class 2606 OID 3342822)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key91 UNIQUE (nomor_polisi);


--
-- TOC entry 5242 (class 2606 OID 3342728)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key92 UNIQUE (nomor_polisi);


--
-- TOC entry 5244 (class 2606 OID 3342726)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key93 UNIQUE (nomor_polisi);


--
-- TOC entry 5246 (class 2606 OID 3342740)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key94 UNIQUE (nomor_polisi);


--
-- TOC entry 5248 (class 2606 OID 3342724)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key95 UNIQUE (nomor_polisi);


--
-- TOC entry 5250 (class 2606 OID 3342668)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key96 UNIQUE (nomor_polisi);


--
-- TOC entry 5252 (class 2606 OID 3342670)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key97 UNIQUE (nomor_polisi);


--
-- TOC entry 5254 (class 2606 OID 3342722)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key98 UNIQUE (nomor_polisi);


--
-- TOC entry 5256 (class 2606 OID 3342672)
-- Name: data_nomor_polisis data_nomor_polisis_nomor_polisi_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_nomor_polisi_key99 UNIQUE (nomor_polisi);


--
-- TOC entry 5258 (class 2606 OID 3216997)
-- Name: data_nomor_polisis data_nomor_polisis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_pkey PRIMARY KEY (id);


--
-- TOC entry 6186 (class 2606 OID 3262040)
-- Name: data_vouchers data_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 5260 (class 2606 OID 3217017)
-- Name: global_settings global_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_settings
    ADD CONSTRAINT global_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 5262 (class 2606 OID 3217024)
-- Name: kendaraans kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 5264 (class 2606 OID 3217033)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_pkey PRIMARY KEY (id);


--
-- TOC entry 6190 (class 2606 OID 3315432)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_pkey PRIMARY KEY (id);


--
-- TOC entry 5266 (class 2606 OID 3343199)
-- Name: level_penggunas level_penggunas_nama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key UNIQUE (nama);


--
-- TOC entry 5268 (class 2606 OID 3343197)
-- Name: level_penggunas level_penggunas_nama_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key1 UNIQUE (nama);


--
-- TOC entry 5270 (class 2606 OID 3342957)
-- Name: level_penggunas level_penggunas_nama_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key10 UNIQUE (nama);


--
-- TOC entry 5272 (class 2606 OID 3343077)
-- Name: level_penggunas level_penggunas_nama_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key100 UNIQUE (nama);


--
-- TOC entry 5274 (class 2606 OID 3343135)
-- Name: level_penggunas level_penggunas_nama_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key101 UNIQUE (nama);


--
-- TOC entry 5276 (class 2606 OID 3343167)
-- Name: level_penggunas level_penggunas_nama_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key102 UNIQUE (nama);


--
-- TOC entry 5278 (class 2606 OID 3343137)
-- Name: level_penggunas level_penggunas_nama_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key103 UNIQUE (nama);


--
-- TOC entry 5280 (class 2606 OID 3343139)
-- Name: level_penggunas level_penggunas_nama_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key104 UNIQUE (nama);


--
-- TOC entry 5282 (class 2606 OID 3343141)
-- Name: level_penggunas level_penggunas_nama_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key105 UNIQUE (nama);


--
-- TOC entry 5284 (class 2606 OID 3343143)
-- Name: level_penggunas level_penggunas_nama_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key106 UNIQUE (nama);


--
-- TOC entry 5286 (class 2606 OID 3343145)
-- Name: level_penggunas level_penggunas_nama_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key107 UNIQUE (nama);


--
-- TOC entry 5288 (class 2606 OID 3343147)
-- Name: level_penggunas level_penggunas_nama_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key108 UNIQUE (nama);


--
-- TOC entry 5290 (class 2606 OID 3343149)
-- Name: level_penggunas level_penggunas_nama_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key109 UNIQUE (nama);


--
-- TOC entry 5292 (class 2606 OID 3342959)
-- Name: level_penggunas level_penggunas_nama_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key11 UNIQUE (nama);


--
-- TOC entry 5294 (class 2606 OID 3343151)
-- Name: level_penggunas level_penggunas_nama_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key110 UNIQUE (nama);


--
-- TOC entry 5296 (class 2606 OID 3343165)
-- Name: level_penggunas level_penggunas_nama_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key111 UNIQUE (nama);


--
-- TOC entry 5298 (class 2606 OID 3343153)
-- Name: level_penggunas level_penggunas_nama_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key112 UNIQUE (nama);


--
-- TOC entry 5300 (class 2606 OID 3343155)
-- Name: level_penggunas level_penggunas_nama_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key113 UNIQUE (nama);


--
-- TOC entry 5302 (class 2606 OID 3343157)
-- Name: level_penggunas level_penggunas_nama_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key114 UNIQUE (nama);


--
-- TOC entry 5304 (class 2606 OID 3343163)
-- Name: level_penggunas level_penggunas_nama_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key115 UNIQUE (nama);


--
-- TOC entry 5306 (class 2606 OID 3343159)
-- Name: level_penggunas level_penggunas_nama_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key116 UNIQUE (nama);


--
-- TOC entry 5308 (class 2606 OID 3343161)
-- Name: level_penggunas level_penggunas_nama_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key117 UNIQUE (nama);


--
-- TOC entry 5310 (class 2606 OID 3343005)
-- Name: level_penggunas level_penggunas_nama_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key118 UNIQUE (nama);


--
-- TOC entry 5312 (class 2606 OID 3342999)
-- Name: level_penggunas level_penggunas_nama_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key119 UNIQUE (nama);


--
-- TOC entry 5314 (class 2606 OID 3342961)
-- Name: level_penggunas level_penggunas_nama_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key12 UNIQUE (nama);


--
-- TOC entry 5316 (class 2606 OID 3343001)
-- Name: level_penggunas level_penggunas_nama_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key120 UNIQUE (nama);


--
-- TOC entry 5318 (class 2606 OID 3343003)
-- Name: level_penggunas level_penggunas_nama_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key121 UNIQUE (nama);


--
-- TOC entry 5320 (class 2606 OID 3343193)
-- Name: level_penggunas level_penggunas_nama_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key122 UNIQUE (nama);


--
-- TOC entry 5322 (class 2606 OID 3343095)
-- Name: level_penggunas level_penggunas_nama_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key123 UNIQUE (nama);


--
-- TOC entry 5324 (class 2606 OID 3343097)
-- Name: level_penggunas level_penggunas_nama_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key124 UNIQUE (nama);


--
-- TOC entry 5326 (class 2606 OID 3343073)
-- Name: level_penggunas level_penggunas_nama_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key125 UNIQUE (nama);


--
-- TOC entry 5328 (class 2606 OID 3343207)
-- Name: level_penggunas level_penggunas_nama_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key126 UNIQUE (nama);


--
-- TOC entry 5330 (class 2606 OID 3343209)
-- Name: level_penggunas level_penggunas_nama_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key127 UNIQUE (nama);


--
-- TOC entry 5332 (class 2606 OID 3343211)
-- Name: level_penggunas level_penggunas_nama_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key128 UNIQUE (nama);


--
-- TOC entry 5334 (class 2606 OID 3343213)
-- Name: level_penggunas level_penggunas_nama_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key129 UNIQUE (nama);


--
-- TOC entry 5336 (class 2606 OID 3342963)
-- Name: level_penggunas level_penggunas_nama_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key13 UNIQUE (nama);


--
-- TOC entry 5338 (class 2606 OID 3343215)
-- Name: level_penggunas level_penggunas_nama_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key130 UNIQUE (nama);


--
-- TOC entry 5340 (class 2606 OID 3342953)
-- Name: level_penggunas level_penggunas_nama_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key131 UNIQUE (nama);


--
-- TOC entry 5342 (class 2606 OID 3343217)
-- Name: level_penggunas level_penggunas_nama_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key132 UNIQUE (nama);


--
-- TOC entry 5344 (class 2606 OID 3342951)
-- Name: level_penggunas level_penggunas_nama_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key133 UNIQUE (nama);


--
-- TOC entry 5346 (class 2606 OID 3343219)
-- Name: level_penggunas level_penggunas_nama_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key134 UNIQUE (nama);


--
-- TOC entry 5348 (class 2606 OID 3342949)
-- Name: level_penggunas level_penggunas_nama_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key135 UNIQUE (nama);


--
-- TOC entry 5350 (class 2606 OID 3343221)
-- Name: level_penggunas level_penggunas_nama_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key136 UNIQUE (nama);


--
-- TOC entry 5352 (class 2606 OID 3342947)
-- Name: level_penggunas level_penggunas_nama_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key137 UNIQUE (nama);


--
-- TOC entry 5354 (class 2606 OID 3343223)
-- Name: level_penggunas level_penggunas_nama_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key138 UNIQUE (nama);


--
-- TOC entry 5356 (class 2606 OID 3343225)
-- Name: level_penggunas level_penggunas_nama_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key139 UNIQUE (nama);


--
-- TOC entry 5358 (class 2606 OID 3343185)
-- Name: level_penggunas level_penggunas_nama_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key14 UNIQUE (nama);


--
-- TOC entry 5360 (class 2606 OID 3342945)
-- Name: level_penggunas level_penggunas_nama_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key140 UNIQUE (nama);


--
-- TOC entry 5362 (class 2606 OID 3343227)
-- Name: level_penggunas level_penggunas_nama_key141; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key141 UNIQUE (nama);


--
-- TOC entry 5364 (class 2606 OID 3343229)
-- Name: level_penggunas level_penggunas_nama_key142; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key142 UNIQUE (nama);


--
-- TOC entry 5366 (class 2606 OID 3343231)
-- Name: level_penggunas level_penggunas_nama_key143; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key143 UNIQUE (nama);


--
-- TOC entry 5368 (class 2606 OID 3342943)
-- Name: level_penggunas level_penggunas_nama_key144; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key144 UNIQUE (nama);


--
-- TOC entry 5370 (class 2606 OID 3343233)
-- Name: level_penggunas level_penggunas_nama_key145; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key145 UNIQUE (nama);


--
-- TOC entry 5372 (class 2606 OID 3343235)
-- Name: level_penggunas level_penggunas_nama_key146; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key146 UNIQUE (nama);


--
-- TOC entry 5374 (class 2606 OID 3342941)
-- Name: level_penggunas level_penggunas_nama_key147; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key147 UNIQUE (nama);


--
-- TOC entry 5376 (class 2606 OID 3343237)
-- Name: level_penggunas level_penggunas_nama_key148; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key148 UNIQUE (nama);


--
-- TOC entry 5378 (class 2606 OID 3342939)
-- Name: level_penggunas level_penggunas_nama_key149; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key149 UNIQUE (nama);


--
-- TOC entry 5380 (class 2606 OID 3342965)
-- Name: level_penggunas level_penggunas_nama_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key15 UNIQUE (nama);


--
-- TOC entry 5382 (class 2606 OID 3343239)
-- Name: level_penggunas level_penggunas_nama_key150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key150 UNIQUE (nama);


--
-- TOC entry 5384 (class 2606 OID 3343241)
-- Name: level_penggunas level_penggunas_nama_key151; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key151 UNIQUE (nama);


--
-- TOC entry 5386 (class 2606 OID 3342937)
-- Name: level_penggunas level_penggunas_nama_key152; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key152 UNIQUE (nama);


--
-- TOC entry 5388 (class 2606 OID 3343243)
-- Name: level_penggunas level_penggunas_nama_key153; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key153 UNIQUE (nama);


--
-- TOC entry 5390 (class 2606 OID 3342935)
-- Name: level_penggunas level_penggunas_nama_key154; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key154 UNIQUE (nama);


--
-- TOC entry 5392 (class 2606 OID 3343245)
-- Name: level_penggunas level_penggunas_nama_key155; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key155 UNIQUE (nama);


--
-- TOC entry 5394 (class 2606 OID 3342933)
-- Name: level_penggunas level_penggunas_nama_key156; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key156 UNIQUE (nama);


--
-- TOC entry 5396 (class 2606 OID 3343177)
-- Name: level_penggunas level_penggunas_nama_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key16 UNIQUE (nama);


--
-- TOC entry 5398 (class 2606 OID 3342967)
-- Name: level_penggunas level_penggunas_nama_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key17 UNIQUE (nama);


--
-- TOC entry 5400 (class 2606 OID 3343175)
-- Name: level_penggunas level_penggunas_nama_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key18 UNIQUE (nama);


--
-- TOC entry 5402 (class 2606 OID 3342969)
-- Name: level_penggunas level_penggunas_nama_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key19 UNIQUE (nama);


--
-- TOC entry 5404 (class 2606 OID 3343195)
-- Name: level_penggunas level_penggunas_nama_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key2 UNIQUE (nama);


--
-- TOC entry 5406 (class 2606 OID 3343173)
-- Name: level_penggunas level_penggunas_nama_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key20 UNIQUE (nama);


--
-- TOC entry 5408 (class 2606 OID 3342971)
-- Name: level_penggunas level_penggunas_nama_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key21 UNIQUE (nama);


--
-- TOC entry 5410 (class 2606 OID 3343171)
-- Name: level_penggunas level_penggunas_nama_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key22 UNIQUE (nama);


--
-- TOC entry 5412 (class 2606 OID 3342973)
-- Name: level_penggunas level_penggunas_nama_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key23 UNIQUE (nama);


--
-- TOC entry 5414 (class 2606 OID 3343169)
-- Name: level_penggunas level_penggunas_nama_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key24 UNIQUE (nama);


--
-- TOC entry 5416 (class 2606 OID 3342975)
-- Name: level_penggunas level_penggunas_nama_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key25 UNIQUE (nama);


--
-- TOC entry 5418 (class 2606 OID 3342977)
-- Name: level_penggunas level_penggunas_nama_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key26 UNIQUE (nama);


--
-- TOC entry 5420 (class 2606 OID 3342979)
-- Name: level_penggunas level_penggunas_nama_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key27 UNIQUE (nama);


--
-- TOC entry 5422 (class 2606 OID 3343133)
-- Name: level_penggunas level_penggunas_nama_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key28 UNIQUE (nama);


--
-- TOC entry 5424 (class 2606 OID 3342981)
-- Name: level_penggunas level_penggunas_nama_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key29 UNIQUE (nama);


--
-- TOC entry 5426 (class 2606 OID 3343201)
-- Name: level_penggunas level_penggunas_nama_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key3 UNIQUE (nama);


--
-- TOC entry 5428 (class 2606 OID 3342983)
-- Name: level_penggunas level_penggunas_nama_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key30 UNIQUE (nama);


--
-- TOC entry 5430 (class 2606 OID 3342985)
-- Name: level_penggunas level_penggunas_nama_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key31 UNIQUE (nama);


--
-- TOC entry 5432 (class 2606 OID 3342987)
-- Name: level_penggunas level_penggunas_nama_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key32 UNIQUE (nama);


--
-- TOC entry 5434 (class 2606 OID 3343131)
-- Name: level_penggunas level_penggunas_nama_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key33 UNIQUE (nama);


--
-- TOC entry 5436 (class 2606 OID 3342989)
-- Name: level_penggunas level_penggunas_nama_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key34 UNIQUE (nama);


--
-- TOC entry 5438 (class 2606 OID 3342991)
-- Name: level_penggunas level_penggunas_nama_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key35 UNIQUE (nama);


--
-- TOC entry 5440 (class 2606 OID 3342993)
-- Name: level_penggunas level_penggunas_nama_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key36 UNIQUE (nama);


--
-- TOC entry 5442 (class 2606 OID 3343129)
-- Name: level_penggunas level_penggunas_nama_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key37 UNIQUE (nama);


--
-- TOC entry 5444 (class 2606 OID 3342995)
-- Name: level_penggunas level_penggunas_nama_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key38 UNIQUE (nama);


--
-- TOC entry 5446 (class 2606 OID 3342997)
-- Name: level_penggunas level_penggunas_nama_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key39 UNIQUE (nama);


--
-- TOC entry 5448 (class 2606 OID 3343191)
-- Name: level_penggunas level_penggunas_nama_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key4 UNIQUE (nama);


--
-- TOC entry 5450 (class 2606 OID 3343127)
-- Name: level_penggunas level_penggunas_nama_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key40 UNIQUE (nama);


--
-- TOC entry 5452 (class 2606 OID 3343007)
-- Name: level_penggunas level_penggunas_nama_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key41 UNIQUE (nama);


--
-- TOC entry 5454 (class 2606 OID 3343125)
-- Name: level_penggunas level_penggunas_nama_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key42 UNIQUE (nama);


--
-- TOC entry 5456 (class 2606 OID 3343009)
-- Name: level_penggunas level_penggunas_nama_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key43 UNIQUE (nama);


--
-- TOC entry 5458 (class 2606 OID 3343011)
-- Name: level_penggunas level_penggunas_nama_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key44 UNIQUE (nama);


--
-- TOC entry 5460 (class 2606 OID 3343123)
-- Name: level_penggunas level_penggunas_nama_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key45 UNIQUE (nama);


--
-- TOC entry 5462 (class 2606 OID 3343013)
-- Name: level_penggunas level_penggunas_nama_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key46 UNIQUE (nama);


--
-- TOC entry 5464 (class 2606 OID 3343121)
-- Name: level_penggunas level_penggunas_nama_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key47 UNIQUE (nama);


--
-- TOC entry 5466 (class 2606 OID 3343017)
-- Name: level_penggunas level_penggunas_nama_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key48 UNIQUE (nama);


--
-- TOC entry 5468 (class 2606 OID 3343119)
-- Name: level_penggunas level_penggunas_nama_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key49 UNIQUE (nama);


--
-- TOC entry 5470 (class 2606 OID 3343203)
-- Name: level_penggunas level_penggunas_nama_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key5 UNIQUE (nama);


--
-- TOC entry 5472 (class 2606 OID 3343015)
-- Name: level_penggunas level_penggunas_nama_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key50 UNIQUE (nama);


--
-- TOC entry 5474 (class 2606 OID 3343117)
-- Name: level_penggunas level_penggunas_nama_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key51 UNIQUE (nama);


--
-- TOC entry 5476 (class 2606 OID 3343019)
-- Name: level_penggunas level_penggunas_nama_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key52 UNIQUE (nama);


--
-- TOC entry 5478 (class 2606 OID 3343115)
-- Name: level_penggunas level_penggunas_nama_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key53 UNIQUE (nama);


--
-- TOC entry 5480 (class 2606 OID 3343021)
-- Name: level_penggunas level_penggunas_nama_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key54 UNIQUE (nama);


--
-- TOC entry 5482 (class 2606 OID 3343113)
-- Name: level_penggunas level_penggunas_nama_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key55 UNIQUE (nama);


--
-- TOC entry 5484 (class 2606 OID 3343023)
-- Name: level_penggunas level_penggunas_nama_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key56 UNIQUE (nama);


--
-- TOC entry 5486 (class 2606 OID 3343111)
-- Name: level_penggunas level_penggunas_nama_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key57 UNIQUE (nama);


--
-- TOC entry 5488 (class 2606 OID 3343025)
-- Name: level_penggunas level_penggunas_nama_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key58 UNIQUE (nama);


--
-- TOC entry 5490 (class 2606 OID 3343027)
-- Name: level_penggunas level_penggunas_nama_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key59 UNIQUE (nama);


--
-- TOC entry 5492 (class 2606 OID 3343205)
-- Name: level_penggunas level_penggunas_nama_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key6 UNIQUE (nama);


--
-- TOC entry 5494 (class 2606 OID 3343029)
-- Name: level_penggunas level_penggunas_nama_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key60 UNIQUE (nama);


--
-- TOC entry 5496 (class 2606 OID 3343109)
-- Name: level_penggunas level_penggunas_nama_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key61 UNIQUE (nama);


--
-- TOC entry 5498 (class 2606 OID 3343031)
-- Name: level_penggunas level_penggunas_nama_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key62 UNIQUE (nama);


--
-- TOC entry 5500 (class 2606 OID 3343183)
-- Name: level_penggunas level_penggunas_nama_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key63 UNIQUE (nama);


--
-- TOC entry 5502 (class 2606 OID 3343033)
-- Name: level_penggunas level_penggunas_nama_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key64 UNIQUE (nama);


--
-- TOC entry 5504 (class 2606 OID 3343181)
-- Name: level_penggunas level_penggunas_nama_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key65 UNIQUE (nama);


--
-- TOC entry 5506 (class 2606 OID 3343035)
-- Name: level_penggunas level_penggunas_nama_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key66 UNIQUE (nama);


--
-- TOC entry 5508 (class 2606 OID 3343037)
-- Name: level_penggunas level_penggunas_nama_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key67 UNIQUE (nama);


--
-- TOC entry 5510 (class 2606 OID 3343179)
-- Name: level_penggunas level_penggunas_nama_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key68 UNIQUE (nama);


--
-- TOC entry 5512 (class 2606 OID 3343039)
-- Name: level_penggunas level_penggunas_nama_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key69 UNIQUE (nama);


--
-- TOC entry 5514 (class 2606 OID 3343189)
-- Name: level_penggunas level_penggunas_nama_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key7 UNIQUE (nama);


--
-- TOC entry 5516 (class 2606 OID 3343041)
-- Name: level_penggunas level_penggunas_nama_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key70 UNIQUE (nama);


--
-- TOC entry 5518 (class 2606 OID 3343107)
-- Name: level_penggunas level_penggunas_nama_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key71 UNIQUE (nama);


--
-- TOC entry 5520 (class 2606 OID 3343043)
-- Name: level_penggunas level_penggunas_nama_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key72 UNIQUE (nama);


--
-- TOC entry 5522 (class 2606 OID 3343105)
-- Name: level_penggunas level_penggunas_nama_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key73 UNIQUE (nama);


--
-- TOC entry 5524 (class 2606 OID 3343045)
-- Name: level_penggunas level_penggunas_nama_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key74 UNIQUE (nama);


--
-- TOC entry 5526 (class 2606 OID 3343103)
-- Name: level_penggunas level_penggunas_nama_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key75 UNIQUE (nama);


--
-- TOC entry 5528 (class 2606 OID 3343047)
-- Name: level_penggunas level_penggunas_nama_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key76 UNIQUE (nama);


--
-- TOC entry 5530 (class 2606 OID 3343049)
-- Name: level_penggunas level_penggunas_nama_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key77 UNIQUE (nama);


--
-- TOC entry 5532 (class 2606 OID 3343051)
-- Name: level_penggunas level_penggunas_nama_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key78 UNIQUE (nama);


--
-- TOC entry 5534 (class 2606 OID 3343101)
-- Name: level_penggunas level_penggunas_nama_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key79 UNIQUE (nama);


--
-- TOC entry 5536 (class 2606 OID 3342955)
-- Name: level_penggunas level_penggunas_nama_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key8 UNIQUE (nama);


--
-- TOC entry 5538 (class 2606 OID 3343053)
-- Name: level_penggunas level_penggunas_nama_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key80 UNIQUE (nama);


--
-- TOC entry 5540 (class 2606 OID 3343099)
-- Name: level_penggunas level_penggunas_nama_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key81 UNIQUE (nama);


--
-- TOC entry 5542 (class 2606 OID 3343093)
-- Name: level_penggunas level_penggunas_nama_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key82 UNIQUE (nama);


--
-- TOC entry 5544 (class 2606 OID 3343055)
-- Name: level_penggunas level_penggunas_nama_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key83 UNIQUE (nama);


--
-- TOC entry 5546 (class 2606 OID 3343091)
-- Name: level_penggunas level_penggunas_nama_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key84 UNIQUE (nama);


--
-- TOC entry 5548 (class 2606 OID 3343057)
-- Name: level_penggunas level_penggunas_nama_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key85 UNIQUE (nama);


--
-- TOC entry 5550 (class 2606 OID 3343059)
-- Name: level_penggunas level_penggunas_nama_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key86 UNIQUE (nama);


--
-- TOC entry 5552 (class 2606 OID 3343089)
-- Name: level_penggunas level_penggunas_nama_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key87 UNIQUE (nama);


--
-- TOC entry 5554 (class 2606 OID 3343061)
-- Name: level_penggunas level_penggunas_nama_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key88 UNIQUE (nama);


--
-- TOC entry 5556 (class 2606 OID 3343087)
-- Name: level_penggunas level_penggunas_nama_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key89 UNIQUE (nama);


--
-- TOC entry 5558 (class 2606 OID 3343187)
-- Name: level_penggunas level_penggunas_nama_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key9 UNIQUE (nama);


--
-- TOC entry 5560 (class 2606 OID 3343063)
-- Name: level_penggunas level_penggunas_nama_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key90 UNIQUE (nama);


--
-- TOC entry 5562 (class 2606 OID 3343085)
-- Name: level_penggunas level_penggunas_nama_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key91 UNIQUE (nama);


--
-- TOC entry 5564 (class 2606 OID 3343065)
-- Name: level_penggunas level_penggunas_nama_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key92 UNIQUE (nama);


--
-- TOC entry 5566 (class 2606 OID 3343083)
-- Name: level_penggunas level_penggunas_nama_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key93 UNIQUE (nama);


--
-- TOC entry 5568 (class 2606 OID 3343067)
-- Name: level_penggunas level_penggunas_nama_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key94 UNIQUE (nama);


--
-- TOC entry 5570 (class 2606 OID 3343081)
-- Name: level_penggunas level_penggunas_nama_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key95 UNIQUE (nama);


--
-- TOC entry 5572 (class 2606 OID 3343069)
-- Name: level_penggunas level_penggunas_nama_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key96 UNIQUE (nama);


--
-- TOC entry 5574 (class 2606 OID 3343071)
-- Name: level_penggunas level_penggunas_nama_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key97 UNIQUE (nama);


--
-- TOC entry 5576 (class 2606 OID 3343079)
-- Name: level_penggunas level_penggunas_nama_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key98 UNIQUE (nama);


--
-- TOC entry 5578 (class 2606 OID 3343075)
-- Name: level_penggunas level_penggunas_nama_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_nama_key99 UNIQUE (nama);


--
-- TOC entry 5580 (class 2606 OID 3217051)
-- Name: level_penggunas level_penggunas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_pkey PRIMARY KEY (id);


--
-- TOC entry 5582 (class 2606 OID 3217060)
-- Name: nama_interfaces nama_interfaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nama_interfaces
    ADD CONSTRAINT nama_interfaces_pkey PRIMARY KEY (id);


--
-- TOC entry 5584 (class 2606 OID 3217067)
-- Name: nama_printers nama_printers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nama_printers
    ADD CONSTRAINT nama_printers_pkey PRIMARY KEY (id);


--
-- TOC entry 5586 (class 2606 OID 3217076)
-- Name: parameters parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parameters
    ADD CONSTRAINT parameters_pkey PRIMARY KEY (id);


--
-- TOC entry 5588 (class 2606 OID 3217083)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 5590 (class 2606 OID 3217092)
-- Name: permasalahan_atau_perbaikans permasalahan_atau_perbaikans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans
    ADD CONSTRAINT permasalahan_atau_perbaikans_pkey PRIMARY KEY (id);


--
-- TOC entry 5592 (class 2606 OID 3217101)
-- Name: perusahaans perusahaans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perusahaans
    ADD CONSTRAINT perusahaans_pkey PRIMARY KEY (id);


--
-- TOC entry 5594 (class 2606 OID 3217110)
-- Name: pos pos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_pkey PRIMARY KEY (id);


--
-- TOC entry 5596 (class 2606 OID 3217119)
-- Name: produk_members produk_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_members
    ADD CONSTRAINT produk_members_pkey PRIMARY KEY (id);


--
-- TOC entry 6184 (class 2606 OID 3261822)
-- Name: produk_vouchers produk_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_vouchers
    ADD CONSTRAINT produk_vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 5598 (class 2606 OID 3217137)
-- Name: riwayat_transaksi_ganti_nopols riwayat_transaksi_ganti_nopols_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols
    ADD CONSTRAINT riwayat_transaksi_ganti_nopols_pkey PRIMARY KEY (id);


--
-- TOC entry 5600 (class 2606 OID 3217146)
-- Name: riwayat_transaksi_kartu_members riwayat_transaksi_kartu_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members
    ADD CONSTRAINT riwayat_transaksi_kartu_members_pkey PRIMARY KEY (id);


--
-- TOC entry 5602 (class 2606 OID 3217153)
-- Name: shifts shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_pkey PRIMARY KEY (id);


--
-- TOC entry 5604 (class 2606 OID 3217160)
-- Name: tarif_dendas tarif_dendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_dendas
    ADD CONSTRAINT tarif_dendas_pkey PRIMARY KEY (id);


--
-- TOC entry 5606 (class 2606 OID 3217167)
-- Name: tarif_parkirs tarif_parkirs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_parkirs
    ADD CONSTRAINT tarif_parkirs_pkey PRIMARY KEY (id);


--
-- TOC entry 5608 (class 2606 OID 3217174)
-- Name: tipe_dendas tipe_dendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_dendas
    ADD CONSTRAINT tipe_dendas_pkey PRIMARY KEY (id);


--
-- TOC entry 5610 (class 2606 OID 3217181)
-- Name: tipe_kendaraans tipe_kendaraans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_kendaraans
    ADD CONSTRAINT tipe_kendaraans_pkey PRIMARY KEY (id);


--
-- TOC entry 5612 (class 2606 OID 3217188)
-- Name: tipe_manlesses tipe_manlesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipe_manlesses
    ADD CONSTRAINT tipe_manlesses_pkey PRIMARY KEY (id);


--
-- TOC entry 6188 (class 2606 OID 3266117)
-- Name: transaksis transaksis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pkey PRIMARY KEY (id);


--
-- TOC entry 5614 (class 2606 OID 3343558)
-- Name: users users_nama_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key UNIQUE (nama);


--
-- TOC entry 5616 (class 2606 OID 3343560)
-- Name: users users_nama_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key1 UNIQUE (nama);


--
-- TOC entry 5618 (class 2606 OID 3343546)
-- Name: users users_nama_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key10 UNIQUE (nama);


--
-- TOC entry 5620 (class 2606 OID 3343624)
-- Name: users users_nama_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key100 UNIQUE (nama);


--
-- TOC entry 5622 (class 2606 OID 3343614)
-- Name: users users_nama_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key101 UNIQUE (nama);


--
-- TOC entry 5624 (class 2606 OID 3343616)
-- Name: users users_nama_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key102 UNIQUE (nama);


--
-- TOC entry 5626 (class 2606 OID 3343622)
-- Name: users users_nama_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key103 UNIQUE (nama);


--
-- TOC entry 5628 (class 2606 OID 3343618)
-- Name: users users_nama_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key104 UNIQUE (nama);


--
-- TOC entry 5630 (class 2606 OID 3343620)
-- Name: users users_nama_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key105 UNIQUE (nama);


--
-- TOC entry 5632 (class 2606 OID 3343402)
-- Name: users users_nama_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key106 UNIQUE (nama);


--
-- TOC entry 5634 (class 2606 OID 3343516)
-- Name: users users_nama_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key107 UNIQUE (nama);


--
-- TOC entry 5636 (class 2606 OID 3343446)
-- Name: users users_nama_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key108 UNIQUE (nama);


--
-- TOC entry 5638 (class 2606 OID 3343518)
-- Name: users users_nama_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key109 UNIQUE (nama);


--
-- TOC entry 5640 (class 2606 OID 3343404)
-- Name: users users_nama_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key11 UNIQUE (nama);


--
-- TOC entry 5642 (class 2606 OID 3343520)
-- Name: users users_nama_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key110 UNIQUE (nama);


--
-- TOC entry 5644 (class 2606 OID 3343578)
-- Name: users users_nama_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key111 UNIQUE (nama);


--
-- TOC entry 5646 (class 2606 OID 3343522)
-- Name: users users_nama_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key112 UNIQUE (nama);


--
-- TOC entry 5648 (class 2606 OID 3343524)
-- Name: users users_nama_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key113 UNIQUE (nama);


--
-- TOC entry 5650 (class 2606 OID 3343478)
-- Name: users users_nama_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key114 UNIQUE (nama);


--
-- TOC entry 5652 (class 2606 OID 3343480)
-- Name: users users_nama_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key115 UNIQUE (nama);


--
-- TOC entry 5654 (class 2606 OID 3343482)
-- Name: users users_nama_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key116 UNIQUE (nama);


--
-- TOC entry 5656 (class 2606 OID 3343506)
-- Name: users users_nama_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key117 UNIQUE (nama);


--
-- TOC entry 5658 (class 2606 OID 3343484)
-- Name: users users_nama_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key118 UNIQUE (nama);


--
-- TOC entry 5660 (class 2606 OID 3343504)
-- Name: users users_nama_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key119 UNIQUE (nama);


--
-- TOC entry 5662 (class 2606 OID 3343526)
-- Name: users users_nama_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key12 UNIQUE (nama);


--
-- TOC entry 5664 (class 2606 OID 3343486)
-- Name: users users_nama_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key120 UNIQUE (nama);


--
-- TOC entry 5666 (class 2606 OID 3343502)
-- Name: users users_nama_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key121 UNIQUE (nama);


--
-- TOC entry 5668 (class 2606 OID 3343488)
-- Name: users users_nama_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key122 UNIQUE (nama);


--
-- TOC entry 5670 (class 2606 OID 3343500)
-- Name: users users_nama_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key123 UNIQUE (nama);


--
-- TOC entry 5672 (class 2606 OID 3343490)
-- Name: users users_nama_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key124 UNIQUE (nama);


--
-- TOC entry 5674 (class 2606 OID 3343492)
-- Name: users users_nama_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key125 UNIQUE (nama);


--
-- TOC entry 5676 (class 2606 OID 3343498)
-- Name: users users_nama_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key126 UNIQUE (nama);


--
-- TOC entry 5678 (class 2606 OID 3343494)
-- Name: users users_nama_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key127 UNIQUE (nama);


--
-- TOC entry 5680 (class 2606 OID 3343496)
-- Name: users users_nama_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key128 UNIQUE (nama);


--
-- TOC entry 5682 (class 2606 OID 3343372)
-- Name: users users_nama_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key129 UNIQUE (nama);


--
-- TOC entry 5684 (class 2606 OID 3343528)
-- Name: users users_nama_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key13 UNIQUE (nama);


--
-- TOC entry 5686 (class 2606 OID 3343632)
-- Name: users users_nama_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key130 UNIQUE (nama);


--
-- TOC entry 5688 (class 2606 OID 3343634)
-- Name: users users_nama_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key131 UNIQUE (nama);


--
-- TOC entry 5690 (class 2606 OID 3343636)
-- Name: users users_nama_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key132 UNIQUE (nama);


--
-- TOC entry 5692 (class 2606 OID 3343370)
-- Name: users users_nama_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key133 UNIQUE (nama);


--
-- TOC entry 5694 (class 2606 OID 3343638)
-- Name: users users_nama_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key134 UNIQUE (nama);


--
-- TOC entry 5696 (class 2606 OID 3343640)
-- Name: users users_nama_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key135 UNIQUE (nama);


--
-- TOC entry 5698 (class 2606 OID 3343368)
-- Name: users users_nama_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key136 UNIQUE (nama);


--
-- TOC entry 5700 (class 2606 OID 3343642)
-- Name: users users_nama_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key137 UNIQUE (nama);


--
-- TOC entry 5702 (class 2606 OID 3343366)
-- Name: users users_nama_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key138 UNIQUE (nama);


--
-- TOC entry 5704 (class 2606 OID 3343644)
-- Name: users users_nama_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key139 UNIQUE (nama);


--
-- TOC entry 5706 (class 2606 OID 3343542)
-- Name: users users_nama_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key14 UNIQUE (nama);


--
-- TOC entry 5708 (class 2606 OID 3343364)
-- Name: users users_nama_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key140 UNIQUE (nama);


--
-- TOC entry 5710 (class 2606 OID 3343530)
-- Name: users users_nama_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key15 UNIQUE (nama);


--
-- TOC entry 5712 (class 2606 OID 3343540)
-- Name: users users_nama_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key16 UNIQUE (nama);


--
-- TOC entry 5714 (class 2606 OID 3343406)
-- Name: users users_nama_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key17 UNIQUE (nama);


--
-- TOC entry 5716 (class 2606 OID 3343532)
-- Name: users users_nama_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key18 UNIQUE (nama);


--
-- TOC entry 5718 (class 2606 OID 3343538)
-- Name: users users_nama_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key19 UNIQUE (nama);


--
-- TOC entry 5720 (class 2606 OID 3343554)
-- Name: users users_nama_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key2 UNIQUE (nama);


--
-- TOC entry 5722 (class 2606 OID 3343534)
-- Name: users users_nama_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key20 UNIQUE (nama);


--
-- TOC entry 5724 (class 2606 OID 3343536)
-- Name: users users_nama_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key21 UNIQUE (nama);


--
-- TOC entry 5726 (class 2606 OID 3343408)
-- Name: users users_nama_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key22 UNIQUE (nama);


--
-- TOC entry 5728 (class 2606 OID 3343444)
-- Name: users users_nama_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key23 UNIQUE (nama);


--
-- TOC entry 5730 (class 2606 OID 3343410)
-- Name: users users_nama_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key24 UNIQUE (nama);


--
-- TOC entry 5732 (class 2606 OID 3343412)
-- Name: users users_nama_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key25 UNIQUE (nama);


--
-- TOC entry 5734 (class 2606 OID 3343442)
-- Name: users users_nama_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key26 UNIQUE (nama);


--
-- TOC entry 5736 (class 2606 OID 3343414)
-- Name: users users_nama_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key27 UNIQUE (nama);


--
-- TOC entry 5738 (class 2606 OID 3343416)
-- Name: users users_nama_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key28 UNIQUE (nama);


--
-- TOC entry 5740 (class 2606 OID 3343418)
-- Name: users users_nama_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key29 UNIQUE (nama);


--
-- TOC entry 5742 (class 2606 OID 3343562)
-- Name: users users_nama_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key3 UNIQUE (nama);


--
-- TOC entry 5744 (class 2606 OID 3343422)
-- Name: users users_nama_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key30 UNIQUE (nama);


--
-- TOC entry 5746 (class 2606 OID 3343440)
-- Name: users users_nama_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key31 UNIQUE (nama);


--
-- TOC entry 5748 (class 2606 OID 3343424)
-- Name: users users_nama_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key32 UNIQUE (nama);


--
-- TOC entry 5750 (class 2606 OID 3343426)
-- Name: users users_nama_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key33 UNIQUE (nama);


--
-- TOC entry 5752 (class 2606 OID 3343438)
-- Name: users users_nama_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key34 UNIQUE (nama);


--
-- TOC entry 5754 (class 2606 OID 3343474)
-- Name: users users_nama_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key35 UNIQUE (nama);


--
-- TOC entry 5756 (class 2606 OID 3343476)
-- Name: users users_nama_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key36 UNIQUE (nama);


--
-- TOC entry 5758 (class 2606 OID 3343394)
-- Name: users users_nama_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key37 UNIQUE (nama);


--
-- TOC entry 5760 (class 2606 OID 3343392)
-- Name: users users_nama_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key38 UNIQUE (nama);


--
-- TOC entry 5762 (class 2606 OID 3343564)
-- Name: users users_nama_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key39 UNIQUE (nama);


--
-- TOC entry 5764 (class 2606 OID 3343566)
-- Name: users users_nama_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key4 UNIQUE (nama);


--
-- TOC entry 5766 (class 2606 OID 3343508)
-- Name: users users_nama_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key40 UNIQUE (nama);


--
-- TOC entry 5768 (class 2606 OID 3343390)
-- Name: users users_nama_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key41 UNIQUE (nama);


--
-- TOC entry 5770 (class 2606 OID 3343510)
-- Name: users users_nama_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key42 UNIQUE (nama);


--
-- TOC entry 5772 (class 2606 OID 3343388)
-- Name: users users_nama_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key43 UNIQUE (nama);


--
-- TOC entry 5774 (class 2606 OID 3343386)
-- Name: users users_nama_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key44 UNIQUE (nama);


--
-- TOC entry 5776 (class 2606 OID 3343472)
-- Name: users users_nama_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key45 UNIQUE (nama);


--
-- TOC entry 5778 (class 2606 OID 3343556)
-- Name: users users_nama_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key46 UNIQUE (nama);


--
-- TOC entry 5780 (class 2606 OID 3343610)
-- Name: users users_nama_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key47 UNIQUE (nama);


--
-- TOC entry 5782 (class 2606 OID 3343428)
-- Name: users users_nama_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key48 UNIQUE (nama);


--
-- TOC entry 5784 (class 2606 OID 3343608)
-- Name: users users_nama_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key49 UNIQUE (nama);


--
-- TOC entry 5786 (class 2606 OID 3343396)
-- Name: users users_nama_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key5 UNIQUE (nama);


--
-- TOC entry 5788 (class 2606 OID 3343384)
-- Name: users users_nama_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key50 UNIQUE (nama);


--
-- TOC entry 5790 (class 2606 OID 3343550)
-- Name: users users_nama_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key51 UNIQUE (nama);


--
-- TOC entry 5792 (class 2606 OID 3343430)
-- Name: users users_nama_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key52 UNIQUE (nama);


--
-- TOC entry 5794 (class 2606 OID 3343606)
-- Name: users users_nama_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key53 UNIQUE (nama);


--
-- TOC entry 5796 (class 2606 OID 3343432)
-- Name: users users_nama_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key54 UNIQUE (nama);


--
-- TOC entry 5798 (class 2606 OID 3343434)
-- Name: users users_nama_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key55 UNIQUE (nama);


--
-- TOC entry 5800 (class 2606 OID 3343604)
-- Name: users users_nama_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key56 UNIQUE (nama);


--
-- TOC entry 5802 (class 2606 OID 3343436)
-- Name: users users_nama_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key57 UNIQUE (nama);


--
-- TOC entry 5804 (class 2606 OID 3343602)
-- Name: users users_nama_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key58 UNIQUE (nama);


--
-- TOC entry 5806 (class 2606 OID 3343544)
-- Name: users users_nama_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key59 UNIQUE (nama);


--
-- TOC entry 5808 (class 2606 OID 3343398)
-- Name: users users_nama_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key6 UNIQUE (nama);


--
-- TOC entry 5810 (class 2606 OID 3343600)
-- Name: users users_nama_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key60 UNIQUE (nama);


--
-- TOC entry 5812 (class 2606 OID 3343420)
-- Name: users users_nama_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key61 UNIQUE (nama);


--
-- TOC entry 5814 (class 2606 OID 3343568)
-- Name: users users_nama_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key62 UNIQUE (nama);


--
-- TOC entry 5816 (class 2606 OID 3343598)
-- Name: users users_nama_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key63 UNIQUE (nama);


--
-- TOC entry 5818 (class 2606 OID 3343570)
-- Name: users users_nama_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key64 UNIQUE (nama);


--
-- TOC entry 5820 (class 2606 OID 3343572)
-- Name: users users_nama_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key65 UNIQUE (nama);


--
-- TOC entry 5822 (class 2606 OID 3343596)
-- Name: users users_nama_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key66 UNIQUE (nama);


--
-- TOC entry 5824 (class 2606 OID 3343574)
-- Name: users users_nama_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key67 UNIQUE (nama);


--
-- TOC entry 5826 (class 2606 OID 3343594)
-- Name: users users_nama_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key68 UNIQUE (nama);


--
-- TOC entry 5828 (class 2606 OID 3343576)
-- Name: users users_nama_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key69 UNIQUE (nama);


--
-- TOC entry 5830 (class 2606 OID 3343552)
-- Name: users users_nama_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key7 UNIQUE (nama);


--
-- TOC entry 5832 (class 2606 OID 3343592)
-- Name: users users_nama_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key70 UNIQUE (nama);


--
-- TOC entry 5834 (class 2606 OID 3343580)
-- Name: users users_nama_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key71 UNIQUE (nama);


--
-- TOC entry 5836 (class 2606 OID 3343582)
-- Name: users users_nama_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key72 UNIQUE (nama);


--
-- TOC entry 5838 (class 2606 OID 3343584)
-- Name: users users_nama_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key73 UNIQUE (nama);


--
-- TOC entry 5840 (class 2606 OID 3343590)
-- Name: users users_nama_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key74 UNIQUE (nama);


--
-- TOC entry 5842 (class 2606 OID 3343586)
-- Name: users users_nama_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key75 UNIQUE (nama);


--
-- TOC entry 5844 (class 2606 OID 3343588)
-- Name: users users_nama_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key76 UNIQUE (nama);


--
-- TOC entry 5846 (class 2606 OID 3343382)
-- Name: users users_nama_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key77 UNIQUE (nama);


--
-- TOC entry 5848 (class 2606 OID 3343512)
-- Name: users users_nama_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key78 UNIQUE (nama);


--
-- TOC entry 5850 (class 2606 OID 3343514)
-- Name: users users_nama_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key79 UNIQUE (nama);


--
-- TOC entry 5852 (class 2606 OID 3343400)
-- Name: users users_nama_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key8 UNIQUE (nama);


--
-- TOC entry 5854 (class 2606 OID 3343380)
-- Name: users users_nama_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key80 UNIQUE (nama);


--
-- TOC entry 5856 (class 2606 OID 3343448)
-- Name: users users_nama_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key81 UNIQUE (nama);


--
-- TOC entry 5858 (class 2606 OID 3343378)
-- Name: users users_nama_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key82 UNIQUE (nama);


--
-- TOC entry 5860 (class 2606 OID 3343450)
-- Name: users users_nama_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key83 UNIQUE (nama);


--
-- TOC entry 5862 (class 2606 OID 3343376)
-- Name: users users_nama_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key84 UNIQUE (nama);


--
-- TOC entry 5864 (class 2606 OID 3343452)
-- Name: users users_nama_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key85 UNIQUE (nama);


--
-- TOC entry 5866 (class 2606 OID 3343454)
-- Name: users users_nama_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key86 UNIQUE (nama);


--
-- TOC entry 5868 (class 2606 OID 3343374)
-- Name: users users_nama_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key87 UNIQUE (nama);


--
-- TOC entry 5870 (class 2606 OID 3343456)
-- Name: users users_nama_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key88 UNIQUE (nama);


--
-- TOC entry 5872 (class 2606 OID 3343458)
-- Name: users users_nama_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key89 UNIQUE (nama);


--
-- TOC entry 5874 (class 2606 OID 3343548)
-- Name: users users_nama_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key9 UNIQUE (nama);


--
-- TOC entry 5876 (class 2606 OID 3343630)
-- Name: users users_nama_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key90 UNIQUE (nama);


--
-- TOC entry 5878 (class 2606 OID 3343460)
-- Name: users users_nama_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key91 UNIQUE (nama);


--
-- TOC entry 5880 (class 2606 OID 3343628)
-- Name: users users_nama_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key92 UNIQUE (nama);


--
-- TOC entry 5882 (class 2606 OID 3343462)
-- Name: users users_nama_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key93 UNIQUE (nama);


--
-- TOC entry 5884 (class 2606 OID 3343626)
-- Name: users users_nama_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key94 UNIQUE (nama);


--
-- TOC entry 5886 (class 2606 OID 3343464)
-- Name: users users_nama_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key95 UNIQUE (nama);


--
-- TOC entry 5888 (class 2606 OID 3343466)
-- Name: users users_nama_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key96 UNIQUE (nama);


--
-- TOC entry 5890 (class 2606 OID 3343468)
-- Name: users users_nama_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key97 UNIQUE (nama);


--
-- TOC entry 5892 (class 2606 OID 3343470)
-- Name: users users_nama_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key98 UNIQUE (nama);


--
-- TOC entry 5894 (class 2606 OID 3343612)
-- Name: users users_nama_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nama_key99 UNIQUE (nama);


--
-- TOC entry 5896 (class 2606 OID 3217215)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 5898 (class 2606 OID 3343802)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 5900 (class 2606 OID 3343804)
-- Name: users users_username_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key1 UNIQUE (username);


--
-- TOC entry 5902 (class 2606 OID 3343792)
-- Name: users users_username_key10; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key10 UNIQUE (username);


--
-- TOC entry 5904 (class 2606 OID 3343910)
-- Name: users users_username_key100; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key100 UNIQUE (username);


--
-- TOC entry 5906 (class 2606 OID 3343896)
-- Name: users users_username_key101; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key101 UNIQUE (username);


--
-- TOC entry 5908 (class 2606 OID 3343898)
-- Name: users users_username_key102; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key102 UNIQUE (username);


--
-- TOC entry 5910 (class 2606 OID 3343908)
-- Name: users users_username_key103; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key103 UNIQUE (username);


--
-- TOC entry 5912 (class 2606 OID 3343900)
-- Name: users users_username_key104; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key104 UNIQUE (username);


--
-- TOC entry 5914 (class 2606 OID 3343906)
-- Name: users users_username_key105; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key105 UNIQUE (username);


--
-- TOC entry 5916 (class 2606 OID 3343826)
-- Name: users users_username_key106; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key106 UNIQUE (username);


--
-- TOC entry 5918 (class 2606 OID 3343904)
-- Name: users users_username_key107; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key107 UNIQUE (username);


--
-- TOC entry 5920 (class 2606 OID 3343902)
-- Name: users users_username_key108; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key108 UNIQUE (username);


--
-- TOC entry 5922 (class 2606 OID 3343750)
-- Name: users users_username_key109; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key109 UNIQUE (username);


--
-- TOC entry 5924 (class 2606 OID 3343816)
-- Name: users users_username_key11; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key11 UNIQUE (username);


--
-- TOC entry 5926 (class 2606 OID 3343752)
-- Name: users users_username_key110; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key110 UNIQUE (username);


--
-- TOC entry 5928 (class 2606 OID 3343780)
-- Name: users users_username_key111; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key111 UNIQUE (username);


--
-- TOC entry 5930 (class 2606 OID 3343754)
-- Name: users users_username_key112; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key112 UNIQUE (username);


--
-- TOC entry 5932 (class 2606 OID 3343778)
-- Name: users users_username_key113; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key113 UNIQUE (username);


--
-- TOC entry 5934 (class 2606 OID 3343756)
-- Name: users users_username_key114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key114 UNIQUE (username);


--
-- TOC entry 5936 (class 2606 OID 3343758)
-- Name: users users_username_key115; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key115 UNIQUE (username);


--
-- TOC entry 5938 (class 2606 OID 3343760)
-- Name: users users_username_key116; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key116 UNIQUE (username);


--
-- TOC entry 5940 (class 2606 OID 3343776)
-- Name: users users_username_key117; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key117 UNIQUE (username);


--
-- TOC entry 5942 (class 2606 OID 3343762)
-- Name: users users_username_key118; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key118 UNIQUE (username);


--
-- TOC entry 5944 (class 2606 OID 3343774)
-- Name: users users_username_key119; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key119 UNIQUE (username);


--
-- TOC entry 5946 (class 2606 OID 3343818)
-- Name: users users_username_key12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key12 UNIQUE (username);


--
-- TOC entry 5948 (class 2606 OID 3343764)
-- Name: users users_username_key120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key120 UNIQUE (username);


--
-- TOC entry 5950 (class 2606 OID 3343772)
-- Name: users users_username_key121; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key121 UNIQUE (username);


--
-- TOC entry 5952 (class 2606 OID 3343766)
-- Name: users users_username_key122; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key122 UNIQUE (username);


--
-- TOC entry 5954 (class 2606 OID 3343770)
-- Name: users users_username_key123; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key123 UNIQUE (username);


--
-- TOC entry 5956 (class 2606 OID 3343768)
-- Name: users users_username_key124; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key124 UNIQUE (username);


--
-- TOC entry 5958 (class 2606 OID 3343912)
-- Name: users users_username_key125; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key125 UNIQUE (username);


--
-- TOC entry 5960 (class 2606 OID 3343660)
-- Name: users users_username_key126; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key126 UNIQUE (username);


--
-- TOC entry 5962 (class 2606 OID 3343914)
-- Name: users users_username_key127; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key127 UNIQUE (username);


--
-- TOC entry 5964 (class 2606 OID 3343658)
-- Name: users users_username_key128; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key128 UNIQUE (username);


--
-- TOC entry 5966 (class 2606 OID 3343656)
-- Name: users users_username_key129; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key129 UNIQUE (username);


--
-- TOC entry 5968 (class 2606 OID 3343820)
-- Name: users users_username_key13; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key13 UNIQUE (username);


--
-- TOC entry 5970 (class 2606 OID 3343916)
-- Name: users users_username_key130; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key130 UNIQUE (username);


--
-- TOC entry 5972 (class 2606 OID 3343918)
-- Name: users users_username_key131; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key131 UNIQUE (username);


--
-- TOC entry 5974 (class 2606 OID 3343920)
-- Name: users users_username_key132; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key132 UNIQUE (username);


--
-- TOC entry 5976 (class 2606 OID 3343654)
-- Name: users users_username_key133; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key133 UNIQUE (username);


--
-- TOC entry 5978 (class 2606 OID 3343922)
-- Name: users users_username_key134; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key134 UNIQUE (username);


--
-- TOC entry 5980 (class 2606 OID 3343924)
-- Name: users users_username_key135; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key135 UNIQUE (username);


--
-- TOC entry 5982 (class 2606 OID 3343652)
-- Name: users users_username_key136; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key136 UNIQUE (username);


--
-- TOC entry 5984 (class 2606 OID 3343926)
-- Name: users users_username_key137; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key137 UNIQUE (username);


--
-- TOC entry 5986 (class 2606 OID 3343650)
-- Name: users users_username_key138; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key138 UNIQUE (username);


--
-- TOC entry 5988 (class 2606 OID 3343928)
-- Name: users users_username_key139; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key139 UNIQUE (username);


--
-- TOC entry 5990 (class 2606 OID 3343788)
-- Name: users users_username_key14; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key14 UNIQUE (username);


--
-- TOC entry 5992 (class 2606 OID 3343648)
-- Name: users users_username_key140; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key140 UNIQUE (username);


--
-- TOC entry 5994 (class 2606 OID 3343822)
-- Name: users users_username_key15; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key15 UNIQUE (username);


--
-- TOC entry 5996 (class 2606 OID 3343786)
-- Name: users users_username_key16; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key16 UNIQUE (username);


--
-- TOC entry 5998 (class 2606 OID 3343664)
-- Name: users users_username_key17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key17 UNIQUE (username);


--
-- TOC entry 6000 (class 2606 OID 3343824)
-- Name: users users_username_key18; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key18 UNIQUE (username);


--
-- TOC entry 6002 (class 2606 OID 3343882)
-- Name: users users_username_key19; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key19 UNIQUE (username);


--
-- TOC entry 6004 (class 2606 OID 3343798)
-- Name: users users_username_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key2 UNIQUE (username);


--
-- TOC entry 6006 (class 2606 OID 3343880)
-- Name: users users_username_key20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key20 UNIQUE (username);


--
-- TOC entry 6008 (class 2606 OID 3343828)
-- Name: users users_username_key21; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key21 UNIQUE (username);


--
-- TOC entry 6010 (class 2606 OID 3343830)
-- Name: users users_username_key22; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key22 UNIQUE (username);


--
-- TOC entry 6012 (class 2606 OID 3343842)
-- Name: users users_username_key23; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key23 UNIQUE (username);


--
-- TOC entry 6014 (class 2606 OID 3343832)
-- Name: users users_username_key24; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key24 UNIQUE (username);


--
-- TOC entry 6016 (class 2606 OID 3343836)
-- Name: users users_username_key25; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key25 UNIQUE (username);


--
-- TOC entry 6018 (class 2606 OID 3343840)
-- Name: users users_username_key26; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key26 UNIQUE (username);


--
-- TOC entry 6020 (class 2606 OID 3343838)
-- Name: users users_username_key27; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key27 UNIQUE (username);


--
-- TOC entry 6022 (class 2606 OID 3343844)
-- Name: users users_username_key28; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key28 UNIQUE (username);


--
-- TOC entry 6024 (class 2606 OID 3343846)
-- Name: users users_username_key29; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key29 UNIQUE (username);


--
-- TOC entry 6026 (class 2606 OID 3343806)
-- Name: users users_username_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key3 UNIQUE (username);


--
-- TOC entry 6028 (class 2606 OID 3343850)
-- Name: users users_username_key30; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key30 UNIQUE (username);


--
-- TOC entry 6030 (class 2606 OID 3343878)
-- Name: users users_username_key31; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key31 UNIQUE (username);


--
-- TOC entry 6032 (class 2606 OID 3343852)
-- Name: users users_username_key32; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key32 UNIQUE (username);


--
-- TOC entry 6034 (class 2606 OID 3343856)
-- Name: users users_username_key33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key33 UNIQUE (username);


--
-- TOC entry 6036 (class 2606 OID 3343876)
-- Name: users users_username_key34; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key34 UNIQUE (username);


--
-- TOC entry 6038 (class 2606 OID 3343858)
-- Name: users users_username_key35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key35 UNIQUE (username);


--
-- TOC entry 6040 (class 2606 OID 3343860)
-- Name: users users_username_key36; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key36 UNIQUE (username);


--
-- TOC entry 6042 (class 2606 OID 3343874)
-- Name: users users_username_key37; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key37 UNIQUE (username);


--
-- TOC entry 6044 (class 2606 OID 3343872)
-- Name: users users_username_key38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key38 UNIQUE (username);


--
-- TOC entry 6046 (class 2606 OID 3343854)
-- Name: users users_username_key39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key39 UNIQUE (username);


--
-- TOC entry 6048 (class 2606 OID 3343808)
-- Name: users users_username_key4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key4 UNIQUE (username);


--
-- TOC entry 6050 (class 2606 OID 3343862)
-- Name: users users_username_key40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key40 UNIQUE (username);


--
-- TOC entry 6052 (class 2606 OID 3343870)
-- Name: users users_username_key41; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key41 UNIQUE (username);


--
-- TOC entry 6054 (class 2606 OID 3343864)
-- Name: users users_username_key42; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key42 UNIQUE (username);


--
-- TOC entry 6056 (class 2606 OID 3343868)
-- Name: users users_username_key43; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key43 UNIQUE (username);


--
-- TOC entry 6058 (class 2606 OID 3343866)
-- Name: users users_username_key44; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key44 UNIQUE (username);


--
-- TOC entry 6060 (class 2606 OID 3343790)
-- Name: users users_username_key45; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key45 UNIQUE (username);


--
-- TOC entry 6062 (class 2606 OID 3343834)
-- Name: users users_username_key46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key46 UNIQUE (username);


--
-- TOC entry 6064 (class 2606 OID 3343848)
-- Name: users users_username_key47; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key47 UNIQUE (username);


--
-- TOC entry 6066 (class 2606 OID 3343666)
-- Name: users users_username_key48; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key48 UNIQUE (username);


--
-- TOC entry 6068 (class 2606 OID 3343784)
-- Name: users users_username_key49; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key49 UNIQUE (username);


--
-- TOC entry 6070 (class 2606 OID 3343810)
-- Name: users users_username_key5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key5 UNIQUE (username);


--
-- TOC entry 6072 (class 2606 OID 3343668)
-- Name: users users_username_key50; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key50 UNIQUE (username);


--
-- TOC entry 6074 (class 2606 OID 3343782)
-- Name: users users_username_key51; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key51 UNIQUE (username);


--
-- TOC entry 6076 (class 2606 OID 3343670)
-- Name: users users_username_key52; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key52 UNIQUE (username);


--
-- TOC entry 6078 (class 2606 OID 3343748)
-- Name: users users_username_key53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key53 UNIQUE (username);


--
-- TOC entry 6080 (class 2606 OID 3343672)
-- Name: users users_username_key54; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key54 UNIQUE (username);


--
-- TOC entry 6082 (class 2606 OID 3343674)
-- Name: users users_username_key55; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key55 UNIQUE (username);


--
-- TOC entry 6084 (class 2606 OID 3343704)
-- Name: users users_username_key56; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key56 UNIQUE (username);


--
-- TOC entry 6086 (class 2606 OID 3343678)
-- Name: users users_username_key57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key57 UNIQUE (username);


--
-- TOC entry 6088 (class 2606 OID 3343702)
-- Name: users users_username_key58; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key58 UNIQUE (username);


--
-- TOC entry 6090 (class 2606 OID 3343680)
-- Name: users users_username_key59; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key59 UNIQUE (username);


--
-- TOC entry 6092 (class 2606 OID 3343812)
-- Name: users users_username_key6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key6 UNIQUE (username);


--
-- TOC entry 6094 (class 2606 OID 3343800)
-- Name: users users_username_key60; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key60 UNIQUE (username);


--
-- TOC entry 6096 (class 2606 OID 3343682)
-- Name: users users_username_key61; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key61 UNIQUE (username);


--
-- TOC entry 6098 (class 2606 OID 3343684)
-- Name: users users_username_key62; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key62 UNIQUE (username);


--
-- TOC entry 6100 (class 2606 OID 3343700)
-- Name: users users_username_key63; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key63 UNIQUE (username);


--
-- TOC entry 6102 (class 2606 OID 3343686)
-- Name: users users_username_key64; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key64 UNIQUE (username);


--
-- TOC entry 6104 (class 2606 OID 3343688)
-- Name: users users_username_key65; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key65 UNIQUE (username);


--
-- TOC entry 6106 (class 2606 OID 3343698)
-- Name: users users_username_key66; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key66 UNIQUE (username);


--
-- TOC entry 6108 (class 2606 OID 3343690)
-- Name: users users_username_key67; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key67 UNIQUE (username);


--
-- TOC entry 6110 (class 2606 OID 3343696)
-- Name: users users_username_key68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key68 UNIQUE (username);


--
-- TOC entry 6112 (class 2606 OID 3343692)
-- Name: users users_username_key69; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key69 UNIQUE (username);


--
-- TOC entry 6114 (class 2606 OID 3343796)
-- Name: users users_username_key7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key7 UNIQUE (username);


--
-- TOC entry 6116 (class 2606 OID 3343694)
-- Name: users users_username_key70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key70 UNIQUE (username);


--
-- TOC entry 6118 (class 2606 OID 3343706)
-- Name: users users_username_key71; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key71 UNIQUE (username);


--
-- TOC entry 6120 (class 2606 OID 3343708)
-- Name: users users_username_key72; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key72 UNIQUE (username);


--
-- TOC entry 6122 (class 2606 OID 3343710)
-- Name: users users_username_key73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key73 UNIQUE (username);


--
-- TOC entry 6124 (class 2606 OID 3343746)
-- Name: users users_username_key74; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key74 UNIQUE (username);


--
-- TOC entry 6126 (class 2606 OID 3343712)
-- Name: users users_username_key75; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key75 UNIQUE (username);


--
-- TOC entry 6128 (class 2606 OID 3343744)
-- Name: users users_username_key76; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key76 UNIQUE (username);


--
-- TOC entry 6130 (class 2606 OID 3343676)
-- Name: users users_username_key77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key77 UNIQUE (username);


--
-- TOC entry 6132 (class 2606 OID 3343714)
-- Name: users users_username_key78; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key78 UNIQUE (username);


--
-- TOC entry 6134 (class 2606 OID 3343716)
-- Name: users users_username_key79; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key79 UNIQUE (username);


--
-- TOC entry 6136 (class 2606 OID 3343814)
-- Name: users users_username_key8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key8 UNIQUE (username);


--
-- TOC entry 6138 (class 2606 OID 3343742)
-- Name: users users_username_key80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key80 UNIQUE (username);


--
-- TOC entry 6140 (class 2606 OID 3343718)
-- Name: users users_username_key81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key81 UNIQUE (username);


--
-- TOC entry 6142 (class 2606 OID 3343740)
-- Name: users users_username_key82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key82 UNIQUE (username);


--
-- TOC entry 6144 (class 2606 OID 3343720)
-- Name: users users_username_key83; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key83 UNIQUE (username);


--
-- TOC entry 6146 (class 2606 OID 3343738)
-- Name: users users_username_key84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key84 UNIQUE (username);


--
-- TOC entry 6148 (class 2606 OID 3343722)
-- Name: users users_username_key85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key85 UNIQUE (username);


--
-- TOC entry 6150 (class 2606 OID 3343724)
-- Name: users users_username_key86; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key86 UNIQUE (username);


--
-- TOC entry 6152 (class 2606 OID 3343736)
-- Name: users users_username_key87; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key87 UNIQUE (username);


--
-- TOC entry 6154 (class 2606 OID 3343726)
-- Name: users users_username_key88; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key88 UNIQUE (username);


--
-- TOC entry 6156 (class 2606 OID 3343728)
-- Name: users users_username_key89; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key89 UNIQUE (username);


--
-- TOC entry 6158 (class 2606 OID 3343794)
-- Name: users users_username_key9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key9 UNIQUE (username);


--
-- TOC entry 6160 (class 2606 OID 3343734)
-- Name: users users_username_key90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key90 UNIQUE (username);


--
-- TOC entry 6162 (class 2606 OID 3343730)
-- Name: users users_username_key91; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key91 UNIQUE (username);


--
-- TOC entry 6164 (class 2606 OID 3343732)
-- Name: users users_username_key92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key92 UNIQUE (username);


--
-- TOC entry 6166 (class 2606 OID 3343884)
-- Name: users users_username_key93; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key93 UNIQUE (username);


--
-- TOC entry 6168 (class 2606 OID 3343662)
-- Name: users users_username_key94; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key94 UNIQUE (username);


--
-- TOC entry 6170 (class 2606 OID 3343886)
-- Name: users users_username_key95; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key95 UNIQUE (username);


--
-- TOC entry 6172 (class 2606 OID 3343888)
-- Name: users users_username_key96; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key96 UNIQUE (username);


--
-- TOC entry 6174 (class 2606 OID 3343890)
-- Name: users users_username_key97; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key97 UNIQUE (username);


--
-- TOC entry 6176 (class 2606 OID 3343892)
-- Name: users users_username_key98; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key98 UNIQUE (username);


--
-- TOC entry 6178 (class 2606 OID 3343894)
-- Name: users users_username_key99; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key99 UNIQUE (username);


--
-- TOC entry 6214 (class 2606 OID 3342529)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_data_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_data_member_id_fkey FOREIGN KEY (data_member_id) REFERENCES public.data_members(id) ON UPDATE CASCADE;


--
-- TOC entry 6215 (class 2606 OID 3342519)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6216 (class 2606 OID 3342524)
-- Name: aktivitas_gerbang_kendaraans aktivitas_gerbang_kendaraans_petugas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aktivitas_gerbang_kendaraans
    ADD CONSTRAINT aktivitas_gerbang_kendaraans_petugas_id_fkey FOREIGN KEY (petugas_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6217 (class 2606 OID 3342534)
-- Name: data_members data_members_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


--
-- TOC entry 6218 (class 2606 OID 3342539)
-- Name: data_members data_members_produk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_produk_id_fkey FOREIGN KEY (produk_id) REFERENCES public.produk_members(id) ON UPDATE CASCADE;


--
-- TOC entry 6219 (class 2606 OID 3342544)
-- Name: data_members data_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_members
    ADD CONSTRAINT data_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6191 (class 2606 OID 3342549)
-- Name: data_nomor_polisis data_nomor_polisis_data_member_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_data_member_id_fkey FOREIGN KEY (data_member_id) REFERENCES public.data_members(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6192 (class 2606 OID 3342554)
-- Name: data_nomor_polisis data_nomor_polisis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_nomor_polisis
    ADD CONSTRAINT data_nomor_polisis_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6221 (class 2606 OID 3342890)
-- Name: data_vouchers data_vouchers_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6222 (class 2606 OID 3342885)
-- Name: data_vouchers data_vouchers_produk_voucher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_vouchers
    ADD CONSTRAINT data_vouchers_produk_voucher_id_fkey FOREIGN KEY (produk_voucher_id) REFERENCES public.produk_vouchers(id) ON UPDATE CASCADE;


--
-- TOC entry 6193 (class 2606 OID 3342895)
-- Name: kendaraans kendaraans_tipe_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_tipe_kendaraan_id_fkey FOREIGN KEY (tipe_kendaraan_id) REFERENCES public.tipe_kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6194 (class 2606 OID 3342900)
-- Name: kendaraans kendaraans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kendaraans
    ADD CONSTRAINT kendaraans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6195 (class 2606 OID 3342905)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_gerbang_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_gerbang_masuk_id_fkey FOREIGN KEY (gerbang_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6196 (class 2606 OID 3342910)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_jenis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_jenis_kendaraan_id_fkey FOREIGN KEY (jenis_kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6197 (class 2606 OID 3342915)
-- Name: laporan_riwayat_transaksi_members laporan_riwayat_transaksi_members_pintu_keluar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_riwayat_transaksi_members
    ADD CONSTRAINT laporan_riwayat_transaksi_members_pintu_keluar_id_fkey FOREIGN KEY (pintu_keluar_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6232 (class 2606 OID 3342920)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_pintu_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_pintu_masuk_id_fkey FOREIGN KEY (pintu_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6233 (class 2606 OID 3342925)
-- Name: laporan_transaksi_batals laporan_transaksi_batals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laporan_transaksi_batals
    ADD CONSTRAINT laporan_transaksi_batals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6198 (class 2606 OID 3343246)
-- Name: level_penggunas level_penggunas_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.level_penggunas
    ADD CONSTRAINT level_penggunas_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


--
-- TOC entry 6199 (class 2606 OID 3343251)
-- Name: permasalahan_atau_perbaikans permasalahan_atau_perbaikans_pos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permasalahan_atau_perbaikans
    ADD CONSTRAINT permasalahan_atau_perbaikans_pos_id_fkey FOREIGN KEY (pos_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6200 (class 2606 OID 3343256)
-- Name: perusahaans perusahaans_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perusahaans
    ADD CONSTRAINT perusahaans_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6201 (class 2606 OID 3343271)
-- Name: pos pos_nama_interface_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_nama_interface_id_fkey FOREIGN KEY (nama_interface_id) REFERENCES public.nama_interfaces(id) ON UPDATE CASCADE;


--
-- TOC entry 6202 (class 2606 OID 3343266)
-- Name: pos pos_nama_printer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_nama_printer_id_fkey FOREIGN KEY (nama_printer_id) REFERENCES public.nama_printers(id) ON UPDATE CASCADE;


--
-- TOC entry 6203 (class 2606 OID 3343261)
-- Name: pos pos_tipe_manless_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_tipe_manless_id_fkey FOREIGN KEY (tipe_manless_id) REFERENCES public.tipe_manlesses(id) ON UPDATE CASCADE;


--
-- TOC entry 6204 (class 2606 OID 3343276)
-- Name: pos pos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pos
    ADD CONSTRAINT pos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6205 (class 2606 OID 3343281)
-- Name: produk_members produk_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_members
    ADD CONSTRAINT produk_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6220 (class 2606 OID 3343286)
-- Name: produk_vouchers produk_vouchers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produk_vouchers
    ADD CONSTRAINT produk_vouchers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6206 (class 2606 OID 3343291)
-- Name: riwayat_transaksi_ganti_nopols riwayat_transaksi_ganti_nopols_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_ganti_nopols
    ADD CONSTRAINT riwayat_transaksi_ganti_nopols_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6207 (class 2606 OID 3343296)
-- Name: riwayat_transaksi_kartu_members riwayat_transaksi_kartu_members_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwayat_transaksi_kartu_members
    ADD CONSTRAINT riwayat_transaksi_kartu_members_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6208 (class 2606 OID 3343301)
-- Name: shifts shifts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shifts
    ADD CONSTRAINT shifts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6209 (class 2606 OID 3343306)
-- Name: tarif_dendas tarif_dendas_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_dendas
    ADD CONSTRAINT tarif_dendas_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6210 (class 2606 OID 3343311)
-- Name: tarif_parkirs tarif_parkirs_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif_parkirs
    ADD CONSTRAINT tarif_parkirs_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6223 (class 2606 OID 3343356)
-- Name: transaksis transaksis_id_data_member_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_id_data_member_fkey FOREIGN KEY (id_data_member) REFERENCES public.data_members(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6224 (class 2606 OID 3343351)
-- Name: transaksis transaksis_id_data_voucher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_id_data_voucher_fkey FOREIGN KEY (id_data_voucher) REFERENCES public.data_vouchers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 6225 (class 2606 OID 3343346)
-- Name: transaksis transaksis_jenis_pembayaran_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_jenis_pembayaran_id_fkey FOREIGN KEY (jenis_pembayaran_id) REFERENCES public.payments(id) ON UPDATE CASCADE;


--
-- TOC entry 6226 (class 2606 OID 3343321)
-- Name: transaksis transaksis_kendaraan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_kendaraan_id_fkey FOREIGN KEY (kendaraan_id) REFERENCES public.kendaraans(id) ON UPDATE CASCADE;


--
-- TOC entry 6227 (class 2606 OID 3343331)
-- Name: transaksis transaksis_petugas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_petugas_id_fkey FOREIGN KEY (petugas_id) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6228 (class 2606 OID 3343326)
-- Name: transaksis transaksis_pintu_keluar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pintu_keluar_id_fkey FOREIGN KEY (pintu_keluar_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6229 (class 2606 OID 3343316)
-- Name: transaksis transaksis_pintu_masuk_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pintu_masuk_id_fkey FOREIGN KEY (pintu_masuk_id) REFERENCES public.pos(id) ON UPDATE CASCADE;


--
-- TOC entry 6230 (class 2606 OID 3343336)
-- Name: transaksis transaksis_shift_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_shift_id_fkey FOREIGN KEY (shift_id) REFERENCES public.shifts(id) ON UPDATE CASCADE;


--
-- TOC entry 6231 (class 2606 OID 3343341)
-- Name: transaksis transaksis_tipe_denda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_tipe_denda_id_fkey FOREIGN KEY (tipe_denda_id) REFERENCES public.tipe_dendas(id) ON UPDATE CASCADE;


--
-- TOC entry 6211 (class 2606 OID 3343939)
-- Name: users users_added_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_added_by_fkey FOREIGN KEY (added_by) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 6212 (class 2606 OID 3343934)
-- Name: users users_level_pengguna_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_level_pengguna_id_fkey FOREIGN KEY (level_pengguna_id) REFERENCES public.level_penggunas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6213 (class 2606 OID 3343929)
-- Name: users users_perusahaan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_perusahaan_id_fkey FOREIGN KEY (perusahaan_id) REFERENCES public.perusahaans(id) ON UPDATE CASCADE;


-- Completed on 2025-07-24 13:07:45

--
-- PostgreSQL database dump complete
--

