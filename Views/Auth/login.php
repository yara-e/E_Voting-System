
<?php 
require_once '../../Models/Voter.php';
require_once '../../Controllers/AuthController.php';

$errMsg="";

if(isset($_POST['Id']) && isset($_POST['password']))
{
    if(!empty($_POST['Id']) && !empty($_POST['password']) )
    {   
        $voter=new Voter;
        $auth=new AuthController;
        $voter->Id=$_POST['Id'];
        $voter->password=$_POST['password'];
        if(!$auth->login($voter))
        {
            if(!isset($_SESSION["userId"]))
            {
                session_start();
            }
            $errMsg=$_SESSION["errMsg"];
        }
        else
        {
            if(!isset($_SESSION["userId"]))
            {
                session_start();
            }
          //  if($_SESSION["userRole"]=="Admin")
           if($_POST['password']=="123")
            {
                header("location: ../Admin/index.php");
                
            }
            else
            { 
                header("location: ../voter/election_list.php");
            }
        }
       

        
    }
    else
    {
        $errMsg="Please fill all fields";
    }
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login - Brand</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
</head>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;imge.jpg&quot;);"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Welcome To Vote!</h4>
                                        <?php 
              
              if($errMsg!="")
              {
                  ?>
                      <div class="alert alert-danger" role="alert"><?php echo $errMsg ?></div>
                  <?php
              }
            
            ?>
                                    </div>
                                    <form class="user" action="login.php" method="POST">
                                        <div class="form-group"><input class="form-control form-control-user" type="password" id="exampleInputPassword"  placeholder="Enter id Address..." name="Id"></div>
                                        <div class="form-group"><input class="form-control form-control-user" type="password" id="exampleInputPassword" placeholder="Password" name="password"></div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input class="form-check-input custom-control-input" type="checkbox" id="formCheck-1"><label class="form-check-label custom-control-label" for="formCheck-1">Remember Me</label></div>
                                            </div>
                                        </div><button class="btn btn-primary btn-block text-white btn-user" type="submit">Login</button>
                       
                                        <hr>
                                    </form>
                                    <div class="text-center"><a class="small" href="forgot-password.html">Forgot Password?</a></div>
                                    <div class="text-center"><a class="small" href="register.html">Create an Account!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../assets/js/theme.js"></script>
</body>

</html>