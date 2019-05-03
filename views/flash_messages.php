<div class="row justify-content-sm-center">
    <div class="col-sm-4 col-sm-offset-8 main">
    <div class="row justify-content-sm-center">
            <?php
            if ($msg = $this->session->flashdata('success')) {
                echo "<div class='alert alert-dismissable alert-success'>" . $msg . "</div>";
            } else if ($msg = $this->session->flashdata('error')) {
                echo "<div class='alert alert-dismissable alert-danger'>" . $msg . "</div>";
            }
            
            if((isset($message)) and ($message != ""))
            {
                echo "<div class='alert alert-dismissable alert-danger'>" . $message . "</div>";
            } 
            ?>
        </div>
    </div>
</div>