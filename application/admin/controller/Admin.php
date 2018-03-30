<?php
namespace app\admin\controller;	
use think\Controller;
use think\Request;
use app\admin\model\AuthRole as isrole;
/**
* 
*/
class Admin extends Controller
{
	
	function adminlist(){
		$userdata=db('administrator')->alias('a')->join('so_auth_access b','a.admin_id=b.uid')->join('so_auth_group c','b.group_id=c.id')->field('a.admin_id,a.admin_anme,a.phone,a.email,a.time_add,c.title')->select();
		$this->assign('data',$userdata);
		return $this->fetch();
	}
	function adminadd(){

		if(Request::instance()->isPost()) {
			// exit(json_encode(array('data'=>input('post.admin_work_number'))));
			$data = Request::instance()->only('admin_name,admin_password,admin_sex,phone,email,remarks,admin_work_number','post');
			$data['admin_password'] = encrypt($data['admin_password']);
			$data['time_add']=time();
			if(db('administrator')->data($data)->insert()){
				return array('data'=>1);
	
			}else{
				return array('data'=>0);
			}
		}else{
			
			return $this->fetch();	
		}
		
	}
	function adminedit(){
		if(Request::instance()->isPost()){
			$id=input('post.admin_id');
			$data=input('post.work_state');
			// Request::instance()->only('work_state');
			// exit(json_encode(array('data'=>$data)));
			$admin=db('administrator')->where('admin_id',$id)->update(['work_state'=>$data]);
			if($admin){
				return array('data'=>1);
			}else{
				return array('data'=>0);
			}

		}else{
			$id=input('param.id');
			if($id){
				$user=db('administrator')->where('admin_id',$id)->field('admin_id,admin_name,admin_work_number,remarks,work_state')->find();
				dump($user);
				$this->assign('user',$user);
			}else{

			}
			return $this->fetch();
		}
		
		
	}
	function admindel(){
		if(Request::instance()->isPost()){
			$id=input('post.id');
			if(db('administrator')->where('admin_id',$id)->delete()){
				return array('data'=>1);
			}else{
				return array('data'=>0);
			}
		}else{
			return array('data'=>0);
		}
	
	}
	function wholedel(){
		if(Request::instance()->isPost()){
			$id=input('post.id/a');
			// if(db('administrator')->where(array('admin_id'=>array('in',$id)))->delete()){
			// 	return array('status'=>1);
			// }else{
			// 	return array('status'=>0);
			// }
			return $this->comaction('admin_id',$id,'administrator');
		}else{

		}

		}
	function pwdedit(){
		return $this->fetch();
	}
	function permission(){

		$arr = db('auth_rule')->field('id,name,title,condition,direct_jump,status')->order('sort desc')->select();
		foreach ($arr as $key => $value) {
			$vi=explode('-',$value['title']);
			$vl=explode('-',$value['name']);
			$arr[$key]['condition']=$vi[0];
			$arr[$key]['condname']=$vl[0];
			if (count($vl)==1) {
				$arr[$key]['name']=$vl[0];
			}else{
			$arr[$key]['name']=$vl[1];	
			}
		}
		$role =   array();
		foreach($arr as $k=>$v){
		    $role[$v['condname']][]    =   $v;
		}
		$this->assign('role',$role);
		return $this->fetch();
	}
	//角色管理
	function adminrole(){
		$list=db('auth_group')->where('status',1)->select();

		foreach ($list as $key => $val) {

			$where = explode(',',$val['rules']);
			$ere['id']=array('in',$where);
			$list[$key]['rules'] = db('auth_rule')->where($ere)->field('id,name')->select();	
		}
					$userName=db('auth_access')->alias('a')->join('so_administrator b','a.uid=b.admin_id')->field('a.group_id,b.admin_name')->select();	
		$this->assign('list',$list);
		$this->assign('userName',$userName);		

		return $this->fetch();
	}
	function roleadd(){
		if(Request::instance()->isPost()){
			$data=input('post.');
			$rules=$data['rules'];
			$data['rules']=implode(',',$rules);
			if(db('auth_group')->insert($data)){
				$this->success('添加成功！',url('admin/adminrole'));
			}
			else{
				$this->error('添加失败！');
			}

		}else{
			$arr = db('auth_rule')->field('id,name,title,condition,direct_jump,status')->where('status',1)->order('sort desc')->select();
			foreach ($arr as $key => $value) {
				$vi=explode('-',$value['title']);
				$vl=explode('-',$value['name']);
				$arr[$key]['condition']=$vi[0];
				$arr[$key]['condname']=$vl[0];
				if (count($vl)==1) {
					$arr[$key]['name']=$vl[0];
				}else{
				$arr[$key]['name']=$vl[1];	
				}
			}
			$role =   array();
			foreach($arr as $k=>$v){
			    $role[$v['condname']][]    =   $v;
			}
			$this->assign('role',$role);
			return $this->fetch();
		}
	}
	function roleedit(){
		if(Request::instance()->isPost()){
			$deit=input('post.');
			$deit['rules']=implode(',', $deit['rules']);
			$dei=db('auth_group')->update($deit);

			if($dei){
				$this->success('修改成功！',url('Admin/adminrole'));
			}else{
				$this->error('修改失败！');
			}
		}else{
			$id=input('param.id');
			$data=db('auth_group')->where('id',$id)->find();
			$arr = db('auth_rule')->field('id,name,title,condition,direct_jump,status')->where('status',1)->order('sort desc')->select();
			foreach ($arr as $key => $value) {
				$vi=explode('-',$value['title']);
				$vl=explode('-',$value['name']);
				$arr[$key]['condition']=$vi[0];
				$arr[$key]['condname']=$vl[0];
				if (count($vl)==1) {
					$arr[$key]['name']=$vl[0];
				}else{
				$arr[$key]['name']=$vl[1];	
				}
			}
			$role =   array();
			foreach($arr as $k=>$v){
			    $role[$v['condname']][]    =   $v;
			}
			$this->assign('role',$role);
			$this->assign('data',$data);
			return $this->fetch();
		}
	}
	function roledel(){

	}
	function ruleadd(){
		if(Request::instance()->isPost()){
			$data = input('post.');
			if(db('auth_rule')->insert($data)){
				$this->success('添加成功！',url('Admin/permission'));
				// echo "layer_close()";
			}else{
				$this->error('添加失败！');
			}
		}
		else{
			return $this->fetch();
		}
		
	}
	function ruleedit(){
		if(Request::instance()->isPost()){
			$id = input('post.id');
			$data = Request::instance()->only(['title','name','sort','condition','direct_jump','status'],'post');
			if(db('auth_rule')->where('id',$id)->update($data)){
				$this->success('修改成功！',url('Admin/permission'));
			}else{
				$this->error('修改失败！');
			}
		}else {
		$id=input('param.id');
		$data=db('auth_rule')->where('id',$id)->find();
		$this->assign('data',$data);
		return $this->fetch();	
		}		
	}
	function ruledel(){
		if(Request::instance()->isPost()){
			$id=input('post.id');
			if(db('auth_rule')->where('id',$id)->delete()){
				return array('data'=>1);
			}else{
				return array('data'=>0);
			}
		}else{

		}
	}
	function state(){
		if (Request::instance()->isPost()) {

			$div 	=input('post.div');
			$id 	=input('post.id');
			 // exit(json_encode(array('status'=>$id)));
			if($div==='1'){
				if(db('administrator')->where('admin_id',$id)->setField('state','1')){
					return array('status'=>'success','id'=>$id);
				}else{
					return array('status'=>'error');
				}
			}else if($div==='0'){
				
				if(db('administrator')->where('admin_id',$id)->setField('state','0')){
					return array('status'=>'success','id'=>$id);
				}else{
					return array('status'=>'error');
				}
			}			
		}
	}



	function comaction($val,$id,$db){
		//公共批量删除调用
		if(db($db)->where(array($val=>array('in',$id)))->delete()){
				return array('status'=>1);
			}else{
				return array('status'=>0);
			}

	}
}
