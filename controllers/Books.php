<?php
//define('VENDOR', substr(FCPATH, 0, strpos(APPPATH, 'application/')) . "vendor/");
//require VENDOR . 'autoload.php';

//require (APPPATH.'/libraries/REST_Controller.php');

//use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

//use Restserver\Libraries\REST_Controller;
//require(APPPATH.'/libraries/REST_Controller.php');  

class Books extends REST_Controller
{
  public function index_get()
  {
    // Display all books
    $this->response('ok');
  }

  public function index_post()
  {
    // Create a new book
  }
}