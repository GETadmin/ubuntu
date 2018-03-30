<?php
namespace app\admin\controller;
use think\Controller;
/**
* 
*/
class Feed extends Controller
{
	
	function feedlist()
	{
		return $this->fetch();
	}
}