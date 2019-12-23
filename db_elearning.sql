-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20 Agu 2019 pada 20.19
-- Versi Server: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elearning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `alamat`, `no_telp`, `email`, `username`, `password`, `pass`) VALUES
(1, 'Rivaldi Samad', 'Trihanggo,Gamping,Sleman Yogyakarta', '085344763422', 'rivaldi@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` text NOT NULL,
  `isi` longtext NOT NULL,
  `tgl_posting` date NOT NULL,
  `penerbit` varchar(10) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `tgl_posting`, `penerbit`, `status`) VALUES
(1, 'Libur Mapel penjas kelas x1 ipa', 'Berhubung bapak ada halangan hadir dikelas Minggu depan hari kamis kosong', '2019-07-22', '4', 'aktif'),
(2, 'Mantenance E-learning tanggal 26 Juli nanti', 'Program akan di hentikan sementara untuk beberapa pengembnagan kedepan', '2019-07-22', 'admin', 'aktif'),
(3, 'Libur hari jumat', 'Berhubung minggu depan tepatnya hari jumat saya libur tugas akan diadakan lewat e-learning jam 14:00', '2019-08-05', '27', 'aktif'),
(4, 'Kosong kamis minggu depan', 'Berhubung ada halangan minggu depan hari kamis libur', '2019-08-09', '28', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_file_materi`
--

CREATE TABLE `tb_file_materi` (
  `id_materi` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `id_kelas` int(4) NOT NULL,
  `id_mapel` int(4) NOT NULL,
  `nama_file` varchar(250) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `hits` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_file_materi`
--

INSERT INTO `tb_file_materi` (`id_materi`, `judul`, `id_kelas`, `id_mapel`, `nama_file`, `tgl_posting`, `pembuat`, `hits`) VALUES
(1, 'pert2', 3, 13, '1Lembar.docx', '2019-08-09', '28', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jawaban`
--

CREATE TABLE `tb_jawaban` (
  `id` int(11) NOT NULL,
  `id_tq` int(4) NOT NULL,
  `id_soal` int(4) NOT NULL,
  `id_siswa` int(4) NOT NULL,
  `jawaban` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jawaban`
--

INSERT INTO `tb_jawaban` (`id`, `id_tq`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(1, 3, 1, 2, 'qwertyuu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `wali_kelas` int(5) NOT NULL,
  `ketua_kelas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `ruang`, `wali_kelas`, `ketua_kelas`) VALUES
(3, 'X IPA', '', 0, 0),
(4, 'X IPS', '', 0, 0),
(5, 'XI IPA', '', 0, 0),
(6, 'XI IPS ', '', 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas_ajar`
--

CREATE TABLE `tb_kelas_ajar` (
  `id` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas_ajar`
--

INSERT INTO `tb_kelas_ajar` (`id`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
(5, 3, 27, ''),
(6, 3, 27, ''),
(7, 3, 27, ''),
(8, 3, 4, ''),
(9, 3, 28, ''),
(10, 3, 28, ''),
(11, 3, 28, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `id` int(11) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `mapel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`id`, `kode_mapel`, `mapel`) VALUES
(1, 'A1', 'Bahasa Indonesia'),
(2, 'A2 ', 'Seni Budaya'),
(3, 'A3', 'Bahasa Jawa'),
(4, 'A4', 'Kimia'),
(5, 'A5', 'Geografi'),
(6, 'A6', 'Sejarah'),
(7, 'A7', 'Fisika'),
(8, 'A8', 'Bahasa Inggris'),
(9, 'A9', 'Matematika'),
(10, 'A10', 'Bahasa Jepang'),
(11, 'A11', 'Penjaskes'),
(12, 'A12', 'Ekonomi'),
(13, 'A13', 'Ketamansiswaan'),
(14, 'A14', 'Pend. Agama Islam'),
(15, 'A15', 'Biologi'),
(16, 'A16', 'Pkn'),
(17, 'A17', 'Prakarya dan Kewirausahaan'),
(18, 'A18', 'Sosiologi'),
(19, 'A19', 'Tik'),
(20, 'A20', 'Pend. Agama Katolik'),
(21, 'A21', 'Pend. Agama Kristen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel_ajar`
--

CREATE TABLE `tb_mapel_ajar` (
  `id` int(11) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `keterangan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_mapel_ajar`
--

INSERT INTO `tb_mapel_ajar` (`id`, `id_mapel`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
(2, 2, 4, 2, ''),
(3, 2, 3, 2, ''),
(4, 3, 3, 3, ''),
(5, 3, 4, 3, ''),
(6, 3, 5, 3, ''),
(7, 3, 6, 3, ''),
(8, 4, 3, 4, ''),
(9, 4, 5, 4, ''),
(10, 5, 4, 5, ''),
(11, 12, 5, 8, ''),
(12, 1, 3, 25, ''),
(15, 8, 3, 26, ''),
(16, 15, 6, 25, ''),
(17, 12, 6, 25, ''),
(18, 8, 4, 25, ''),
(19, 17, 3, 27, ''),
(20, 13, 3, 28, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai_essay`
--

CREATE TABLE `tb_nilai_essay` (
  `id` int(11) NOT NULL,
  `id_tq` int(5) NOT NULL,
  `id_siswa` int(5) NOT NULL,
  `nilai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_nilai_essay`
--

INSERT INTO `tb_nilai_essay` (`id`, `id_tq`, `id_siswa`, `nilai`) VALUES
(1, 3, 2, 70);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_nilai_pilgan`
--

CREATE TABLE `tb_nilai_pilgan` (
  `id` int(11) NOT NULL,
  `id_tq` int(4) NOT NULL,
  `id_siswa` int(4) NOT NULL,
  `benar` int(4) NOT NULL,
  `salah` int(4) NOT NULL,
  `tidak_dikerjakan` int(4) NOT NULL,
  `presentase` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_nilai_pilgan`
--

INSERT INTO `tb_nilai_pilgan` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `presentase`) VALUES
(1, 3, 2, 1, 0, 0, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengajar`
--

CREATE TABLE `tb_pengajar` (
  `id_pengajar` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `web` varchar(60) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pengajar`
--

INSERT INTO `tb_pengajar` (`id_pengajar`, `nip`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `alamat`, `jabatan`, `foto`, `web`, `username`, `password`, `pass`, `status`) VALUES
(2, '3471022108890001', 'Agus Somasis Raharjo', 'Yogyakarta', '1989-08-21', 'L', 'Islam', '085238232352', 'agus@gmail.com', 'Yogyakarta', 'Guru seni budaya', 'anonim.png', 'http:/www.agussite.com', 'agus', 'fdf169558242ee051cca1479770ebac3', 'agus', 'aktif'),
(3, '3471082807520002', 'Ay. Suharyono', 'Yogyakarta', '1952-06-28', 'L', 'Islam', '08972525252', '', 'Yogyakarta', 'Guru Bahasa Jawa', 'anonim.png', '', 'ay', '42d74a038852aaee074a9245c49e9c8d', 'ay', 'aktif'),
(4, '3404104910660001', 'Bekti Rochani', 'Ponorogo', '1966-10-09', 'L', 'Islam', '082275633541', '', 'Yogyakarta', 'Guru Kimia', 'anonim.png', '', 'bekti', '4414fc94b2a1a771b1cd4faa8ec12cfc', 'bekti', 'aktif'),
(5, '195908061994121001', 'Edy Sudaryanto', 'Yogyakarta', '1959-08-12', 'L', 'Islam', '082345667842', '', 'Yogyakarta', 'Guru Geografi', 'anonim.png', '', 'edy', 'f75f761c049dced5d7eb5028ac04174a', 'edy', 'aktif'),
(6, '3404135305730002', 'Enny Sry Reswati', 'Surakarta', '1959-08-06', 'P', 'Islam', '08523743282', 'Reswati@gmail.com', 'Yogyakarta', 'Guru Sejarah', 'anonim.png', '', 'enny', 'd9d38a38c9710d07a48bd599d96294e6', 'enny', 'aktif'),
(7, '197505072000122002', 'Ermayanti', 'Yogyakarta', '1973-05-13', 'P', 'Islam', '08972525252', '', 'Yogyakarta', 'Guru Fisika', 'anonim.png', '', 'ermayanti', '5ae74ac12f792e6d3d7beef8749994b0', 'ermayanti', 'aktif'),
(8, '3404052803600002', 'Gunawan', 'Sleman', '1960-03-28', 'L', 'Islam', '08584252352', '', 'Yogyakarta', 'Guru Bahasa Indonesi', 'anonim.png', '', 'gunawan', 'dc96b97c4ffbead46ca25ef5d4b77cbe', 'gunawan', 'aktif'),
(9, '3302016505850004', 'Hetty Handayani', 'Jakarta', '1985-05-25', 'P', 'Kristen', '08983423344', '', 'Sleman', 'Guru Bahasa Inggris', 'anonim.png', '', 'hetty', '86c9edae19610a012897c5cd3f42e193', 'hetty', 'aktif'),
(10, '3471137010800001', 'Ida Adni', 'Dompu', '1980-10-30', 'P', 'Islam', '085352351662', '', 'Sleman', 'Guru Matematika', 'anonim.png', '', 'ida', '7f78f270e3e1129faf118ed92fdf54db', 'ida', 'aktif'),
(11, '3471132011800003', 'Kadir', 'Jember', '1980-11-20', 'L', 'Islam', '085725464577', '', 'Yogyakarta', 'Guru Bahasa Jepang', 'anonim.png', '', 'kadir', '19104f80b87a4fa150d6b9aab2536952', 'kadir', 'aktif'),
(12, '3404121507630003', 'Marwoto', 'Yogyakarta', '1963-07-15', 'L', 'Islam', '085943252445', '', 'Yogyakarta', 'Guru Penjaskes', 'anonim.png', '', 'marwoto', '472592dc14b333c70d790131f03cd3c6', 'marwoto', 'aktif'),
(13, '19670981990012002', 'Riri Aryani', 'Bantul', '1963-02-26', 'L', 'Islam', '089743422212', 'Aryani@gmail.com', 'Bantul', 'Guru Ekonomi', 'anonim.png', '', 'riri', 'c740d6848b6a342dcc26c177ea2c49fe', 'riri', 'aktif'),
(14, '196709281990012002', 'Sri Lestari', 'Kediri', '1967-09-28', 'P', 'Islam', '08976355533', '', 'Yogyakarta', 'Guru Matematika', 'anonim.png', '', 'sri', 'd1565ebd8247bbb01472f80e24ad29b6', 'sri', 'aktif'),
(15, '3471025311580002', 'Sri Uji Setyaningsih', 'Sleman', '1958-11-13', 'P', 'Islam', '08976663552', 'Sriujisetyaningsih@gmail.com', 'Sleman', 'Guru Pend. Agama Isl', 'anonim.png', '', 'sriuji', '45cf0361bf576a18491fc96084108df6', 'sriuji', 'aktif'),
(16, '3471085006800002', 'Siti Marfuah', 'Bandar Lampung', '1980-10-06', 'P', 'Islam', '085355712761', '', 'Sleman', 'Guru Ketamansiswaan', 'anonim.png', '', 'siti', 'db04eb4b07e0aaf8d1d477ae342bdff9', 'siti', 'aktif'),
(17, '3471021505670002', 'Sriyana', 'Klaten', '1967-05-15', 'P', 'Islam', '082344577211', '', 'Yogyakarta', 'Guru Biologi', 'anonim.png', '', 'sriyana', '193f26bf3ceafafe5d26937b16556103', 'sriyana', 'aktif'),
(18, '3471023105530001', 'Totok Djoko Leksono', 'Yogyakarta', '1953-05-21', 'L', 'Islam', '085732235667', '', 'Yogyakarta', 'Guru seni budaya', 'anonim.png', '', 'totok', '6f0193cec743d209f04845041b96e322', 'totok', 'aktif'),
(19, '3201071408950003', 'Agung Setyo Winarso', 'Bekasi', '1995-08-24', 'L', 'Islam', '08225628883', '', 'Yogyakarta', 'Guru Pkn', 'anonim.png', '', 'agung', 'e59cd3ce33a68f536c19fedb82a7936f', 'agung', 'aktif'),
(20, '342086203950002', 'Mega Nurmawati', 'Bantul', '1995-03-22', 'P', 'Islam', '08323222255', '', 'Yogyakarta', 'Guru Prakarya dan Ke', 'anonim.png', '', 'mega', '91805ec00ad20b85226bec0bacf843d3', 'mega', 'aktif'),
(21, '34041329190920002', 'Yusuf Damar Nugroho', 'Sleman', '1992-10-29', 'L', 'Islam', '08227734987', '', 'Sleman', 'Guru Sosiologi', 'anonim.png', '', 'yusuf', 'dd2eb170076a5dec97cdbbbbff9a4405', 'yusuf', 'aktif'),
(22, '3404132910920002', 'Vera Wati', 'Pekalongan', '1994-09-03', 'P', 'Kristen', '08974186553', '', 'Yogyakarta', 'Guru Tik', 'anonim.png', '', 'vera', '4341dfaa7259082022147afd371b69c3', 'vera', 'aktif'),
(23, '3302016505850004', 'Lucia Kusmardiasi', 'Yogyakarta', '1969-10-10', 'P', 'Katholik', '082344577211', 'Luciana11@gmail.com', 'Yogyakarta', 'Guru Pend. Agama Kat', 'anonim.png', '', 'luciana', '450336441380591df61c97aa6791b692', 'luciana', 'aktif'),
(24, '3302016505850004', 'Mixon Nawangdjabar', 'Alor', '1978-04-08', 'L', 'Kristen', '0895646323', '', 'Sleman', 'Guru Pend. Agama Kri', 'anonim.png', '', 'mixon', 'ba74d0d55eebb2350de3c4db973f4f36', 'mixon', 'aktif'),
(27, '0458743', 'Nen armin meidika', 'Jepara', '1988-08-08', 'L', 'Islam', '085352351662', 'nen@gmail.com', 'Jombor', 'Guru Matematika', 'index.jpg', 'http://www.tyrfytfyt.com', 'dika', 'e9ce15bcebcedde2cb3cf9fe8f84fc0c', 'dika', 'aktif'),
(28, '09780', 'Bismo nugraha', 'Bandung', '2007-08-09', 'L', 'Islam', '08227734987', 'agus@gmail.com', 'jl.selokan mataram', 'Guru Bahasa Indonesi', 'anonim.png', 'http:/www.agussite.com', 'bismo', 'a1cd2428a393a29efee444d716598d8f', 'bismo', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `thn_masuk` int(5) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `no_telp`, `email`, `alamat`, `id_kelas`, `thn_masuk`, `foto`, `username`, `password`, `pass`, `status`) VALUES
(1, '364626', 'wisa arsytama', 'kebumen', '2004-05-04', 'L', 'Islam', 'Budi', 'diana', '09674854655', 'sdfsfsd@gmail.com', 'Jl. selokan', '1', 2019, 'hyoyeon.jpg', 'wisa', '7c945f669a3a350579137510b9bdbb78', 'wisa', 'aktif'),
(2, '979879', 'Arief Aji', 'Magelang', '2019-08-14', 'L', 'Islam', 'Rizal', 'Tini', '08757', 'nen@gmail.com', 'jl.magelang', '3', 2018, 'anonim.png', 'aji', '8d045450ae16dc81213a75b725ee2760', 'aji', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal_essay`
--

CREATE TABLE `tb_soal_essay` (
  `id_essay` int(11) NOT NULL,
  `id_tq` int(5) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_soal_essay`
--

INSERT INTO `tb_soal_essay` (`id_essay`, `id_tq`, `pertanyaan`, `gambar`, `tgl_buat`) VALUES
(1, 3, '\r\n Berikut ini yang tidak termasuk unsur-unsur dalam surat lamaran pekerjaan adalah', '', '2019-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal_pilgan`
--

CREATE TABLE `tb_soal_pilgan` (
  `id_pilgan` int(11) NOT NULL,
  `id_tq` int(5) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `pil_e` text NOT NULL,
  `kunci` varchar(2) NOT NULL,
  `tgl_buat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_soal_pilgan`
--

INSERT INTO `tb_soal_pilgan` (`id_pilgan`, `id_tq`, `pertanyaan`, `gambar`, `pil_a`, `pil_b`, `pil_c`, `pil_d`, `pil_e`, `kunci`, `tgl_buat`) VALUES
(1, 3, '\r\n Berikut ini yang tidak termasuk unsur-unsur dalam surat lamaran pekerjaan adalah', '', 'salah', 'salah', 'benar', 'salah', 'salah', 'C', '2019-08-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_topik_quiz`
--

CREATE TABLE `tb_topik_quiz` (
  `id_tq` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `waktu_soal` int(8) NOT NULL,
  `info` varchar(250) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_topik_quiz`
--

INSERT INTO `tb_topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_mapel`, `tgl_buat`, `pembuat`, `waktu_soal`, `info`, `status`) VALUES
(1, 'Kuis', 0, 2, '2019-07-09', '2', 7200, 'kerjakan dengan jujur', 'aktif'),
(2, 'tugas pert2', 0, 17, '2019-08-05', '27', 7200, 'Jangan nyontek', 'aktif'),
(3, 'kuis', 3, 13, '2019-08-09', '28', 7200, 'jngan nyontek', 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `tb_file_materi`
--
ALTER TABLE `tb_file_materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indexes for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_kelas_ajar`
--
ALTER TABLE `tb_kelas_ajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mapel_ajar`
--
ALTER TABLE `tb_mapel_ajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_nilai_essay`
--
ALTER TABLE `tb_nilai_essay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_nilai_pilgan`
--
ALTER TABLE `tb_nilai_pilgan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengajar`
--
ALTER TABLE `tb_pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `tb_soal_essay`
--
ALTER TABLE `tb_soal_essay`
  ADD PRIMARY KEY (`id_essay`);

--
-- Indexes for table `tb_soal_pilgan`
--
ALTER TABLE `tb_soal_pilgan`
  ADD PRIMARY KEY (`id_pilgan`);

--
-- Indexes for table `tb_topik_quiz`
--
ALTER TABLE `tb_topik_quiz`
  ADD PRIMARY KEY (`id_tq`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_file_materi`
--
ALTER TABLE `tb_file_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_jawaban`
--
ALTER TABLE `tb_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_kelas_ajar`
--
ALTER TABLE `tb_kelas_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tb_mapel`
--
ALTER TABLE `tb_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tb_mapel_ajar`
--
ALTER TABLE `tb_mapel_ajar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tb_nilai_essay`
--
ALTER TABLE `tb_nilai_essay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_nilai_pilgan`
--
ALTER TABLE `tb_nilai_pilgan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_pengajar`
--
ALTER TABLE `tb_pengajar`
  MODIFY `id_pengajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_soal_essay`
--
ALTER TABLE `tb_soal_essay`
  MODIFY `id_essay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_soal_pilgan`
--
ALTER TABLE `tb_soal_pilgan`
  MODIFY `id_pilgan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_topik_quiz`
--
ALTER TABLE `tb_topik_quiz`
  MODIFY `id_tq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
