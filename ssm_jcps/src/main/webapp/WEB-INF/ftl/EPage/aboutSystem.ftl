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
		<li><a href="#">关于系统</a></li>
		<li class="active">系统详情</li>
	</ol>
	<div class="panel-group" id="accordion">	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#wInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-leaf"></i>
					</span> &nbsp;&nbsp;关于系统
					</a>
				</h3>
			</div>
			<div id="no_wInfo" class="panel-collapse collapse in">
				<div class="panel-body" style="padding:20px 50px;">
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						介于本管理系统基本可以操作所有数据信息，
						所以编剧在进行核心数据操作时，应注意相关数据的必要性，
						如果出现需要数据恢复的情况，请及时和管理员联系。&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="label label-danger">时刻注意</span>
					</p>
					<br/>
					<p></p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						编辑可以通过本管理系统查阅到所有信件消息（不光包括自己），
						所以希望编辑在不需要查阅所有交流记录时，不要私自查阅专家和作者的消息记录，
						以及随便删除信件。&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="label label-warning">尊重隐私</span>
					</p>
					<br/>
					<p></p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
						希望该系统可以为编辑以及专家作者提供一个方便的期刊处理软件，
						遇到任何技术和非技术问题通过以下联系方式联系我们。
						&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-info">感谢使用</span></p>
					</p>
					<br/>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<span class="label label-success">手机号：</span>&nbsp;&nbsp;155-4947-2837</p>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-primary">邮箱号：</span>&nbsp;&nbsp;fenghao2018@foxmail.com</p>
					
				</div>
			</div>
			
		</div>
	
	</div>
	
</div>

</body>
</html>