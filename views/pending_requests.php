<?php $this->load->view('template\header'); ?>
<?php $this->load->view('template\sidebar'); ?>

<!-- Begin Page Content -->
<div class="container-fluid">

<?php $this->load->view('flash_messages'); ?>


<!-- Pending requests -->
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
            <td><?php echo $help->latest_position->computed_distance->origin_address ?></td>
            <td><?php echo $help->latest_position->date_time ?></td>
            <td><?php  echo $help->event_type ?></td>
            <td><a href="#" class="btn btn-info btn-circle" onClick="noticeModalOpened()" data-toggle="modal" data-target="#more_details<?php echo $help->id ?>">
                    <i class="fas fa-cog"></i>
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
                        <?php echo $help->latest_position->computed_distance->origin_address ?>
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
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="noticeModalClosed()">Close</button>
                    <div class="dropup">
                      <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Assign
                      </button>
                      <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                        <?php foreach ($stations as $station) { ?>
                          <a class="dropdown-item" href="<?php echo base_url(); ?>index.php/welcome/assignRequest/<?php echo $help->id ?>/<?php echo $station->id ?>"><?php echo $station->station_name; ?></a>
                        <?php } ?>
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
<!-- End of Pending requests -->

<!-- Assigned requests -->
<h1 class="h3 mb-2 text-gray-800">Assigned requests</h1>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">You can re-assign below requests</h6>
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
            <th>Assigned Station</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <?php foreach ($response_assigned->help_details as $help_assigned) { ?>
        <?php
            $process_name = $help_assigned->name;
            if($help_assigned->is_witness)
            {
              $process_name = $process_name." <i>(Witness)</i>";
            }

            $assigned_station = "";
            foreach($stations as $station_search)
              {
                if($station_search->id == $help_assigned->assigned_station)
                {
                  $assigned_station = $station_search->station_name;
                  break;
                }
              }
          ?>
          <tr>
            <td><?php echo $process_name ?></td>
            <td><?php echo $help_assigned->latest_position->computed_distance->origin_address ?></td>
            <td><?php echo $help_assigned->latest_position->date_time ?></td>
            <td><?php  echo $help_assigned->event_type ?></td>
            <td><?php  echo $assigned_station;?></td>          
            <td><a href="#" class="btn btn-info btn-circle" onClick="noticeModalOpened()" data-toggle="modal" data-target="#more_details_assigned<?php echo $help_assigned->id ?>">
                    <i class="fas fa-cog"></i>
                  </a>
            </td>

            <!-- Modal -->
            <div class="modal fade" id="more_details_assigned<?php echo $help_assigned->id ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Re-assign request #<?php echo $help_assigned->id ?></h5>
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
                        <?php echo $help_assigned->age?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Identity No:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help_assigned->NIC ?>
                      </div>
                      <div class="col-sm-2">
                        <b>Blood group:</b>
                      </div>
                      <div class="col-sm-2">
                        <?php echo $help_assigned->blood_group?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Special Conditions:</b>
                      </div>
                      <div class="col-sm-9">
                        <?php echo $help_assigned->special_conditions ?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Address:</b>
                      </div>
                      <div class="col-sm-9">
                        <?php echo $help_assigned->latest_position->computed_distance->origin_address ?>
                      </div>
                    </div>
                    <?php if($help_assigned->is_witness){?>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Impact Type:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help_assigned->impact_type ?>
                      </div>
                      <div class="col-sm-2">
                        <b>No of floors:</b>
                      </div>
                      <div class="col-sm-2">
                        <?php echo $help_assigned->no_floors?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="col-sm-3">
                        <b>Building Type:</b>
                      </div>
                      <div class="col-sm-5">
                        <?php echo $help_assigned->building_type ?>
                      </div>
                      <div class="col-sm-2">
                        <b>Trapped Person?</b>
                      </div>
                      <div class="col-sm-2">
                        <?php if($help_assigned->person_trapped == 1){echo "Yes";}else{echo "No";} ?>
                      </div>
                    </div>
                    <div class="row modal_row">
                      <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="<?php echo base_url() ?>index.php/welcome/getVideo/<?php echo $help_assigned->id ?>" allowfullscreen></iframe>
                      </div>
                    </div>
                    <?php }?>
                    
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onClick="noticeModalClosed()">Close</button>
                    <div class="dropup">
                      <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Assign
                      </button>
                      <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMenuButton">
                        <?php foreach ($stations as $station) { ?>
                          <a class="dropdown-item" href="<?php echo base_url(); ?>index.php/welcome/assignRequest/<?php echo $help_assigned->id ?>/<?php echo $station->id ?>"><?php echo $station->station_name; ?></a>
                        <?php } ?>
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
<!-- End of assigned requests -->

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

<script>
  var modalIsOpened = false;

  function noticeModalOpened(){
    modalIsOpened = true;
    console.log("modal opened");
  }

  function noticeModalClosed(){
    modalIsOpened = false;
    console.log("modal closed");
  }

  setTimeout(function() {
    if(!modalIsOpened){
      location.reload();
    }
  }, 30000);
</script>


