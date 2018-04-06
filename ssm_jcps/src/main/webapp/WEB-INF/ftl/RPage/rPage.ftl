<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>专家操作界面</title>
		
		<script src="${base}/resources/js/jquery-1.11.0.min.js"></script>
		<link href="${base}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${base}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
		<script src="${base}/resources/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<!-- 上方导航栏 -->
		<nav class="navbar navbar-default" role="navigation" style="margin: 0px;background-color:#333000;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-10">
						<div class="container-fluid">
							<div class="navbar-header" style="text-align: center;">
								<a class="navbar-brand" href="${base}/user/page?add=1&uId=${user.id}" style="display: block;width: 200px;color: #FFF;">
									计算机期刊审核系统
								</a>
							</div>
							<div>
								<ul class="nav navbar-nav" style="margin-left: 20px;">
									<li class="active"><a href="#" style="color: #FFF;margin:0 5px 0 5px;">信息管理</a></li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/journal/jList?JState=1&uId=${user.id}&currPage=1')" style="color: #FFF;margin:0 5px 0 5px;">期刊审核</a></li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=0&uId=${user.id}&currPage=1')" style="color: #FFF; margin:0 5px 0 5px;">审核记录</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #FFF;margin:0 5px 0 5px;">
											费用记录
											<b class="caret"></b>
										</a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=1')">已付费用</a></li>
											<li><a href="javascript:;" onclick="showAtRight('${base}/fee/queryNoPayFees?uId=${user.id}&currPage=1')">未付费用</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #FFF;margin:0 5px 0 5px;">
											消息管理
											<b class="caret"></b>
										</a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="showAtRight('${base}/message/querySM?uId=${user.id}&currPage=1')">发件列表</a></li>
											<li><a href="javascript:;" onclick="showAtRight('${base}/message/queryRM?uId=${user.id}&currPage=1')">收件列表</a></li>
										</ul>
									</li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/user/aboutSystem?id=${user.id}')" style="color: #FFF;margin:0 5px 0 5px;">审核须知</a></li>
								</ul>
							</div>
							<!--<form class="navbar-form navbar-left" role="search">
						        <div class="form-group">
						            <input type="text" class="form-control" placeholder="Search">
						        </div>
						        <button type="submit" class="btn btn-default">提交</button>
						    </form>-->
							<ul class="nav navbar-nav navbar-right"> 
					            <li><a href="${base}/user/page?add=1&uId=${user.id}" style="color: #FFF;"><span class="glyphicon glyphicon-user"></span> 个人信息</a></li> 
					            <li><a href="${base}/user/page?add=2&uId=${user.id}" style="color: #FFF;"><span class="glyphicon glyphicon-log-in"></span> 切换用户</a></li> 
					        </ul>
						</div>
					</div>
					<div class="col-xs-1"></div>
				</div>
			
			</div>		
		</nav>

		<!-- 业务内容栏 -->
		<div class="container-fluid" style="background-color: #B5B5B5;padding-top:15px ;">
			<div class="row">
				<div class="col-xs-2"></div>
				<div class="col-xs-2" style="background-color: #B5B5B5;padding: 2px;">
					<div class="panel panel-default" style="margin-bottom: 0px;">
						<div class="panel-heading">
							<h3 class="panel-title">
								<span style="color: #A52A2A;">
									<i class="glyphicon glyphicon-list"></i>
								</span>&nbsp;&nbsp;操作菜单
							</h3>
						</div>
						<div class="panel-body">
							<ul id="main-nav" class="nav nav-pills nav-stacked">
								<li class="active">
									<a href="${base}/user/page?add=1&uId=${user.id}">
										<i class="glyphicon glyphicon-th-large"></i> 个人信息
									</a>
								</li>
								<li>
									<a href="#menu1" class="active" class="nav-header collapsed"  data-toggle="collapse">
										<i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;期刊管理
										<span class="pull-right glyphicon glyphicon-chevron-down"></span>
									</a>
									<ul id="menu1" class="nav nav-list secondmenu collapse in">
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/journal/jList?JState=1&uId=${user.id}&currPage=1')">&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-th-list"></i>&nbsp;&nbsp;期刊审核</a>
										</li>
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=0&uId=${user.id}&currPage=1')">
												&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-ok-circle"></i>&nbsp;&nbsp;已核期刊
											</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#menu2" class="nav-header collapsed" data-toggle="collapse">
										<i class="glyphicon glyphicon-comment"></i>&nbsp;&nbsp;消息管理
										<span class="pull-right glyphicon glyphicon-chevron-down"></span>
									</a>
									<ul id="menu2" class="nav nav-list collapse secondmenu" style="height: 0px;">
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/message/querySM?uId=${user.id}&currPage=1')">&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-edit"></i>&nbsp;&nbsp;发件列表</a>
										</li>
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/message/queryRM?uId=${user.id}&currPage=1')">&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;收件列表</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="#menu4" class="nav-header collapsed" data-toggle="collapse">
										<i class="glyphicon glyphicon-calendar"></i>&nbsp;&nbsp;资费管理
										<span class="pull-right glyphicon glyphicon-chevron-down"></span>
									</a>
									<ul id="menu4" class="nav nav-list collapse secondmenu" style="height: 0px;">
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=1')">&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-registration-mark"></i>&nbsp;&nbsp;已付列表</a>
										</li>
										<li>
											<a href="javascript:;" onclick="showAtRight('${base}/fee/queryNoPayFees?uId=${user.id}&currPage=1')">&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-remove-circle"></i>&nbsp;&nbsp;未付列表</a>
										</li>
									</ul>
								</li>
								<li>
									<a href="javascript:;" onclick="showAtRight('${base}/user/queryAllUser?uId=${user.id}&currPage=1')">
										<i class="glyphicon glyphicon-globe"></i>&nbsp;&nbsp;交流沟通
									</a>
								</li>
								<li>
									<a href="javascript:;" onclick="showAtRight('${base}/user/aboutSystem?id=${user.id}')">
										<i class="glyphicon glyphicon-exclamation-sign"></i>&nbsp;&nbsp;审核须知
									</a>
								</li>
							</ul>
						</div>				
					</div>
					
				
				</div>

				<div class="col-xs-6" id="content" style="text-align: left;background-color: #B5B5B5;padding-top: 2px;">
					
					<ol class="breadcrumb">
					    <li>首页</li>
					    <li class="active">个人信息</li>
					</ol>
				
					<div class="panel-group" id="accordion">
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" 
									   href="#info" style="width: 100%;display: block;text-decoration: none;">
										<span style="color: #A52A2A;">
											<i class="glyphicon glyphicon-user"></i>
										</span> &nbsp;&nbsp;个人信息
									</a>
								</h4>
							</div>
							<div id="info" class="panel-collapse collapse in">
								<div class="panel-body">
							    	<table class="table table-bordered">
									    <tbody>
										    <tr>
										      	<td style="width: 25%;background-color: #F2F2F2">姓名 :</td>
										      	<td style="width: 25%">${user.realName}</td>
										      	<td style="width: 25%;background-color: #F2F2F2">邮箱 :</td>
										      	<td>${user.email}</td>
										    </tr>
										    <tr>
										      	<td style="width: 25%;background-color: #F2F2F2">身份 :</td>
										      	<td>${user.type}</td>
										      	<td style="width: 25%;background-color: #F2F2F2">手机号 :</td>
										      	<td>${user.phone}</td>
										    </tr>
										    <tr>
										      	<td style="width: 25%;background-color: #F2F2F2">银行卡号 :</td>
										     	<td>${user.bankCard}</td>
										     	<td style="width: 25%;background-color: #F2F2F2">性别 :</td>
										      	<td>${user.sex}</td>
										    </tr>
										    <tr>
										    	<td></td>
										      	<td colspan="2">
										      		<input type="submit" class="btn btn-success btn btn-block" 
										      			data-toggle="collapse" data-parent="#accordion" 
										      			data-target="#menu" value="信息操作"/>
										      	</td>
										      	<td></td>
										    </tr>
									    </tbody>
									</table>
								</div>
							</div>
						
						</div>
					
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion" 
									   href="#menu" style="width: 100%;display: block;text-decoration: none;">
										<span style="color: #A52A2A;">
											<i class="glyphicon glyphicon-cog"></i>
										</span> &nbsp;&nbsp;信息操作
									</a>
								</h4>
							</div>
							<div id="menu" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="container-fluid" style="margin-top: 15px;">
										<div class="panel-group" id="change">
											<div class="row">
												
												<div class="col-xs-6" style="padding-left: 15px;padding-right: 10px;">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<a data-toggle="collapse" data-parent="#change" 
																   href="#collapseOne" style="width: 100%;display: block;text-decoration: none;">
																	<span style="color: #A52A2A;">
																		<i class="glyphicon glyphicon-edit"></i>
																	</span> &nbsp;&nbsp;更新信息
																</a>
															</h4>
														</div>
														<div id="collapseOne" class="panel-collapse collapse in">
															<div class="panel-body">
														    	<form action="${base}/user/update?id=${user.id}" method="POST" enctype="multipart/form-data">
														    		<div class="text-muted" style="color: #666;">姓名:</div>
															    	<input type="text" class="form-control" placeholder="请输入真实姓名..." name="realName" value="${user.realName}">
															    	<p></p>   
															    	<div class="text-muted" style="color: #666;">邮箱 :</div>
															    	<input type="text" class="form-control" placeholder="请输入邮箱..." name="email" value="${user.email}">
															    	<p></p>
															    	<div class="text-muted" style="color: #666;">银行卡号 :</div>
															    	<input type="text" class="form-control" placeholder="请输入银行卡号..." name="bankCard" value="${user.bankCard}">
															    	<p></p>
															    	<div class="text-muted" style="color: #666;">手机号 :</div>
															    	<input type="text" class="form-control" placeholder="请输入手机号..." name="phone" value="${user.phone}">
															    	<p></p>
															    	<div class="text-muted" style="color: #666;">
															    		性别：
																    	<label class="radio-inline">
																	        <input type="radio" name="sex"  value="男" checked> 男
																	    </label>
																	    <label class="radio-inline">
																	        <input type="radio" name="sex"  value="女"> 女
																	    </label>
																    </div>
															    	<br/>
															    	<input type="submit" class="btn btn-success btn btn-block" value="更新信息" />
															    </form>
															</div>
														</div>
													</div>
												</div>
												
												<div class="col-xs-6" style="padding-left: 10px;padding-right: 15px;">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<a data-toggle="collapse" data-parent="#change" 
																   href="#collapseTwo" style="width: 100%;display: block;text-decoration: none;">
																	<span style="color: #A52A2A;">
																		<i class="glyphicon glyphicon-lock"></i>
																	</span> &nbsp;&nbsp;账号密码
																</a>
															</h4>
														</div>
														<div id="collapseTwo" class="panel-collapse collapse">
															<div class="panel-body">
																<form action="${base}/user/updateUP?id=${user.id}" method="POST" enctype="multipart/form-data">
															    	<div class="text-muted" style="color: #666;">账号 :</div>
															    	<input value="${user.username}" name="username" type="text" class="form-control" placeholder="请输入账号..." name="username">
															    	<p></p>
															    	<div class="text-muted" style="color: #666;">密码 :</div>
															    	<input value="${user.password}"  name="password" type="password" class="form-control" placeholder="请输入密码...">
															    	<p></p>
															    	<div class="text-muted" style="color: #666;">确认密码 :</div>
															    	<input value="${user.password}"  type="password" class="form-control" placeholder="请确认密码...">
															    	<br/>
															    	<input type="submit" class="btn btn-success btn btn-block" value="重新登录" />
															    </form>
															</div>
														</div>
													</div>
			
												</div>
											</div>
										</div>
										
				
									</div>
							    	
								</div>
							</div>
						
							
						</div>
						
					</div>
	
				</div>

				<div class="col-xs-2"></div>
				
			</div>
		</div>
		
		
		
		<!-- 
			下方信息栏 
				————使用样式："position: fixed;bottom:0px;"使底部栏跟着浏览器底部
		-->
		<div style="position: fixed;bottom:0px;width: 100%;background-color:#333000;">
			<div style="text-align: center;">
				<p style="color: #FFFFFF;margin: 5px;font-size: 12px;">该系统仅用于武汉轻工大学毕业生毕业设计</p>
				<p style="color: #FFFFFF;margin: 5px;font-size: 12px;">可使用https://euphoria.net.cn:8080/ssm_jsps访问并测试，详情可联系15549472837，感谢使用。</p>
			</div>
		</div>
	
	
		<script type="text/javascript">
			function showAtRight(url) {
            var xmlHttp;
            
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp=new XMLHttpRequest();    //创建 XMLHttpRequest对象
            }
            else {
                // code for IE6, IE5
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
        
            xmlHttp.onreadystatechange=function() {        
                //onreadystatechange — 当readystate变化时调用后面的方法
                
                if (xmlHttp.readyState == 4) {
                    //xmlHttp.readyState == 4    ——    finished downloading response
                    
                    if (xmlHttp.status == 200) {
                        //xmlHttp.status == 200        ——    服务器反馈正常            
                        
                        document.getElementById("content").innerHTML=xmlHttp.responseText;    //重设页面中id="content"的div里的内容
                        executeScript(xmlHttp.responseText);    //执行从服务器返回的页面内容里包含的JavaScript函数
                    }
                    //错误状态处理
                    else if (xmlHttp.status == 404){
                        alert("出错了☹   （错误代码：404 Not Found），……！"); 
                        /* 对404的处理 */
                        return;
                    }
                    else if (xmlHttp.status == 403) {  
                        alert("出错了☹   （错误代码：403 Forbidden），……"); 
                        /* 对403的处理  */ 
                        return;
                    }
                    else {
                        alert("出错了☹   （错误代码：" + request.status + "），……"); 
                        /* 对出现了其他错误代码所示错误的处理   */
                        return;
                    }   
                } 
                    
              }
            
            //把请求发送到服务器上的指定文件（url指向的文件）进行处理
            xmlHttp.open("GET", url, false);        //true表示异步处理
            xmlHttp.send();
        } 
		</script>
	</body>
</html>
