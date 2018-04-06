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
		<li><a href="#">消息管理</a></li>
		<li class="active">信件操作</li>
	</ol>
	<div class="panel-group" id="accordion">	
		<!-- 作者信息 -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" href="#wInfo"
						style="width: 100%;display: block;text-decoration: none;"> <span
						style="color: #A52A2A;"> <i
							class="glyphicon glyphicon-envelope"></i>
					</span> &nbsp;&nbsp;信件列表
					</a>
				</h3>
			</div>
			<div id="no_wInfo" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table table-hover" style="margin-bottom: 0px">
						<thead>
							<tr>
								<th>发件人</th>
								<th>收件人</th>
								<th>发件时间</th>
								<th>阅读标记</th>
								<th>查看</th>
								<th>删除</th>
							</tr>
						</thead>
						<tbody>
							<#assign i=0>
							<#if AMPageBean?exists>
							<#list AMPageBean.list as message>
							<#assign i=i+1>
							<tr>
								<td>${message.sName}</td>
								<td>${message.rName}</td>
								<td>${message.createTime?string('yyyy-MM-dd HH:mm:ss')}</td>
								<td>${message.mark}</td>
								<td>
									<a href="#" style="padding-left: 8px;" data-toggle="modal" data-target="#message${i}"> 
										<i class="glyphicon glyphicon-list-alt"></i>
									</a>
								</td>
								<td>
									<a href="javascript:showAtRight('${base}/message/deleteAM?num=${i}&currPage=${AMPageBean.currPage}&mId=${message.id}&uId=${user.id}');"
										style="padding-left: 8px;"> 
										<i class="glyphicon glyphicon-remove-circle"></i>
									</a>
								</td>
								<!--  消息详情弹出框  -->
								<div class="modal fade" id="message${i}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog" style="width: 400px;margin-top:120px;">
								        <div class="modal-content">
								          <div class="modal-header">
								            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								            <h4 class="modal-title"></h4>消息内容
								          </div>
								          <div class="modal-body" style="margin-left: 5%;margin-right: 5%;">
									          <!--Form表单部分-->
									          <form role="form" action="#" method="POST" enctype="multipart/form-data">
											  	<div class="form-group">
											    	<div class="text-muted" style="color: #666;">发件人:</div>
											    	<input type="text" class="form-control" value="${message.sName}" name="sName">
											    	<p></p>
											    	<div class="text-muted" style="color: #666;">收件人:</div>
											    	<input type="text" class="form-control" value="${message.rName}" name="rName">
											    	<p></p>
											    	<div class="text-muted" style="color: #666;">发送时间:</div>
											    	<input type="text" class="form-control" value="${message.createTime?string('yyyy-MM-dd HH:mm:ss')}" name="createTime">
											    	<p></p>
											    	<div class="text-muted" style="color: #666;">消息内容:</div>
													<textarea class="form-control" rows="3" name="content">${message.content}</textarea>
											
											 	 </div>
											  </form>	          
								           </div>
								       
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>		
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
					<#if AMPageBean.totalPage <= 2>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if AMPageBean.currPage == 1>
								<li>
									<a href="#" class="active">首页</a>
								</li>
							<#else>
							<li>
									<a href="javascript:showAtRight('${base}/message/queryAM?type=作者&currPage=1');">首页</a>
								</li>
							</#if>
							
							<#list 1..AMPageBean.totalPage as n>
								<li><a href="javascript:showAtRight('${base}/message/queryAM?id=${user.id}&currPage=${n}');">${n}</a></li>
							</#list>
							<li>
								<a href="javascript:showAtRight('${base}/message/queryAM?id=${user.id}&currPage=${AMPageBean.totalPage}');">尾页</a>
							</li>
						</ul>
					</#if>
					<#if AMPageBean.totalPage gt 2>
						<#assign i=1>
						<ul class="pagination" style="padding: 0px;margin:0;">
							<#if AMPageBean.currPage gt 1>
							<li><a href="javascript:showAtRight('${base}/message/queryAM?id=${user.id}&currPage=${AMPageBean.currPage-i}');">上一页</a></li>
							<#else>
							<li><a href="#">上一页</a></li>
							</#if> 
							<li><a href="#">${AMPageBean.currPage}</a></li>
							<#if AMPageBean.currPage == AMPageBean.totalPage>
							<li><a href="#">下一页</a></li>
							<#else>
							<li><a href="javascript:showAtRight('${base}/message/queryAM?id=${user.id}&currPage=${AMPageBean.currPage+i}');">下一页</a></li>
							</#if>
						</ul>
						</#if>
						</#if><!-- 判断数据是否的存在的闭合标签 -->
						<ul class="pagination" style="margin:0 0 0 20px;padding: 0px;">
							<li><a href="#" class="active">第</a></li>
							<li><a href="#">${AMPageBean.currPage} / ${AMPageBean.totalPage}</a></li>
							<li><a href="#" class="active">页</a></li>
						</ul>
				
				</div>
			</div>
			
		</div>
	
	</div>
	


</body>
</html>