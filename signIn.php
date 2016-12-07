<?php
	try {
		$db = new PDO("mysql:dbname=mail;host=localhost", "root", "");
		
	}
	catch(PDOException $e){
		exit("Failed to connect to database!");
	} 
    
    $username = $_REQUEST["username"];
    $password = $_REQUEST["password"];
    $query = $db->prepare("SELECT * FROM User WHERE username=:username");
    $query->execute(array(':username'=>$username));
    $results = $query->fetchAll();
    
    if (count($results)===0){
        echo("No match found for user!");
        echo file_get_contents("index.html");
    }
    elseif ($results[0][3]===$password){
        session_start();
        $_SESSION["username"] = $username;
        $_SESSION["password"] = $password;
        $_SESSION["firstname"] = $results[0][1];
        $_SESSION["lastname"] = $results[0][2];
        $_SESSION["id"] = $results[0][0];
        echo file_get_contents("homepg.html");
    }
    else{
        echo("Password Not Valid");
        echo file_get_contents("index.html");
    }
    
?>