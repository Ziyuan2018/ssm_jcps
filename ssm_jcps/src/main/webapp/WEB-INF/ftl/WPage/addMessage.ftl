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
		<li><a href="#"></a>交流沟通</li>
		<li class="active">添加消息</li>
	</ol>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#rInfo"
					style="width: 100%;display: block;text-decoration: none;"> <span
					style="color: #A52A2A;"> <i
						class="glyphicon glyphicon-user"></i>
				</span> &nbsp;&nbsp;发送消息
				</a>
			</h3>
		</div>
		<div id="no_rInfo" class="panel-collapse collapse in">
			<div class="panel-body" style="text-align:center;padding-top:5px;">
				<form action="${base}/message/insertM?uId=${user.id}" method="POST" enctype="multipart/form-data">
				<table class="table table-bordered" style="width:400px;margin:0 auto;">
					<caption>填写消息信息</caption>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">发件人：</td>
						<td><input type="text" class="form-control" value="${user.realName}" name="sName"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">收件人：</div></td>
						<td><input type="text" class="form-control" value="${rUser.realName}" name="rName"></td>
					</tr>
					<tr>
						<td style="width: 25%;background-color: #F2F2F2">消息内容:</div></td>
						<td><textarea class="form-control" rows="3" name="content"></textarea></td>
					</tr>
					<input type="hidden" name="addresser" value="${addresser}"/> 
					<input type="hidden" name="addressee" value="${addressee}"/>
					<tr>
						<td colspan="2">
							<input type="submit" class="btn btn-success btn btn-block" value="发送" />
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>