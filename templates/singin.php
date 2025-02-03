<?php
session_start();
include('db.php');
if ($_SERVER['REQUEST_METHOD'] == "POST") {
  $firstname = $_POST['Name'];
  $gmail = $_POST['Email'];
  $passe = $_POST['pass'];

  if (!empty($gmail) && !empty($passe) && filter_var($gmail, FILTER_VALIDATE_EMAIL)) {
      $query = "INSERT INTO form (Name, Email, pass) VALUES ('$firstname', '$gmail', '$passe')";
      mysqli_query($conn, $query);
      echo "<script type='text/javascript'>alert('Successfully Registered')</script>";
      header("location: intrface.php");
  } else {
      echo "<script type='text/javascript'>alert('Please enter valid email and password')</script>";
  }

}
?>
<?php
//session_start();
include('db.php');
if ($_SERVER['REQUEST_METHOD'] == "POST") {
  $gmaill = $_POST['username'];
  $passee = $_POST['password'];

  if (!empty($gmaill) && !empty($passee) && !is_numeric($gmaill)) {
      $query = "SELECT * FROM form WHERE Email='$gmaill' LIMIT 1";
      $result = mysqli_query($conn, $query);
      if ($result && mysqli_num_rows($result) > 0) {
          $user_data = mysqli_fetch_assoc($result);
          if ($user_data['pass'] == $passee) {
              header("location: orderpage/index.php");
              die;
          }
      }
  }
  echo "<script type='text/javascript'>alert('Wrong username or password')</script>";
} else {
  echo "<script type='text/javascript'>alert('entre your informition')</script>";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="sign in.css">
</head>
<body>
  <div class="container">
    <input type="checkbox" id="check">
    <div class="login form">
      <header>Login</header>
      <form method="POST">
        <input name="username" type="email" placeholder="Enter your email" required>
        <input type="password" name="password" placeholder="Enter your password"  required>
        <input type="submit" class="button" value="Login">
      </form>
      <div class="signup">
        <span class="signup">Don't have an account?
         <label for="check">Signup</label>
        </span>
      </div>
    </div>
    <div class="registration form">
      <header>Signup</header>
      <form method="POST">
        <input type="text" name="Name" placeholder="Enter your name"  required>
        <input type="email" name="Email" placeholder="Enter your email"  required>
        <input type="password" name="pass" placeholder="Create a password"  required>
        <input type="submit" class="button" value="Signup">
      </form>
      <div class="signup">
        <span class="signup">Already have an account?
        <label for="check">Login</label>
        </span>
      </div>
    </div>
  </div>
</body>
</html>


