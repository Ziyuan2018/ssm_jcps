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
		<li><a href="#">用户管理</a></li>
		<li class="active">专家信息</li>
	</ol>
	<div class="panel-group" id="accordion">
		<!-- 专家信息 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#rInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-user"></i>
					</span> &nbsp;&nbsp;专家信息
					</a>
				</h3>
			</div>
			<div id="no_rInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover" style="margin-bottom: 0px">
						<thead>
							<tr>
								<th>姓名</th>
								<th>身份</th>
								<th>手机号</th>
								<th>邮箱</th>
								<th>银行卡号</th>
								<th>删除</th>
								<th>更多</th>
							</tr>
						</thead>
						<tbody>
							<#assign i=0>
							<#if rPageBean?exists>
							<#list rPageBean.list as user>
							<#assign i=i+1>
							<tr>
								<td>${user.realName}</td>
								<td>${user.type}</td>
								<td>${user.phone}</td>
								<td>${user.email}</td>
								<td>${user.bankCard}</td>
								<td><a
									href="javascript:showAtRight('${base}/user/delete?num=${i}&currPage=${rPageBean.currPage}&id=${user.id}');"
									style="padding-left: 8px;"> <i
										class="glyphicon glyphicon-remove-circle"></i>
								</a></td>
								<td>
									<div class="dropdown" style="padding-left: 8px;">

										<a href="#" class="dropdown-toggle" id="dropdownMenu1"
											data-toggle="dropdown"> <i
											class="glyphicon glyphicon-chevron-down"></i>
										</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:;" onclick="showAtRight('${base}/journal/queryJournalListByUid?mark=3&uId=${user.id}&currPage=1')">已阅期刊</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:;" onclick="showAtRight('${base}/fee/RAWFeesDetailById?mId=${user.id}&uId=${User.id}&currPage=1')">费用信息</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:showAtRight('${base}/message/answerM?uId=${User.id}&mId=${user.id}');">消息留言</a></li>
										</ul>
									</div>
								</td>
							</tr>
							</#list>
							<tr>
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
						<#if rPageBean.totalPage != 0>
						<#if rPageBean.totalPage <= 2>
							<ul class="pagination" style="padding: 0px;margin:0;">
								<#if rPageBean.currPage == 1>
								<li><a href="#" class="active">首页</a></li> 
								<#else>
								<li><a href="javascript:showAtRight('${base}/user/queryUser?type=专家&currPage=1&uId=${User.id}');">首页</a>
								</li> 
								</#if> 
								<#list 1..rPageBean.totalPage as n>
								<li><a href="javascript:showAtRight('${base}/user/queryUser?type=专家&currPage=${n}&uId=${User.id}');">${n}</a></li>
								</#list>
								<li><a href="javascript:showAtRight('${base}/user/queryUser?type=专家&currPage=${rPageBean.totalPage}&uId=${User.id}');">尾页</a>
								</li>
							</ul>
						</#if> 
						<#if rPageBean.totalPage gt 2>
						<#assign i=1>
							<ul class="pagination" style="padding: 0px;margin:0;">
								<#if rPageBean.currPage gt 1>
								<li><a href="javascript:showAtRight('${base}/user/queryUser?type=专家&currPage=${rPageBean.currPage-i}&uId=${User.id}');">上一页</a></li>
								<#else>
								<li><a href="#">上一页</a></li>
								</#if> 
								<li><a href="#">${rPageBean.currPage}</a></li>
								<#if rPageBean.currPage == rPageBean.totalPage>
								<li><a href="#">下一页</a></li>
								<#else>
								<li><a href="javascript:showAtRight('${base}/user/queryUser?type=专家&currPage=${rPageBean.currPage+i}&uId=${User.id}');">下一页</a></li>
								</#if>
							</ul>
						</#if>
							<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
							<li><a href="#" class="active">第</a></li>
							<li><a href="#">${rPageBean.currPage} / ${rPageBean.totalPage}</a></li>
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