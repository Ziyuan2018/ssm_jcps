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
		<li><a href="#">期刊审核</a></li>
		<li class="active">未核期刊</li>
	</ol>
	<div class="panel-group" id="accordion">	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#wInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-th-list"></i>
					</span> &nbsp;&nbsp;未核期刊
					</a>
				</h3>
			</div>
			<div id="no_wInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover" style="margin-bottom: 0px">
						<thead>
							<tr>
								<th>作者</th>
								<th>期刊名</th>
								<th>上传时间</th>
								<th>关键词</th>
								<th>审核状态</th>
								<th>下载</th>
								<th>审核</th>
							</tr>
						</thead>
						<tbody>
							<#assign i=0>
							<#if jPageBean?exists>
							<#list jPageBean.list as journal>
							<#assign i=i+1>
							<tr>
								<td>${journal.writerName}</td>
								<td>${journal.name}</td>
								<td>${journal.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
								<td>${journal.keyword}</td>
								<td>${journal.status}</td>
								<td>
									<a href="${base}/journal/download?filename=${journal.fileName}"
									style="padding-left: 8px;"> 
										<i class="glyphicon glyphicon-download-alt"></i>
									</a>
								</td>
								<td>
									<div class="dropdown" style="padding-left: 8px;">
										<a href="#" class="dropdown-toggle" id="dropdownMenu1"
											data-toggle="dropdown"> 
											<i class="glyphicon glyphicon-edit"></i>
										</a>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:showAtRight('${base}/journal/review?uId=${user.id}&jId=${journal.id}');">期刊批阅</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="javascript:showAtRight('${base}/message/answerM?uId=${user.id}&mId=${journal.writerId}');">消息留言</a></li>
										</ul>
									</div>
								</td>
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
					<#if jPageBean.totalPage != 0>
					<#if jPageBean.totalPage <= 2>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if jPageBean.currPage == 1>
								<li>
									<a href="#" class="active">首页</a>
								</li>
							<#else>
							<li>
									<a href="javascript:showAtRight('${base}/journal/jList?JState=1&currPage=1')&uId=${user.id}');">首页</a>
								</li>
							</#if>
							
							<#list 1..jPageBean.totalPage as n>
								<li><a href="javascript:showAtRight('${base}/journal/jList?JState=1&currPage=${n}&uId=${user.id}');">${n}</a></li>
							</#list>
							<li>
								<a href="javascript:showAtRight('${base}/journal/jList?JState=1&currPage=${jPageBean.totalPage}&uId=${user.id}');">尾页</a>
							</li>
						</ul>
					</#if>
					<#if jPageBean.totalPage gt 2>
						<#assign i=1>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if jPageBean.currPage gt 1>
							<li><a href="javascript:showAtRight('${base}/journal/jList?JState=1&currPage=${jPageBean.currPage-i}&uId=${user.id}');">上一页</a></li>
							<#else>
							<li><a href="#">上一页</a></li>
							</#if> 
							<li><a href="#">${jPageBean.currPage}</a></li>
							<#if jPageBean.currPage == jPageBean.totalPage>
							<li><a href="#">下一页</a></li>
							<#else>
							<li><a href="javascript:showAtRight('${base}/journal/jList?JState=1&currPage=${jPageBean.currPage+i}&uId=${user.id}');">下一页</a></li>
							</#if>
						</ul>
					</#if>
					<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
						<li><a href="#" class="active">第</a></li>
						<li><a href="#">${jPageBean.currPage} / ${jPageBean.totalPage}</a></li>
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