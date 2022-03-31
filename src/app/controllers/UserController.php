<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Request;
use Phalcon\Acl\Role;
use Phalcon\Acl\Adapter\Memory;

use Phalcon\Security\JWT\Builder;
use Phalcon\Security\JWT\Signer\Hmac;
use Phalcon\Security\JWT\Token\Parser;
use Phalcon\Security\JWT\Validator;


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
            $this->view->post = $this->request->getPost();
            $username = $this->request->getPost('username');
            $email = $this->request->getPost('email');
            $password = $this->request->getPost('password');
            $roles = $this->request->getPost('roles');


            // Defaults to 'sha512'
            $signer  = new Hmac();

            // Builder object
            $builder = new Builder($signer);

            $now        = new DateTimeImmutable();
            $issued     = $now->getTimestamp();
            $notBefore  = $now->modify('-1 minute')->getTimestamp();
            $expires    = $now->modify('+1 day')->getTimestamp();
            $passphrase = 'QcMpZ&b&mo3TPsPk668J6QH8JA$&U&m2';

            // Setup
            $builder
                ->setAudience('https://target.phalcon.io')  // aud
                ->setContentType('application/json')        // cty - header
                ->setExpirationTime($expires)               // exp 
                ->setId('abcd123456789')                    // JTI id 
                ->setIssuedAt($issued)                      // iat 
                ->setIssuer('https://phalcon.io')           // iss 
                ->setNotBefore($notBefore)                  // nbf
                ->setSubject($roles)   // sub
                ->setPassphrase($passphrase)                // password 
            ;

            // Phalcon\Security\JWT\Token\Token object
            $tokenObject = $builder->getToken();
            // echo '<pre>';
            $tokenObject = $tokenObject->getToken();
            $jwt = $tokenObject;

            $newUser = array(
                'username' => $username,
                'email' => $email,
                'password' => $password,
                'jwt' => $jwt,
            );

            $user = new Users();
            $user->assign(
                $newUser,
                [
                    'username',
                    'email',
                    'password',
                    'jwt'
                ]
            );

            $success =  $user->save();
            if ($success) {
                $this->view->msg = "<h6 class='alert alert-success w-75 container text-center'>Added Successfully</h6>";
            } else {
                $this->view->msg = "<h6 class='alert alert-danger w-75 container text-center'>Something went wrong</h6>";
            }
            // die($jwt);
            // $parser = new Parser();
            // echo "<pre>";
            // $name = $parser->parse($tokenObject)->getClaims()->getPayload()['sub'];
            // print_r($name);
            // echo "</pre>";
            // // die;

        }
    }
}
