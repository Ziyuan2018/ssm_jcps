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
		<li><a href="#"></a>费用管理</li>
		<li class="active">费用详情</li>
	</ol>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#rInfo"
					style="width: 100%;display: block;text-decoration: none;"> <span
					style="color: #A52A2A;"> <i
						class="glyphicon glyphicon-circle-arrow-up"></i>
				</span> &nbsp;&nbsp;费用详情
				</a>
			</h3>
		</div>
		<div id="no_rInfo" class="panel-collapse collapse in">
			<div class="panel-body" style="text-align:center;padding-bottom:20px;padding-top:5px;">
				<form action="#" method="POST" enctype="multipart/form-data">
					<table class="table table-bordered" style="width:450px;margin:0 auto;">
						<caption>对应期刊的费用信息</caption>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">作者：</td>
							<td><input type="text" class="form-control" value="${fee.writerName}"></td>
						</tr>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">审核费：</td>
							<td><input type="text" class="form-control" value="${fee.vettingFee}"></td>
						</tr>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">审核专家：</div></td>
							<td><input type="text" class="form-control" value="${fee.readerName}"></td>
						</tr>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">版本费：</div></td>
							<td><input type="text" class="form-control" value="${fee.versionFee}"></td>
						</tr>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">总费用：</div></td>
							<td><input type="text" class="form-control" value="${fee.total}"></td>
						</tr>
						<tr>
							<td style="width: 25%;background-color: #F2F2F2">支付情况：</div></td>
							<td><input type="text" class="form-control" value="${fee.state?string('完成支付', '未支付')}"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>

	
</body>
</html>