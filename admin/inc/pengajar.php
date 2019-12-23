<?php
if(@$_SESSION['admin']) { ?>

<div class="row">
    <div class="col-md-12">
        <h1 class="page-header">Manajemen Pengajar</h1>
    </div>
</div>

<div class="row">
	<?php
	$id = @$_GET['id'];
	$sql_per_id = mysqli_query($db, "SELECT * FROM tb_pengajar WHERE id_pengajar = '$id'") or die ($db->error);
	$data = mysqli_fetch_array($sql_per_id);
	$sql_kelas = mysqli_query($db, "SELECT * FROM tb_kelas") or die ($db->error);
	$sql_kelas_ajar = mysqli_query($db, "SELECT * FROM tb_kelas_ajar") or die ($db->error);

	if(@$_GET['action'] == '') { ?>

    <div class="col-md-12"> 
        <div class="panel panel-default">
            <div class="panel-heading"><a href="?page=pengajar&action=tambah" class="btn btn-primary btn-sm">Tambah Data</a> <a href="./laporan/cetak.php?data=pengajar" target="_blank" class="btn btn-default btn-sm">Cetak Data Pengajar</a></div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="datapengajar">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NIP</th>
                                <th>Nama Lengkap</th>
								<th>Kelas Ajar</th>
                                <th>Mapel Ajar</th>
                                <th>Status</th>
                                <th>Opsi</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $no = 1;
						$sql_pengajar = mysqli_query($db, "SELECT tb_mapel_ajar.id, tb_pengajar.nip, tb_pengajar.nama_lengkap, tb_kelas.nama_kelas,tb_mapel.mapel, tb_pengajar.status FROM tb_pengajar INNER JOIN tb_mapel_ajar ON tb_mapel_ajar.id_pengajar=tb_pengajar.id_pengajar INNER JOIN tb_kelas on tb_kelas.id_kelas=tb_mapel_ajar.id_kelas INNER JOIN tb_mapel on tb_mapel.id=tb_mapel_ajar.id_mapel ") or die ($db->error);
                        if(mysqli_num_rows($sql_pengajar) > 0) {
	                        while($data_pengajar = mysqli_fetch_array($sql_pengajar)) {
	                        ?>
	                            <tr>
	                                <td><?php echo $no++; ?></td>
	                                <td><?php echo $data_pengajar['nip']; ?></td>
	                                <td><?php echo $data_pengajar['nama_lengkap']; ?></td>
									<td><?php echo $data_pengajar['nama_kelas'];?></td>
	                                <td><?php echo $data_pengajar['mapel']; ?></td>
	                                <td><?php echo ucfirst($data_pengajar['status']); ?></td>
	                                <td align="center" width="170px">
	                                    <a onclick="return confirm('Yakin akan menghapus data?');" href="?page=pengajar&action=hapus&id=<?php echo $data_pengajar['id']; ?>" class="badge" style="background-color:#f00;">Hapus</a>
										<!-- <a href="?page=pengajar&action=edit=<?php echo $data_pengajar['id']; ?>" class="badge" style="background-color:#f60;">Edit</a> -->
									</td>
	                            </tr>
	                        <?php
		                    }
		                } else {
		                	?>
							<tr>
                                <td colspan="6" align="center">Data tidak ditemukan</td>
							</tr>
		                	<?php
		                }
	                    ?>
                        </tbody>
                    </table>
                    <script>
                    $(document).ready(function () {
                        $('#datapengajar').dataTable();
                    });
                    </script>
                </div>
            </div>
        </div>
    </div>

		<?php
	} else if(@$_GET['action'] == 'tambah') {
		?>
		  <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">Tambah Data Kelas yang Anda Ajar &nbsp; <a href="?page=pengajar" class="btn btn-warning btn-sm">Kembali</a></div>
                    <div class="panel-body">
                        <form method="post">
                            <div class="form-group">
							<label>Pilih Pengajar *</label>
                            <select name="Pengajar" class="form-control" required>
                            	<option value="">- Pilih -</option>
                            	<?php
                            	$sql_pengajar = mysqli_query($db, "SELECT * FROM tb_pengajar") or die ($db->error);
                            	while($data_pengajar = mysqli_fetch_array($sql_pengajar)) {
                            		echo '<option value="'.$data_pengajar['id_pengajar'].'">'.$data_pengajar['nama_lengkap'].'</option>';
                            	} ?>
                            </select>
							</div>
							<div class="form-group">
                                <label>Pilih Kelas *</label>
                                <select name="kelas" class="form-control" required>
                                    <option value="">- Pilih -</option>
                                    <?php
                                    while($data_kelas = mysqli_fetch_array($sql_kelas)) {
                                        echo '<option value="'.$data_kelas['id_kelas'].'">'.$data_kelas['nama_kelas'].'</option>';
                                    }
                                    ?>
                                </select>				
								</div>	
								<div class="form-group">
								<label>Mapel *</label>
                            <select name="mapel" class="form-control" required>
                            	<option value="">- Pilih -</option>
								
                            	<?php
                            	$sql_mapel = mysqli_query($db, "SELECT * FROM tb_mapel") or die ($db->error);
                            	while($data_mapel = mysqli_fetch_array($sql_mapel)) {
                            		echo '<option value="'.$data_mapel['id'].'">'.$data_mapel['mapel'].'</option>';
                            	} ?>
                            </select>
							</div>
                            <div class="form-group">
                                <input type="submit" name="simpan" value="Simpan" class="btn btn-success" />
                                <input type="reset" value="Reset" class="btn btn-danger" />
                            </div>
                        </form>
                        <?php
                        if(@$_POST['simpan']) {
							$mapel = @mysqli_real_escape_string($db, $_POST['mapel']);
							$kelas = @mysqli_real_escape_string($db, $_POST['kelas']);
							$pengajar = @mysqli_real_escape_string($db, $_POST['Pengajar']);
							$ket = @mysqli_real_escape_string($db, $_POST['ket']);
							mysqli_query($db, "INSERT INTO tb_kelas_ajar VALUES('', '$kelas', '$pengajar', '$ket')") or die ($db->error);
							$query = "SELECT * FROM tb_mapel_ajar WHERE id_mapel = '$mapel' and id_kelas = '$kelas'";
							$exe = mysqli_query($db, $query);
	
							if(mysqli_num_rows($exe) > 0) {
								echo "<script> alert('Data kelas sudah diajar guru lain'); </script>";
							} else {
								mysqli_query($db, "INSERT INTO tb_mapel_ajar VALUES('', '$mapel', '$kelas', '$pengajar', '$ket')") or die ($db->error);
								echo "<script>window.location='?page=pengajar';</script>";
							}	
						}
                        ?>
                    </div>
                </div>
            </div>
			

		<?php
	} else if(@$_GET['action'] == 'prosestambah') {
		$nip = @mysqli_real_escape_string($db, $_POST['nip']);
		$nama_lengkap = @mysqli_real_escape_string($db, $_POST['nama_lengkap']);
		$tempat_lahir = @mysqli_real_escape_string($db, $_POST['tempat_lahir']);
		$tgl_lahir = @mysqli_real_escape_string($db, $_POST['tgl_lahir']);
		$jenis_kelamin = @mysqli_real_escape_string($db, $_POST['jenis_kelamin']);
		$agama = @mysqli_real_escape_string($db, $_POST['agama']);
		$no_telp = @mysqli_real_escape_string($db, $_POST['no_telp']);
		$email = @mysqli_real_escape_string($db, $_POST['email']);
		$alamat = @mysqli_real_escape_string($db, $_POST['alamat']);
		// $jabatan = @mysqli_real_escape_string($db, $_POST['jabatan']);
		$web = @mysqli_real_escape_string($db, $_POST['web']);
		$username = @mysqli_real_escape_string($db, $_POST['username']);
		$password = @mysqli_real_escape_string($db, $_POST['password']);
		$status = @mysqli_real_escape_string($db, $_POST['status']);
		mysqli_query($db, "INSERT INTO tb_kelas_ajar VALUES('', '$kelas', '$pengajar', '$ket')") or die ($db->error);
		$sumber = @$_FILES['gambar']['tmp_name'];
		$target = 'img/foto_pengajar/';
		$nama_gambar = @$_FILES['gambar']['name'];

		if($nama_gambar != '') {
			if(move_uploaded_file($sumber, $target.$nama_gambar)) {
				mysqli_query($db, "INSERT INTO tb_pengajar VALUES('', '$nip', '$nama_lengkap', '$tempat_lahir', '$tgl_lahir', '$jenis_kelamin', '$agama', '$no_telp', '$email', '$alamat', '$jabatan', '$nama_gambar', '$web', '$username', md5('$password'), '$password', '$status')") or die ($db->error);
				echo '<script>window.location="?page=pengajar";</script>';
			} else {
				echo '<script>alert("Gagal menambah data pengajar, foto gagal diupload, coba lagi!"); window.location="?page=pengajar";</script>';
			}
		} else {
			mysqli_query($db, "INSERT INTO tb_pengajar VALUES('', '$nip', '$nama_lengkap', '$tempat_lahir', '$tgl_lahir', '$jenis_kelamin', '$agama', '$no_telp', '$email', '$alamat', '$jabatan', 'anonim.png', '$web', '$username', md5('$password'), '$password', '$status')") or die ($db->error);
			echo '<script>window.location="?page=pengajar";</script>';
		}	
                                    ?>
                                </select>
                            </div>
                        <div class="form-group">
                            <label>Tempat Lahir *</label>
                            <input type="text" name="tempat_lahir" value="<?php echo $data['tempat_lahir']; ?>" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Tanggal Lahir *</label>
                            <input type="date" name="tgl_lahir" value="<?php echo $data['tgl_lahir']; ?>" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Jenis Kelamin *</label>
                            <select name="jenis_kelamin" class="form-control" required>
								<option value="L">Laki-laki</option>
								<option value="P" <?php if($data['jenis_kelamin'] == 'P') { echo "selected"; } ?>>Perempuan</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Agama *</label>
                            <select name="agama" class="form-control" required>
								<option value="Islam">Islam</option>
								<option value="Kristen" <?php if($data['agama'] == 'Kristen') { echo "selected"; } ?>>Kristen</option>
								<option value="Katholik" <?php if($data['agama'] == 'Katholik') { echo "selected"; } ?>>Katholik</option>
								<option value="Hindu" <?php if($data['agama'] == 'Hindu') { echo "selected"; } ?>>Hindu</option>
								<option value="Budha" <?php if($data['agama'] == 'Budha') { echo "selected"; } ?>>Budha</option>
								<option value="Konghucu" <?php if($data['agama'] == 'Konghucu') { echo "selected"; } ?>>Konghucu</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Nomor Telepon *</label>
                            <input type="text" name="no_telp" value="<?php echo $data['no_telp']; ?>" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" value="<?php echo $data['email']; ?>" class="form-control" placeholder="Ex. codingyuk@gmail.com" />
                        </div>
                        <div class="form-group">
                            <label>Alamat *</label>
                            <textarea name="alamat" class="form-control" rows="3" required><?php echo $data['alamat']; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Jabatan *</label>
                            <input type="text" name="jabatan" value="<?php echo $data['jabatan']; ?>" class="form-control" required />
                        </div>
						<div class="form-group">
                            <label>Foto</label>
                            <div style="padding:0 0 5px 0;"><img width="200px" src="../admin/img/foto_pengajar/<?php echo $data['foto']; ?>" /></div>
                            <input type="file" name="gambar" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label>Website</label>
                            <input type="url" name="web" value="<?php echo $data['web']; ?>" class="form-control" placeholder="Ex. http://yukcoding.blogspot.com" />
                        </div>
                        <div class="form-group">
                            <label>Username *</label>
                            <input type="text" name="username" value="<?php echo $data['username']; ?>" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Password *</label>
                            <input type="text" name="password" value="<?php echo $data['pass']; ?>" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Status Akun</label>
                            <select name="status" class="form-control">
								<option value="aktif">Aktif</option>
								<option value="tidak aktif" <?php if($data['status'] == 'tidak aktif') { echo "selected"; } ?>>Tidak Aktif</option>
                            </select>
                        </div>
                        <div class="form-group">
	                        <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Simpan</button>
	                        <button type="reset" class="btn btn-danger"><i class="fa fa-refresh"></i> Reset</button>
                        </div>
                    </form>
	            </div>
		    </div>
		</div>
		<?php
	 
	} else if(@$_GET['action'] == 'hapus') {
		$ids=$_GET['id'];
		mysqli_query($db, "DELETE FROM tb_mapel_ajar WHERE id = '$ids'") or die ($db->error);
		echo '<script>window.location="?page=pengajar";</script>';
	}
	?>
</div>

<?php
} else { ?>
	<div class="row">
	    <div class="col-xs-12">
	        <div class="alert alert-danger">Maaf Anda tidak punya hak akses masuk halaman ini!</div>
	    </div>
	</div>
	<?php
} ?>