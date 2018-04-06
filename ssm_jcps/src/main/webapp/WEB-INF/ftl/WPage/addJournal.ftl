<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>作者操作界面</title>
		
		<script src="${base}/resources/js/jquery-1.11.0.min.js"></script>
		<link href="${base}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${base}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
		<script src="${base}/resources/bootstrap/js/bootstrap.min.js"></script>
	</head>
	<body>
		<nav class="navbar navbar-default" role="navigation" style="margin: 0px;background-color:#333000;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-xs-1"></div>
					<div class="col-xs-10">
						<div class="container-fluid">
							<div class="navbar-header" style="text-align: center;">
								<a class="navbar-brand" href="${base}/user/page?add=1&uId=${user.id}" style="display: block;width: 200px;color: #FFF;">
									计算机期刊投递系统
								</a>
							</div>
							<div>
								<ul class="nav navbar-nav" style="margin-left: 20px;">
									<li class="active"><a href="${base}/user/page?add=1&uId=${user.id}" style="color: #FFF;margin:0 5px 0 5px;">信息管理</a></li>
									<li><a href="${base}/journal/addJournal?uId=${user.id}" style="color: #FFF;margin:0 5px 0 5px;">投递期刊</a></li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=1')" style="color: #FFF;margin:0 5px 0 5px;">未核期刊</a></li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=2&uId=${user.id}&currPage=1')" style="color: #FFF;margin:0 5px 0 5px;">已核期刊</a></li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #FFF;margin:0 5px 0 5px;">
											费用管理
											<b class="caret"></b>
										</a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=1')">已付费用</a></li>
											<li><a href="javascript:;" onclick="showAtRight('${base}/fee/queryNoPayFees?uId=${user.id}&currPage=1')">未付费用</a></li>
										</ul>
									</li>
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #FFF; margin:0 5px 0 5px;">
											消息管理
											<b class="caret"></b>
										</a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="showAtRight('${base}/message/queryRM?uId=${user.id}&currPage=1')">收件列表</a></li>
											<li><a href="javascript:;" onclick="showAtRight('${base}/message/querySM?uId=${user.id}&currPage=1')">发件列表</a></li>
										</ul>
									</li>
									<li><a href="javascript:;" onclick="showAtRight('${base}/user/queryAllUser?uId=${user.id}&currPage=1')" style="color: #FFF;margin:0 5px 0 5px;">交流沟通</a></li>
								</ul>
							</div>
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
		<div class="container-fluid" style="background-color: #B5B5B5;padding-top:18px;">
			<div class="row">
				<div class="col-xs-2"></div>
				<div class="col-xs-8">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-3" style="padding-left: 0px;padding-right:0px;">
								<div class="panel panel-default" style="margin-bottom: 0px; font-size:14px">
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
												<a href="#">
													<i class="glyphicon glyphicon-th-large"></i> 首页
												</a>
											</li>
											<li>
												<a href="${base}/journal/addJournal?uId=${user.id}">
													<i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;&nbsp;&nbsp;期刊投递<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=2&uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-ok-circle"></i>&nbsp;&nbsp;&nbsp;&nbsp;已核期刊<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-record"></i>&nbsp;&nbsp;&nbsp;&nbsp;未核期刊<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/message/queryRM?uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-send"></i>&nbsp;&nbsp;&nbsp;&nbsp;已收信件<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
													
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/message/querySM?uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-envelope"></i>&nbsp;&nbsp;&nbsp;&nbsp;已发信件<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
													
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-saved"></i>&nbsp;&nbsp;&nbsp;&nbsp;已付费用<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
													
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="javascript:;" onclick="showAtRight('${base}/fee/queryNoPayFees?uId=${user.id}&currPage=1')">
													<i class="glyphicon glyphicon-usd"></i>&nbsp;&nbsp;&nbsp;&nbsp;未付费用<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
													
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="#">
													<i class="glyphicon glyphicon-info-sign"></i>&nbsp;&nbsp;&nbsp;&nbsp;投稿须知<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
												</a>
											</li>
											<li style="margin-top:0px">
												<a href="#">
													<i class="glyphicon glyphicon-leaf"></i>&nbsp;&nbsp;&nbsp;&nbsp;关于系统<i style="float:right" class="glyphicon glyphicon-hand-right"></i>
												</a>
											</li>
										</ul>
									</div>				
								</div>
					
							</div>
							
							<div class="col-xs-9" style="padding-right: 0px;" id="content">
								<ol class="breadcrumb">
									<li><a href="#">首页</a></li>
									<li><a href="#">期刊管理</a></li>
									<li class="active">上传期刊</li>
								</ol>
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#rInfo"
												style="width: 100%;display: block;text-decoration: none;"> <span
												style="color: #A52A2A;"> <i
													class="glyphicon glyphicon-circle-arrow-up"></i>
											</span> &nbsp;&nbsp;上传期刊
											</a>
										</h3>
									</div>
									<div id="no_rInfo" class="panel-collapse collapse in">
										<div class="panel-body" style="text-align:center;padding-bottom:20px;padding-top:5px;">
											<form action="${base}/journal/insertJournal?uId=${user.id}" method="POST" enctype="multipart/form-data">
												<table class="table table-bordered" style="width:450px;margin:0 auto;">
													<caption>填写期刊信息</caption><span style="color: red;">${state}</span>
													<tr>
														<td style="width: 25%;background-color: #F2F2F2">作者：</td>
														<td><input type="text" class="form-control" value="${user.realName}" name="writerName"></td>
													</tr>
													<tr>
														<td style="width: 25%;background-color: #F2F2F2">期刊名：</td>
														<td><input type="text" class="form-control" value="" name="name"></td>
													</tr>
													<tr>
														<td style="width: 25%;background-color: #F2F2F2">关键词：</div></td>
														<td><input type="text" class="form-control" value="" name="keyword"></td>
													</tr>
													<tr>
														<td style="width: 25%;background-color: #F2F2F2">期刊文件:</div></td>
														<td><input type="file" name="file"></td>
													</tr>
													<input type="hidden" name="writerId" value="${user.id}">
													<tr>
														<td colspan="2">
															<input type="submit" value="上传" class="btn btn-success btn btn-block"/>
														</td>
													</tr>
												</table>
											</form>
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