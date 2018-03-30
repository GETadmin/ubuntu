<?php
namespace app\admin\controller;
use think\Controller;
use think\captcha\Captcha;
use think\Request;
use Ip\Ipcoing;
/**
* 
*/
class Login extends Controller
{
	
	function login(){
			
		if(Request::instance()->isPost()){
			$password=encrypt(input('post.password','','htmlspecialchars'));

			if(input('post.mode')=="on")
			{//检查验证是否正确
					dump($_POST);
					exit;
				 $capthcha=new Captcha();
				if(!captcha_check(input('post.verifi/s'))){
					$this->error('对不起，验证码出错！');
				} else {
					$this->authentication(input('post.username','','htmlspecialchars'),$password);
				} 		
			}
			else if(input('post.mode')=="off")
			{	
				$this->authentication(input('post.username'),$password);
				// //查出该用户是否存在
				// $username=db('administrator')->where(array('admin_name'=>input('post.username')))->find();
				// if($username){
				// 	//验证该用户的密码输入是否正确
				// 	if($userlist=db('administrator')->where(array('admin_id'=>$username['admin_id'],'admin_password'=>$password))->find()){
				// 		//获取客户端的ip信息
				// 		$coing 	= new Ipcoing();
				// 		$GetBrowser = $coing->GetBrowser();
				// 		$GetOs 		= $coing->GetOs();
				// 		$Getaddress = $coing->Getaddress();
				// 		$userip 	= request()->ip();
				// 		//存储ip信息
				// 		$ipdata 	=array(
				// 					'ip_address'=> $userip,
				// 					'user_id' 	=> $userlist['admin_id'],
				// 					'address' 	=> $Getaddress['country'].'-'.$Getaddress['province'].'-'.$Getaddress['city'],
				// 					'Browser' 	=> $GetBrowser,
				// 					'Os' 		=> $GetOs ,
				// 					'start_time'=> time(),
				// 					'Country' 	=> $Getaddress['country'],
				// 					'Province' 	=> $Getaddress['province'],
				// 					'City' 		=> $Getaddress['city']
				// 					);
				// 		db('user_ip')->insertGetId($ipdata);
				// 		db('administrator')->where(array('admin_id'=>$userlist['admin_id']))->setInc('log_frequency');
				// 		//写入缓存
				// 		session('userid',$userlist['admin_id']);
				// 		session('username',$userlist['admin_name']);
				// 		session('headimgurl',$userlist['headimgurl']);
				// 		session('sex',$userlist['admin_sex']);
				// 		cookie('is_ver',null);
				// 		$this->redirect('Index/index');
				// 	}	else {
				// 		password();
				// 			$this->error('用户名/密码输入错误！',url('Login/login'));
				// 	} 

				// }	else {
				// 	password();
				// 	$this->error('没有该用户',url('Login/login'));
				// }
			}
		}else{
			if(isverifi()){
				$this->assign('display',0);
			}else{
				$this->assign('display',1);
			}
			 
			 return $this->fetch();
			
		}
		
		} 
		function authentication($username,$password){
				//查出该用户是否存在
					$username=db('administrator')->where(array('admin_name'=>$username))->find();
					if($username){
						//验证该用户的密码输入是否正确
						if($userlist=db('administrator')->where(array('admin_id'=>$username['admin_id'],'admin_password'=>$password))->find()){
							//获取客户端的ip信息
							$coing 	= new Ipcoing();
							dump($coing);
							$GetBrowser = $coing->GetBrowser();
							$GetOs 		= $coing->GetOs();
							$Getaddress = $coing->Getaddress();
							$userip 	= request()->ip();
							//存储ip信息
							$ipdata 	=array(
										'ip_address'=> $userip,
										'user_id' 	=> $userlist['admin_id'],
										'address' 	=> $Getaddress['country'].'-'.$Getaddress['province'].'-'.$Getaddress['city'],
										'Browser' 	=> $GetBrowser,
										'Os' 		=> $GetOs ,
										'start_time'=> time(),
										'Country' 	=> $Getaddress['country'],
										'Province' 	=> $Getaddress['province'],
										'City' 		=> $Getaddress['city']
										);
							db('user_ip')->insertGetId($ipdata);
							db('administrator')->where(array('admin_id'=>$userlist['admin_id']))->setInc('log_frequency');
							//写入缓存
							$data=array('adminId'=>$userlist['admin_id'],'adminName'=>$userlist['admin_name'],'headimgurl'=>$userlist['headimgurl'],'sex'=>$userlist['admin_sex']);
							session('adminlogin',$data);
							cookie('is_ver',null);

							return $this->redirect('Index/index');
						}	else {
							password();
							return $this->error('用户名/密码输入错误！',url('Login/login'));
								
						} 

					}	else {
						password();
						return $this->error('没有该用户',url('Login/login'));
						
					}
		}

}
