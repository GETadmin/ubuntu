<?php
namespace app\admin\controller;
use think\Controller;
/**
* 
*/
class Userinfo extends Controller
{
	
	
	function userlist(){
		
		return $this->fetch();
	}
	function useradd(){
		return $this->fetch();
	}
	function useredit(){
		return $this->fetch();
	}
}