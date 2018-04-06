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
		<li>首页</li>
		<li>期刊列表</li>
		<li class="active">未核期刊</li>
	</ol>
	<div class="panel-group" id="accordion">	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#wInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-user"></i>
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
								<th>修改</th>
								<th>删除</th>
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
									<a href="javascript:showAtRight('${base}/journal/deleteJournalById?info=1&id=${journal.id}&uId=${user.id}&currPage=${jPageBean.currPage}&num=${i}');">
										<i class="glyphicon glyphicon-edit"></i>
									</a>
								</td>
								<td>
									<a href="javascript:showAtRight('${base}/journal/deleteJournalById?info=1&id=${journal.id}&uId=${user.id}&currPage=${jPageBean.currPage}&num=${i}');">
										<i class="glyphicon glyphicon-remove-circle"></i>
									</a>
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
									<a href="javascript:showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=1');">首页</a>
								</li>
							</#if>
							
							<#list 1..jPageBean.totalPage as n>
								<li><a href="javascript:showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=${n}');">${n}</a></li>
							</#list>
							<li>
								<a href="javascript:showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=${jPageBean.totalPage}');">尾页</a>
							</li>
						</ul>
					</#if>
					<#if jPageBean.totalPage gt 2>
						<#assign i=1>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if jPageBean.currPage gt 1>
							<li><a href="javascript:showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=${jPageBean.currPage+i}');">上一页</a></li>
							<#else>
							<li><a href="#">上一页</a></li>
							</#if> 
							<li><a href="#">${jPageBean.currPage}</a></li>
							<#if jPageBean.currPage == jPageBean.totalPage>
							<li><a href="#">下一页</a></li>
							<#else>
							<li><a href="javascript:showAtRight('${base}/journal/queryJournalListByUid?mark=1&uId=${user.id}&currPage=${jPageBean.currPage-i}');">下一页</a></li>
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