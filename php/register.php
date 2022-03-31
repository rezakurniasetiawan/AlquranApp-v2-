<?php
    $db = mysqli_connect('localhost','root','','db_alquranapp');
    if (!$db) {
        echo "Database connection faild";
    }

    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $username = $_POST['username'];

    $sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."'";

    $result = mysqli_query($db,$sql);
    $count = mysqli_num_rows($result);

    if ($count == 1) {
        echo json_encode("Error");
    }else{
        $insert = "INSERT INTO users(name,email,password,username)VALUES('".$name."','".$email."','".$password."','".$username."')";
        $query = mysqli_query($db,$insert);
        if ($query) {
            echo json_encode("Success");
        }
        else{
        echo json_encode("Error");
    }
    }

?>