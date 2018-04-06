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
		<li class="active">审核期刊</li>
	</ol>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#rInfo"
					style="width: 100%;display: block;text-decoration: none;"> <span
					style="color: #A52A2A;"> <i
						class="glyphicon glyphicon-th-list"></i>
				</span> &nbsp;&nbsp;期刊审核
				</a>
			</h3>
		</div>
		<div id="no_rInfo" class="panel-collapse collapse in">
			<div class="panel-body" style="text-align:center;padding-top:5px;">
				<form action="${base}/journal/updateJournal?uId=${user.id}" method="POST" enctype="multipart/form-data">
				<table class="table table-bordered" style="width:400px;margin:0 auto;">
					<caption>填写审核信息</caption>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">作者：</td>
						<td><input type="text" class="form-control" value="${journal.writerName}" name="writerName"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">期刊名：</div></td>
						<td><input type="text" class="form-control" value="${journal.name}" name="name"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">关键词：</div></td>
						<td><input type="text" class="form-control" name="keyword" value="${journal.keyword}"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">审核专家：</div></td>
						<td><input type="text" class="form-control" value="${user.realName}" name="readerName"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">期刊建议:</div></td>
						<td><textarea class="form-control" rows="3" name="proposal"></textarea></td>
					</tr>
					<input type="hidden" name="id" value="${journal.id}"/>
					<input type="hidden" name="writerId" value="${journal.writerId}"/>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-success btn btn-block" value="审核完成" />
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>