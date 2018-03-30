<?php
namespace app\admin\controller;
use think\Controller;
use think\Request;
use think\Validate;
use think\File;
/**
* 
*/
class Articleinfo extends Controller
{
	
	function artlist(){
		$list = db('information')->paginate(16);
		$page = $list->render();
		$this->assign('list',$list);
		$this->assign('page',$page);
		return $this->fetch();
	}
	function artadd(){
		if(Request::instance()->isPost()){
			$list = input('post.','','htmlspecialchars');
			$validate = validate('Information');
			if(!$validate->check($list)){
			dump($validate->getError());
			}
			
		}else{
			return $this->fetch();
		}
	}
	function artedit(){
		return $this->fetch();
	}
	function artclass(){
		return $this->fetch();
	}
	function addclass(){
		return $this->fetch();
	}
	function eidtclass(){
		return $this->fetch();
	}
	function upload(){
	$file = $this->request->file('file');
var_dump($file);
	if($file){
	$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		}
	}
}
