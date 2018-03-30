<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Route;
use think\Request;
use think\Session;
/**
* 
*/
class Base extends Controller
{
	use \traits\controller\Jump;
	
	public function _initialize() {
		define('SID', is_login());

        if (!SID) {
            set_redirect_url($_SERVER['REQUEST_URI']);
            $this->redirect('Login/login');
        }
        $data 		= session('adminlogin');
        $userid 	= $data['adminId'];       // 管理员用户id
        dump($userid);
        $username 	= $data['adminName'];    // 管理员用户名 
        $usersex 	= $data['sex'];    // 管理员性别
        $userimg 	= $data['headimgurl'];    // 管理员头像	
        if(empty($data)){
        	$this->redirect('Login/login');
        }
        //登录免输入
        // $rememberPassword = Session::get('rememberPassword');
        // if ($rememberPassword == '1') {
        //     session_write_close();
        //     $nextWeekTime = 3600 * 24 * 7;
        //     session_cache_expire($nextWeekTime / 60);
        //     session_set_cookie_params($nextWeekTime); 
        //     session_start();           
        // }

       $useri = Db::name('administrator')->alias('a')->join('so_auth_access b','a.admin_id = b.uid')->join('so_auth_group c','b.group_id = c.id')->where('a.admin_id',$userid)->where('a.state',0)->field('a.*,c.title,c.id')->find();
       dump($useri);
	$user = Db::name('administrator')->where('admin_id',$userid)->where('state',1)->field('admin_id,work_state')->find();
	 if(empty($user)){
            return $this->error('请重新登录！');
        } 
        if ($user['work_state'] == '1') {
            $this->error('账户被锁定！','Login/login');
        }              
        $this->assign('userInfo', $user);
        $auth=new \Auth\Auth();//权限认证Auth类
        $request = Request::instance();
        if(!$auth->check($request->controller().'-'.$request->action(),$userid)){// 第一个参数是规则名称,第二个参数是用户UID
            $this->error('没有权限，将跳转到可访问页面！','login/login');
         }

        $lujin = $request->controller();//控制器名
        $lujin1 = $request->action();//方法名
        $this->assign('lujin', $lujin);
        $this->assign('lujin1', $lujin1);
        $time= date('G');       
        $this->assign('time',$time);
       $this->assign('username',$username);
       $this->assign('userimg' ,$userimg);
	}
}
