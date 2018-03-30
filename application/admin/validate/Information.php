<?php
namespace app\admin\validate;
use think\Validate;
class Information extends Validate
{
protected $rule = [
	'title' 	=> 'require|max:150',
	'columnId'	=> 'number|between:1,1000',
	'sort' 		=> 'number|between:1,100',
	'keyword'	=> 'require',
	'abstract'	=> 'require',
	//'source' 	=> 'require',
	//'image' 	=> 'require',
	'content' 	=> 'require',
	
];
protected $message = [
	'title.require' => '标题必须',
	'title.max' 	=> '标题不能超过150个字符'，
	'columnId.number'=> '栏目分类必须是数字',
	'columnId.between' => '分类ID只能在1-1000之间',
	'sort.number'	=> '排序值只能是数字',
	'sort.between' 	=> '排序值只能在1-100之间',
	'keyword.require'=> '关键字必须',
	'abstract' 	=> '文章摘要必须', 
	//'image.require' => '图片必须',
	'content' 	=> '文章内容不能为空',
	

];
protected $scene = [
		'edit' => ['title','sort']
		];
}
