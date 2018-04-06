<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title></title>
	<script src="${base}/resources/js/jquery-1.11.0.min.js"></script>
	<link href="${base}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${base}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="${base}/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<ol class="breadcrumb">
		<li><a href="#">首页</a></li>
		<li><a href="#">交流沟通</a></li>
		<li class="active">用户列表</li>
	</ol>
	<div class="panel-group" id="accordion">	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#wInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-globe"></i>
					</span> &nbsp;&nbsp;用户信息
					</a>
				</h3>
			</div>
			<div id="no_wInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover" style="margin-bottom: 0px">
						<thead>
							<tr>
								<th>姓名</th>
								<th>身份</th>
								<th>性别</th>
								<th>手机号</th>
								<th>邮箱</th>
								<th>发消息</th>
							</tr>
						</thead>
						<tbody>
							<#assign i=0>
							<#if uPageBean?exists>
							<#list uPageBean.list as User>
							<#assign i=i+1>
							<tr>
								<td>${User.realName}</td>
								<td>${User.type}</td>
								<td>${User.sex}</td>
								<td>${User.phone}</td>
								<td>${User.email}</td>
								<td><a href="javascript:showAtRight('${base}/message/answerM?uId=${user.id}&mId=${User.id}');"
									style="padding-left: 8px;"> <i
										class="glyphicon glyphicon-envelope"></i>
								</a></td>
								
							</tr>
							</#list>
							<tr height="2px">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<div style="text-align:center;">
					<#if uPageBean.totalPage != 0>
					<#if uPageBean.totalPage <= 2>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if uPageBean.currPage == 1>
								<li>
									<a href="#" class="active">首页</a>
								</li>
							<#else>
							<li>
									<a href="javascript:showAtRight('${base}/user/queryAllUser?currPage=1')&uId=${user.id};">首页</a>
								</li>
							</#if>
							
							<#list 1..uPageBean.totalPage as n>
								<li><a href="javascript:showAtRight('${base}/user/queryAllUser?currPage=${n}&uId=${user.id}');">${n}</a></li>
							</#list>
							<li>
								<a href="javascript:showAtRight('${base}/user/queryAllUser?currPage=${uPageBean.totalPage}&uId=${user.id}');">尾页</a>
							</li>
						</ul>
					</#if>
					<#if uPageBean.totalPage gt 2>
						<#assign i=1>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if uPageBean.currPage gt 1>
							<li><a href="javascript:showAtRight('${base}/user/queryAllUser?currPage=${uPageBean.currPage-i}&uId=${user.id}');">上一页</a></li>
							<#else>
							<li><a href="#">上一页</a></li>
							</#if> 
							<li><a href="#">${uPageBean.currPage}</a></li>
							<#if uPageBean.currPage == uPageBean.totalPage>
							<li><a href="#">下一页</a></li>
							<#else>
							<li><a href="javascript:showAtRight('${base}/user/queryAllUser?currPage=${uPageBean.currPage+i}&uId=${user.id}');">下一页</a></li>
							</#if>
						</ul>
						</#if>
						<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
							<li><a href="#" class="active">第</a></li>
							<li><a href="#">${uPageBean.currPage} / ${uPageBean.totalPage}</a></li>
							<li><a href="#" class="active">页</a></li>
						</ul>
						<#else>
						<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
							<li><a href="#" class="active">第</a></li>
							<li><a href="#">0 / 0</a></li>
							<li><a href="#" class="active">页</a></li>
						</ul>
						</#if>
					</#if>
				</div>
			</div>
			
		</div>
	
	</div>
	
</div>

</body>
</html>