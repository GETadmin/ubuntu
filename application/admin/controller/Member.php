<?php
namespace app\admin\controller;
use think\Controller;
/**
* 
*/
class Member extends Controller
{
	
	function memlist(){
		return $this->fetch();
	}
	function memadd(){
		return $this->fetch();
	}
	function memdel(){
		return $this->fetch();
	}
	
}