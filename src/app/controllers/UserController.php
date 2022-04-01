<?php
require APP_PATH . '/library/vendor/autoload.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

use Phalcon\Mvc\Controller;


class UserController extends Controller
{
    public function indexAction()
    {
        $this->view->users = Users::find();
    }

    public function addUserAction()
    {
        $this->view->roles = Roles::find();

        if ($this->request->isPost()) {
            //collecting data from POST
            $username = $this->request->getPost('username');
            $roles = $this->request->getPost('roles');

            $payload = array(
                "username" => $username,
                "role" => $roles,
            );

            //ecoding array 
            $key = "example_key";
            $jwt = JWT::encode($payload, $key, 'HS256');

            $newUser = array(
                'jwt' => $jwt,
            );

            $user = new Users();
            $user->assign(
                $newUser,
                [
                    'jwt'
                ]
            );

            $success =  $user->save();
            if ($success) {
                $this->view->msg = "<h6 class='alert alert-success w-75 container text-center'>Added Successfully</h6>";
            } else {
                $this->view->msg = "<h6 class='alert alert-danger w-75 container text-center'>Something went wrong</h6>";
            }
        }
    }
}
