<?php $this->load->view('template\header'); ?>
<?php $this->load->view('template\sidebar'); ?>



<!-- Begin Page Content -->
<div class="container-fluid">

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Pending requests</h1>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Please assign below requests</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>Name</th>
            <th>Location</th>
            <th>Date Time</th>
            <th>Event Type</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach ($response->help_details as $help) { ?>
        <?php
            $process_name = $help->name;
            //$help->is_witness = 0;
            if($help->is_witness)
            {
              $process_name = $process_name." <i>(Witness)</i>";
            }
          ?>
          <tr>
            <td><?php echo $process_name ?></td>
            <td><?php echo $help->latest_position->computed_distance->destination_address ?></td>
            <td><?php echo $help->latest_position->date_time ?></td>
            <td><?php  echo $help->event_type ?></td>
            <td><a href="#" class="btn btn-info btn-circle" data-toggle="modal" data-target="#more_details<?php echo $help->id ?>">
                    <i class="fas fa-info-circle"></i>
                  </a>
            </td>

            <!-- Modal -->
            <div class="modal fade" id="more_details<?php echo $help->id ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Request assignment #<?php echo $help->id ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Name:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $process_name?>
                      </div>
                      <div class="col-sm-2">
                        <b>Age:</b>
                      </div>
                      <div class="col-sm-2">
                        <?php echo $help->age?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Identity No:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help->NIC ?>
                      </div>
                      <div class="col-sm-2">
                        <b>Blood group:</b>
                      </div>
                      <div class="col-sm-2">
                        <?php echo $help->blood_group?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Special Conditions:</b>
                      </div>
                      <div class="col-sm-9">
                        <?php echo $help->special_conditions ?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Address:</b>
                      </div>
                      <div class="col-sm-9">
                        <?php echo $help->latest_position->computed_distance->destination_address ?>
                      </div>
                    </div>
                    <?php if($help->is_witness){?>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Impact Type:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help->impact_type ?>
                      </div>
                      <div class="col-sm-2">
                        <b>No of floors:</b>
                      </div>
                      <div class="col-sm-2">
                        <?php echo $help->no_floors?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Building Type:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help->building_type ?>
                      </div>
                      <div class="col-sm-2">
                        <b>Trapped Person?</b>
                      </div>
                      <div class="col-sm-2">
                        <?php if($help->person_trapped == 1){echo "Yes";}else{echo "No";} ?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="<?php echo base_url() ?>index.php/welcome/getVideo/<?php echo $help->id ?>" allowfullscreen></iframe>
                      </div>
                    </div>
                    <?php }?>
                    
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <div class="dropup">
                      <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Assign
                      </button>
                      <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </tr>
        <?php } ?>
          
        </tbody>
      </table>
    </div>
  </div>
</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
<div class="container my-auto">
<div class="copyright text-center my-auto">
  <span>Copyright &copy; MauSafe 2019</span>
</div>
</div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

<?php $this->load->view('template\footer'); ?>

