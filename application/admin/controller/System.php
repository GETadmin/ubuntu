<?php
namespace app\admin\controller;
use think\Controller;
/**
* 
*/
class System extends Controller
{
	
	function base(){
		return $this->fetch();
	}
	function category(){
		return $this->fetch();
	}
	function categoryadd(){
		return $this->fetch();
	}
	function systemlist(){
		return $this->fetch();
	}
	function log(){
		return $this->fetch();
	}
	function shielding(){
		return $this->fetch();
	}
}