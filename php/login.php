<?php 
    $db = mysqli_connect('localhost','root','','db_alquranapp');

    $username = $_POST['username'];
    $password = md5($_POST['password']);

    $sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."'";

    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }

?>