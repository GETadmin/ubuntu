<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * [encrypt 系统标准加密]
 */
function encrypt($string, $length = '') {
    $crypt = md5($string);
    // $crypt = strtoupper($crypt);

    if ( !empty($length) ) {
        return substr($crypt, 0, $length);
    } else {
        return $crypt;
    }
}
/*
	是否需要验证码
 */
function isverifi(){
	$verifi=cookie('is_ver');
	if($verifi >3){
		return false;
	}else{
		return true;
	}

}
/*
密码错误次数
 */
function password(){
	$verifi=cookie('is_ver');
	$verifi++;
	cookie('is_ver',$verifi,3600);
}
//验证是否登录
function is_login()
{
    $user = session('adminlogin');
    if (empty($user)) {
        return 0;
    }
    else {
        return $user['adminId'];
    }
}
//设置路径
function set_redirect_url($url)
{
    cookie('ke_redirect_url', $url);
}

//获取路径
function get_redirect_url()
{
    return cookie('ke_redirect_url');
}
//数组转字符串
function arrys($data){
    if(!empty($data)){
    foreach ($data as $key => $value) {
        $array[]=$value['name'];
    }
    $type=implode(',',$array);
    return $type;
}
}