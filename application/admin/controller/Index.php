<?php
namespace app\admin\controller;
use \think\Controller;
use \think\Db;
use \think\Route;
use \think\Request;
use \think\Session;
use Cpu\Cpunumber;

class Index extends Base
{
	use \traits\controller\Jump;
    public function index()
    {
    	 $data         = session('adminlogin');
        $userid     = $data['adminId'];    
    	$userdata 	= db('administrator')->where(array('admin_id'=>$userid))->find();
    	$this->assign('data',$userdata);
        return $this->fetch();
    }
    public function mycore(){
         $data      = session('adminlogin');
        $userid     = $data['adminId'];    
        $userdata   = db('administrator')->where(array('admin_id'=>$userid))->find();
        $addr=db('user_ip')->where(array('user_id'=>$userid))->order('start_time desc')->limit(2)->field('ip_address,start_time')->select();
       //获取服务器信息
	$a=explode(',',exec('uptime'));//获取服务器已经开启时间

	 $indexserver =array(
				'Pself' 	=> $_SERVER['PHP_SELF'],//获取当前脚本的文件名
				'Droot'		=> $_SERVER['DOCUMENT_ROOT'],//获取服务器的根目录
				'Rurl'		=> $_REQUEST['s'],
				'chaotime'	=> ini_get('max_execution_time'),//获取服务器脚本超时时间
				'yuyan'		=> $_SERVER['HTTP_ACCEPT_LANGUAGE'],//获取服务器语言
				'kongjian'	=> round((disk_free_space(".")/(1024*1024)),2).'M',//剩余空间
				'adminnum' 	=> db('administrator')->count(),
				'servertime' 	=> $a[0],
				'ss'		=> count($_SESSION),
				'sid'		=> session_id(),
				'php-v'	  	=> PHP_VERSION,//php版本
				'think-v'	=> THINK_VERSION,//框架版本
				'Ginterface' 	=> $_SERVER['GATEWAY_INTERFACE'],//获取服务器的CGI规范的版本
				'Saddr' 	=> $_SERVER['SERVER_ADDR'],//获取当前运行脚本所在的服务器的IP地址
				'Ssoftware' 	=> $_SERVER['SERVER_SOFTWARE'],//获取服务器标识字符串（如 apache/2.2.24）
				'Sprotocol' 	=> $_SERVER['SERVER_PROTOCOL'],//获取请求页面通心协议的名称和版本
				'Rname' 	=> $_SERVER['SERVER_NAME'],//获取域名
				'Rmethod' 	=> $_SERVER['REQUEST_METHOD'],//获取页面使用的请求方法（如post）
				'Rtime' 	=> $_SERVER['REQUEST_TIME'],//获取请求开始时的时间戳
				'Qstring' 	=> $_SERVER['QUERY_STRING'],//获取查询字符串，如果是通过查询字符串访问此页面
				'Haccept' 	=> $_SERVER['HTTP_ACCEPT'],//获取当前请求的请求头
			//`	'H_Acharset' 	=> $_SERVER['HTTP_ACCEPT_CHARSET'],//获取当前请求的Accept_Charset头（如utf-8）
				'Hhost' 	=> $_SERVER['HTTP_HOST'],//获取当前的Host头
				'Hreferer' 	=> $_SERVER['HTTP_REFERER'],//获取当前页面的完整URL（不可靠，因为不是所有用户代理都支持）
			//	'H' 		=> $_SERVER['HTTPS'],//是否通过安全HTTP协议查询脚本	
				'Raddr' 	=> $_SERVER['REMOTE_ADDR'],//获取当前用户的Ip地址
			//	'Rhost' 	=> $_SERVER['REMOTE_HOST'],//获取当前页面用户的主机名称
				'Rport' 	=> $_SERVER['REMOTE_PORT'],//获取用户机器行链接web服务器所使用的端口号
				'Sfilename' 	=> $_SERVER['SCRIPT_FILENAME'],//获取当下执行脚本的绝对路径
			//	'Sadmin' 	=> $_SERVER['SERVER_ADMIN'],//指明apache服务器配置文件中SEVER_ADMIN参数
				'Sport' 	=> $_SERVER['SERVER_PORT'],//web服务器使用的端口，默认值为‘80’
			//	'Ssignature' 	=> $_SERVER['SERVER_SIGNATURE'],//获取服务器版本和虚拟机名字
				'Sname' 	=> $_SERVER['SCRIPT_NAME'],//获取当前脚本的路径
			//	'Suri' 		=> $_SERVER['SCRIPT_URI']//获取当前页面的url
				);
dump($indexserver);
dump(phpinfo());

$rew = new Cpunumber();
	$this->assign('cpu',$rew->sys_linux());
	$this->assign('httpserver',$indexserver);
        $this->assign('data',$userdata);
        $this->assign('addr',$addr[1]);
    	return $this->fetch();
    }
}
