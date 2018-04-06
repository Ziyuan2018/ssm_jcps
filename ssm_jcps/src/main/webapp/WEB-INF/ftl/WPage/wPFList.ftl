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
		<li><a href="#">资费管理</a></li>
		<li class="active">已付列表</li>
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
					</span> &nbsp;&nbsp;资费列表
					</a>
				</h3>
			</div>
			<div id="no_rInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover" style="margin-bottom: 0px">
						<thead>
							<tr>
								<th>作者</th>
								<th>期刊名</th>
								<th>审核费</th>
								<th>版本费</th>
								<th>总金额</th>
								<th>支付情况</th>
								<th>更多</th>
							</tr>
						</thead>
						<tbody>
							<#assign i=0>
							<#if fPageBean?exists>
							<#list fPageBean.list as fee>
							<#assign i=i+1>
							<tr>
								<td>${fee.writerName}</td>
								<td>${fee.journalName}</td>
								<td>${fee.vettingFee}</td>
								<td>${fee.versionFee}</td>
								<td>${fee.total}</td>
								<td>${fee.state?string('完成支付', '未支付')}</td>
								<td>
									<div class="dropdown" style="padding-left: 8px;">

										<a href="#" class="dropdown-toggle" id="dropdownMenu1"
											data-toggle="dropdown"> <i
											class="glyphicon glyphicon-chevron-down"></i>
										</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="#">期刊详情</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:showAtRight('${base}/message/answerM?uId=${user.id}&mId=${fee.readerId}');">消息留言</a></li>
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
					<#if fPageBean.totalPage != 0>
					<#if fPageBean.totalPage <= 2>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if fPageBean.currPage == 1>
							<li><a href="#" class="active">首页</a></li> 
							<#else>
							<li><a href="javascript:showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=1');">首页</a>
							</li> 
							</#if> 
							<#list 1..fPageBean.totalPage as n>
							<li><a href="javascript:showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=${n}');">${n}</a></li>
							</#list>
							<li><a href="javascript:showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=${fPageBean.totalPage}');">尾页</a>
							</li>
						</ul>
					</#if> 
					<#if fPageBean.totalPage gt 2>
					<#assign i=1>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if fPageBean.currPage gt 1>
							<li><a href="javascript:showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=${fPageBean.currPage-i}');">上一页</a></li>
							<#else>
							<li><a href="#">上一页</a></li>
							</#if> 
							<li><a href="#">${fPageBean.currPage}</a></li>
							<#if fPageBean.currPage == fPageBean.totalPage>
							<li><a href="#">下一页</a></li>
							<#else>
							<li><a href="javascript:showAtRight('${base}/fee/queryPayFees?uId=${user.id}&currPage=${fPageBean.currPage+i}');">下一页</a></li>
							</#if>
						</ul>
					</#if>
					<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
					<li><a href="#" class="active">第</a></li>
					<li><a href="#">${fPageBean.currPage} / ${fPageBean.totalPage}</a></li>
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