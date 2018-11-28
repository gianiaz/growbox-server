<?php
declare(strict_types=1);

namespace App\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

/**
 * Class TestController
 * @package App\Controller
 */
class TestController
{

    /**
     * @Route("/")
     * @Template()
     */
    public function indexAction()
    {
        dump('test');
    }

}
