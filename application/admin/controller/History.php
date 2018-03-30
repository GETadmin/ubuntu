<?php
namespace app\admin\controller;
use think\Controller;
/**
* 
*/
class History extends Controller
{
	
	function record(){
		return $this->fetch();
	}
	function download(){
		return $this->fetch();
	}
	function show(){
		return $this->fetch();
	}
}