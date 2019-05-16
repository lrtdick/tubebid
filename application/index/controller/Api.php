<?php
/**
 *
 * api (http:json)
 *
 */
namespace app\api\controller;
use think\controller;
use ST\Common\ErrorCode;
use ST\Common\IpParse;
use ST\Common\Result;

class ApiController extends controller
{
    public function indexAction()
    {
        $headers = getallheaders();
        $data = [];

        if (isset($headers['Authorization'])) {
            $data['token'] = $headers['Authorization'];
        }
        if (isset($headers['X-Real-Ip'])) {
            $data['realIp'] = $headers['X-Real-Ip'];
        } else {
            die(Result::getResultError(__LINE__, __FILE__, ErrorCode::INVALID_PARAMS, "Invalid param X-Real-Ip."));
        }

        if (isset($headers['Path'])) {
            $data['path'] = $headers['Path'];
        } else {
            die(Result::getResultError(__LINE__, __FILE__, ErrorCode::INVALID_PARAMS, "Invalid param path."));
        }

        if (isset($headers['Method'])) {
            $data['method'] = $headers['Method'];
        } else {
            die(Result::getResultError(__LINE__, __FILE__, ErrorCode::INVALID_PARAMS, "Invalid param method."));
        }

        $this->runFactory($data);
    }

    protected function init()
    {
        $clientIp = IpParse::getReallyClientIp();

        $ips = \Yaconf::get('ipwhite.api');
        if (!in_array($clientIp, $ips)) {
            //die(Result::getResultError(__LINE__, __FILE__, ErrorCode::INVALID_IP, "this ip $clientIp is not white" . json_encode($ips)));
        }
    }

    private function runFactory($params)
    {
        try {
            $data = $this->getPost();

            foreach ($params as $k => $v) {
                $data[$k] = $v;
            }

            $method = $data['method'];
            $path = ucfirst(strtolower($data['path']));
            if (!is_file(LIB_PATH . 'ST/Service/Api/' . $path . '.php')) {
                die(Result::getResultError(__LINE__, __FILE__, ErrorCode::SERVER_ERROR, "There's no path file." . json_encode($params)));
            }

            $class = 'ST\Service\Api\\' . $path;
            if (!class_exists($class)) {
                die(Result::getResultError(__LINE__, __FILE__, ErrorCode::SERVER_ERROR, "There's no ". $class ." class."));
            }

            $cs = new $class();
            die($cs->$method($data));
        } catch (\Throwable $e) {
            die(Result::getResultError(__LINE__, __FILE__, ErrorCode::SERVER_ERROR, $e->getMessage(), $e));
        }
    }
}
