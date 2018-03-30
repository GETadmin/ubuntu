<?php
namespace app\admin\model;
use think\Model;
/**
* 
*/
class AuthRole extends Model
{
	
	

public function saveConfig($data)  
		    {  
		        if( empty($data) || !is_array($data) )  
		        {  
		            return false;  
		        }  
		  
		        foreach ($data as $k=>$value)  
		        {  
		            if(empty($k))  
		            {  
		                continue;  
		            }  
		  
		            Config::where('varname',$k)->update(['value'=>trim($value)]);  
		        }  
		        return true;  
		    } 
		    public function datadd($data){
		    	$state = db('auth_rule')->insertGetId($data);
		    	if($state ){
		    		return true;
		    	}else{
		    		return false;
		    	}

		    }
		    public function datasave($id,$data){

		    	$state = db('auth_rule')->save($data,['id'=>$id]);
		    	if($state ){
		    		return true;
		    	}else{
		    		return false;
		    	}
		    }
		    function datadel($id){
		    	$state = db('auth_rule')->destroy(['id'=>$id]);
		    	if ($state) {
		    		return true;
		    	}else{
					return true;
		    	}
		    }
		    function select($where,$list=1,$start=1,$cut){
		    	if($list=="1"){
		    		$find=db('auth_rule')->where($where)->find();
		    		if($find){
		    			return $find;
		    		}else{
		    			return false;
		    		}
		    	}else{
			    	$select =db('auth_rule')->where($where)->limit($start,$cut)->select();
			    	if($select){
			    		return $select;
			    	}else{
			    		return false;
			    	}
		    	}
		    }}