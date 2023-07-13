<?php include 'include/header.php';?>
<?php include 'include/demo.php';?>
<body>
	<div class="container">
	<div class="mx-auto col-sm-12 main-section" id="myTab" role="tablist">
		<?php include 'include/child-tab.php';?>
		<div class="tab-content" id="myTabContent">	
			<div role="tabpanel">
				<div class="card">
					<div class="card-header">
						<h4>All Category</h4>
					</div>
					<div class="card-body">
						<form class="form" role="form" method="post" action="action/add_category.php" enctype="multipart/form-data" autocomplete="off">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Title Category</label>
								<div class="col-lg-9">
									<input class="form-control" name="name">
								</div>
							</div>												
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">News Image</label>
								<div class="col-lg-9">
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
											<img src="assets/img/demoUpload.jpg" alt=""/>
										</div>
										<div class="fileupload-preview fileupload-exists thumbnail"
											style="
											max-width: 200px;
											max-height: 150px;
											line-height: 20px;">
										</div>
										<div>
											<span class="btn btn-file btn-primary">
												<span class="fileupload-new">Select image</span>
												<span class="fileupload-exists">Change</span>
												<input type="file" name="photo" accept="image/*" required></span>
											<a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remove</a>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Status</label>
								<div class="col-lg-9">
									<div class="checkbox anim-checkbox">
										<input type="checkbox" id="ch3" name="status[]" value="1"/>
										<label for="ch3">Published</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-lg-12 text-center">
									<input type="submit" <?php 
										if ($demoOrLive == "1") { ?>
											name="submit"
									<?php } else { ?>
											onclick="return confirm('Demo version not working.')"
									<?php } ?>  class="btn btn-primary" value="Save">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php include 'include/footer.php';?>
</body>
</html>