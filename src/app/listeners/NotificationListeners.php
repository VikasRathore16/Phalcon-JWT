<?php

namespace App\Listeners;

require APP_PATH . '/library/vendor/autoload.php';

use Phalcon\Di\Injectable;
use Phalcon\Events\Event;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;


class NotificationListeners extends Injectable
{
    public function afterSend(Event $event, \App\Components\DateHelper $components)
    {
        $logger = $this->di->get('logger');
        $logger->info('After notification');
    }

    public function beforeSend(Event $event, $addarr, $settings)
    {
        $logger = $this->di->get('logger');

        if (isset($addarr->customer_name)) {
            $logger->info('Before notification. Order Added');
        }
        if (isset($addarr->product_name)) {
            $logger->info('Before notification. Product Added');
        }

        if ($addarr->price == '') {
            $addarr->price = $settings[0]->default_price;
        }
        if ($addarr->stocks == '') {
            $addarr->stocks = $settings[0]->default_stock;
        }
        if ($settings[0]->title_optimization == 'Y') {
            $addarr->product_name = "$addarr->product_name" . "$addarr->tags";
        }
        if (isset($addarr->zipcode) && $addarr->zipcode == '') {
            $addarr->zipcode = $settings[0]->default_zipcode;
        }
        return $addarr;
    }

    public function beforeHandleRequest(Event $event, \Phalcon\Mvc\Application $application)
    {
        $aclFile = APP_PATH . '/security/acl.cache';
        if (true === is_file($aclFile)) {
            $acl = unserialize(file_get_contents($aclFile));
            $bearer = $application->request->get('bearer') ?? 'invalidToken';
            $controller = $application->router->getControllerName() ?? 'index';
            $action = $application->router->getActionName() ?? 'index';

            try {

                $key = "example_key";
                $decoded = JWT::decode($bearer, new Key($key, 'HS256'));
                $decoded_array = (array) $decoded;
                $role = $decoded_array['role'];
            } catch (\Exception $e) {
                echo "Try with accessable token please !";
                die;
            }

            if (!$role || true !== $acl->isAllowed($role, $controller, $action)) {

                echo '<h2>Access denied :(</h2>';
                die;
            }
        }
    }
}
