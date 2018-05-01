<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>登录页面</title>
		
		<script src="<%=basePath %>resources/js/jquery-1.11.0.min.js"></script>
		<link href="<%=basePath %>resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=basePath %>resources/bootstrap/css/bootstrap.css" rel="stylesheet">
		<script src="<%=basePath %>resources/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=basePath %>resources/js/login.js"></script>
	</head>
	<body>
		
		<!--
        	描述：内容业务栏
       -->
		<div class="jumbotron">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-1" style="text-align:center "></div>
					<!--
	                	作者：Hao
	                	时间：2018-01-30
	                	描述：描述部分
	                -->
					<div class="col-xs-6" style="text-align:center ">
					    <h2 class="text-info" style="font-family:幼圆;font-weight:bold;font-size:49px">
					      		期刊投稿处理系统
					    </h2>
					    <br>
					    <div class="text-muted">与世界分享你的逼格</div>
					    <br>
					    <br>
					    <!--<p><a role="button" href="#" class="btn btn-success">注册</a></p>-->
					    <p><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
			 							注册
			                </button>
					    </p>
				    </div>
				    <!--
	                	作者：Hao
	                	时间：2018-01-30
	                	描述：登录信息部分
	                -->
					<div class="col-xs-3" style="text-align:left ">
				    	<div style="width: 300px;">
				    		<div><span style="color: red;">${state}</span></div>
				    		<!--Form表单部分-->
					        <form role="form" action="<%=basePath %>user/login" method="POST" enctype="multipart/form-data">
							  	<div class="form-group">
							    	<div class="text-muted">账号&nbsp;: &nbsp;&nbsp;<span style="color: red;">${pwdState}</span></div>
							    	<input type="text" class="form-control" placeholder="请输入账号..." name="username">
							    	<p></p>
							    	<div class="text-muted">密码&nbsp;: &nbsp;&nbsp;<span style="color: red;">${userState}</span></div>
							    	<input type="password" class="form-control" placeholder="请输入密码..." name="password">
							    	<p></p>
							    	<div class="text-muted">
							    		请选择：
								    	<label class="radio-inline">
									        <input type="radio" name="type"  value="编辑" checked> 编辑
									    </label>
									    <label class="radio-inline">
									        <input type="radio" name="type"  value="专家"> 专家
									    </label>
									    <label class="radio-inline">
									        <input type="radio" name="type"   value="作者"> 作者
									    </label>
								    </div>
								    <p></p>
								    <input type="submit" class="btn btn-success btn btn-block" value="登 录" />
							 	</div>
							</form>
				    		<p></p>
				    		<div class="row" style="text-align:center ">
				    			<div class="col-xs-2"></div>
				    			<div class="col-xs-4">
				    				<div class="text-muted">
				    					<a href="#" style="color: #fff;" data-toggle="modal" data-target="#findPwd">忘记密码</a>
				    				</div>
				    			</div>
				    			<div class="col-xs-4">
				    				<div class="text-muted">
				    					<a href="#" style="color: #fff;" data-toggle="modal" data-target="#myModal">注册</a>
				    				</div>
				    			</div>
				    			<div class="col-xs-2"></div>
				    		</div>
				    	</div>
				      
				  </div>
				</div>
			</div>
			
				  
		</div>
		
		<!--  注册弹出框  -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" style="width: 400px;">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		            <h4 class="modal-title"></h4>注册
		          </div>
		          <div class="modal-body" style="margin-left: 5%;margin-right: 5%;">
			          <!--Form表单部分-->
			          <form onsubmit="return checkNullAndEqual()" role="form" action="<%=basePath %>user/enroll" method="POST" enctype="multipart/form-data">
					  	<div class="form-group">
					    	<div class="text-muted" style="color: #666;">账号</div>
					    	<input type="text" id="user" class="form-control" placeholder="请输入账号..." name="username">
					    	<p></p>
					    	<div class="text-muted" style="color: #666;">邮箱</div>
					    	<input type="text" id="email" class="form-control" placeholder="请输入邮箱..." name="email">
					    	<p></p>
					    	<div class="text-muted" style="color: #666;">密码</div>
					    	<input type="password" id="pwd1" class="form-control" placeholder="请输入密码..." name="password">
					    	<p></p>
					    	<div class="text-muted" style="color: #666;">确认密码</div>
					    	<input type="password" id="pwd2" class="form-control" placeholder="请确认密码...">
					    	<p></p>
					    	<br>
					    	<div class="text-muted" style="color: #666;">
					    		请选择：
							    <label class="radio-inline">
							        <input type="radio" name="type"  value="专家"> 专家
							    </label>
							    <label class="radio-inline">
							    	<input type="radio" name="type"   value="作者" checked> 作者
							    </label>
						    </div>
						    <p></p>
						    <input type="submit" class="btn btn-success btn btn-block" value="确定" />
					 	 </div>
					  </form>	          
		           </div>
		           
		          <div class="modal-footer">
		            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
		          </div>
		       
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
	
		<!--  忘记密码弹出框  -->
		<div class="modal fade" id="findPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" style="width: 400px;">
		        <div class="modal-content">
		          <div class="modal-header">
		            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		            <h4 class="modal-title"></h4>忘记密码
		          </div>
		          <div class="modal-body" style="margin-left: 5%;margin-right: 5%;">
			          <!--Form表单部分-->
			          <form role="form" action="<%=basePath%>user/forgetPwd" method="POST" enctype="multipart/form-data">
					  	<div class="form-group">
					    	<div class="text-muted" style="color: #333;">手机号 :</div>
					    	<input name="phone" type="text" class="form-control" placeholder="请输入账号...">
					    	<p></p>
					    	<div class="text-muted" style="color: #333;">邮箱 :</div>
					    	<input name="email" type="text" class="form-control" placeholder="请输入邮箱...">
					    	<p></p>
					    	<div class="text-muted"  style="color: #333;">
					    		请选择：
						    	<label class="radio-inline">
							        <input type="radio" name="type"  value="editor" checked> 编辑
							    </label>
							    <label class="radio-inline">
							        <input type="radio" name="type"  value="reader"> 专家
							    </label>
							    <label class="radio-inline">
							        <input type="radio" name="type"   value="writer"> 作者
							    </label>
						    </div>
					    	<br>
						    <input type="submit" class="btn btn-success btn btn-block" value="进入" />
					 	 </div>
					  </form>	          
		           </div>
		           
		          <div class="modal-footer">
		            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
		            <!--<button class="btn btn-primary" type="button">提交</button>-->
		          </div>
		       
		        </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		</div>
		<script type="text/javascript">
			function checkNullAndEqual(){
				var email = document.getElementById("email").value;
				var user = document.getElementById("user").value;
				var pwd1 = document.getElementById("pwd1").value;
				var pwd2 = document.getElementById("pwd2").value;
				if(user ==  null || user == ''){
					alert("账号不能为空");
					return false;
				}else if(email ==  null || email == ''){
					alert("邮箱不能为空");
					return false;
				}else if(pwd1 ==  null || pwd1 == ''){
					alert("密码不能为空");
					return false;
				}else if(pwd2 ==  null || pwd2 == ''){
					alert("确认密码不能为空");
					return false;
				}else if(pwd1 != pwd2){
					alert("两次密码不一致，请重新确认");
					return false;
				}
				return true;
			}
		</script>
	</body>
</html>

