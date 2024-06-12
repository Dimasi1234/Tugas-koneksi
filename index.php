<!DOCTYPE html>
<html>
<head>
    <title>Menampilkan Data Tabel MySQL</title>
    <style>
        body {font-family: tahoma, arial;}
        table {border-collapse: collapse; width: 100%;}
        th, td {font-size: 13px; border: 1px solid #DEDEDE; padding: 3px 5px; color: #303030;}
        th {background: #CCCCCC; font-size: 12px; border-color: #B0B0B0;}
        h3 {margin-top: 40px;}
    </style>
</head>
<body>
    <center><h1>Sistem simpan dan Pinjam</h1></center>

    <h3>Tabel Anggota</h3>
    <table>
        <thead>
            <tr>
                <th>ID Anggota</th>
                <th>Nama</th>
                <th>Alamat</th>
                <th>Tanggal Lahir</th>
                <th>Nomor Telepon</th>
            </tr>
        </thead>
        <tbody>
            <?php
            include 'koneksi.php';
            $sql = 'SELECT ID_anggota, Nama, alamat, tanggal_lahir, Nomor_telepon FROM anggota';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_anggota']}</td>
                    <td>{$row['Nama']}</td>
                    <td>{$row['alamat']}</td>
                    <td>{$row['tanggal_lahir']}</td>
                    <td>{$row['Nomor_telepon']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>

    <h3>Tabel Pegawai</h3>
    <table>
        <thead>
            <tr>
                <th>ID Pegawai</th>
                <th>Nama</th>
                <th>Jabatan</th>
                <th>Nomor Telepon</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT ID_pegawai, Nama, Jabatan, Nomor_telepon FROM pegawai';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_pegawai']}</td>
                    <td>{$row['Nama']}</td>
                    <td>{$row['Jabatan']}</td>
                    <td>{$row['Nomor_telepon']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>

    <h3>Tabel Simpanan</h3>
    <table>
        <thead>
            <tr>
                <th>ID Simpanan</th>
                <th>ID Anggota</th>
                <th>ID Pegawai</th>
                <th>Tanggal Simpanan</th>
                <th>Jumlah Simpanan</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT ID_simpanan, ID_anggota, ID_pegawai, Tanggal_simpanan, Jumlah_simpanan FROM simpanan';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_simpanan']}</td>
                    <td>{$row['ID_anggota']}</td>
                    <td>{$row['ID_pegawai']}</td>
                    <td>{$row['Tanggal_simpanan']}</td>
                    <td>{$row['Jumlah_simpanan']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>

    <h3>Tabel Jenis Pinjaman</h3>
    <table>
        <thead>
            <tr>
                <th>ID Jenis Pinjaman</th>
                <th>Nama Jenis Pinjaman</th>
                <th>Bunga</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT ID_jenis_pinjaman, Nama_jenis_pinjaman, Bunga FROM jenis_pinjaman';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_jenis_pinjaman']}</td>
                    <td>{$row['Nama_jenis_pinjaman']}</td>
                    <td>{$row['Bunga']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>

    <h3>Tabel Pinjaman</h3>
    <table>
        <thead>
            <tr>
                <th>ID Pinjaman</th>
                <th>ID Anggota</th>
                <th>ID Pegawai</th>
                <th>ID Jenis Pinjaman</th>
                <th>Tanggal Pinjaman</th>
                <th>Jumlah Pinjaman</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT ID_pinjaman, ID_anggota, ID_pegawai, ID_jenis_pinjaman, Tanggal_pinjaman, Jumlah_pinjaman FROM pinjaman';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_pinjaman']}</td>
                    <td>{$row['ID_anggota']}</td>
                    <td>{$row['ID_pegawai']}</td>
                    <td>{$row['ID_jenis_pinjaman']}</td>
                    <td>{$row['Tanggal_pinjaman']}</td>
                    <td>{$row['Jumlah_pinjaman']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>

    <h3>Tabel Keanggotaan</h3>
    <table>
        <thead>
            <tr>
                <th>ID Keanggotaan</th>
                <th>ID Anggota</th>
                <th>Status Keanggotaan</th>
                <th>Tanggal Bergabung</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $sql = 'SELECT ID_keanggotaan, ID_anggota, Status_keanggotaan, Tanggal_bergabung FROM keanggotaan';
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_array($query)) {
                echo "<tr>
                    <td>{$row['ID_keanggotaan']}</td>
                    <td>{$row['ID_anggota']}</td>
                    <td>{$row['Status_keanggotaan']}</td>
                    <td>{$row['Tanggal_bergabung']}</td>
                </tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>
