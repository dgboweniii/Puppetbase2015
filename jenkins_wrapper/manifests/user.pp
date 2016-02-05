class jenkins_wrapper::user (
                             $user,
                             $email,
                             $password
                            )

  {
  jenkins::user {$user:
                      email      => $email, 
                      password   => $password,
                     /* full_name  => "Marc Bittner", */                 
                    }
  }