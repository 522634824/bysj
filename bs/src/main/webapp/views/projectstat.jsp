<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目统计信息</title>
<jsp:include page="base.jsp"></jsp:include>
</head>
<body style="margin: 1px;" id="ff">
	<script type="text/javascript">
		var url;
		$(function() {
			statList();

			//年度下拉框初始化
			$("#yearChoose").combobox({
				valueField : 'yearval',
				textField : 'year',
				panelHeight : 'auto'
			});
			var data = [];//创建年度数组
			var startYear;//起始年份
			var thisYear = new Date().getUTCFullYear();//今年
			var endYear = thisYear + 1;//结束年份
			//数组添加值（2012-2016）//根据情况自己修改
			data.push({
					"year" : "请选择",
					"yearval":"-1"
				});
			for (startYear = endYear - 4; startYear < endYear; startYear++) {
				data.push({
					"year" : startYear,
					"yearval":startYear
				});
			}
			$("#yearChoose").combobox("loadData", data);//下拉框加载数据
			$("#yearChoose").combobox("setValue", data[0]);//设置默认值为今年
			//月度下拉框初始化
			$("#monthChoose").combobox({
				valueField : 'monthval',
				textField : 'month',
				panelHeight : 'auto',
				editable : false
			});
			var data1 = [];//创建月份数组
			var startMonth = 1;//起始月份
			var thisMonth = new Date().getUTCMonth() + 1;//本月
			data1.push({
				"month" : "请选择",
				"monthval" :"-1"
			});
			//数组添加值（1-12月）为固定值
			for (startMonth; startMonth < 13; startMonth++) {
				data1.push({
					"month" : startMonth,
					"monthval" :startMonth
				});
			}
			$("#monthChoose").combobox("loadData", data1);//下拉框加载数据
			$("#monthChoose").combobox("setValue", data1[0]);//设置默认值为本月

		});

		function statList() {
			url = '${pageContext.request.contextPath}/stat/projectStattList.action';
			$('#dg').datagrid({
				loadFilter : pagerFilter
			}).datagrid({
				title : '项目统计报表',
				pagination : true,
				pageSize : 10,
				pageList : [ 10, 20, 30 ],
				rownumbers : true,
				fit : true,
				fitColumns : true,
				toolbar : '#tb',
				url : url,
				columns : [ [ {
					field : 'cb',
					checkbox : true
				}, //选择 
				{
					title : '用户编号',
					field : 'userid',
					width : 150,
					align : 'center',
					hidden : true,
				}, //选择 
				{
					title : '项目负责人',
					field : 'performer',
					width : 150,
					align : 'center',
				}, {
					title : '项目完成数目',
					field : 'completecount',
					width : 150,
					align : 'center'
				}, {
					title : '资金花费',
					field : 'howmuch',
					width : 150,
					align : 'center'
				},
				] ],
			});
		}

		function searchByDate() {
			var year = $("#yearChoose").val();
			var month = $("#monthChoose").val();
			if(year=="-1"&&month!="-1"){
				$.messager.alert("系统提示", "请选择年份！");
				return;
			}
			 $("#dg").datagrid('load', {
	                "year": year,
	                "month": month
	            });
		}
	</script>

	<table id="dg"></table>

	<div id="tb">
		<div>
			&nbsp;&nbsp;年度：&nbsp; <input class="easyui-combobox ui-text"
				id="yearChoose" style="width: 80px; height: 26px">
			&nbsp;&nbsp;月份：&nbsp; <input class="easyui-combobox" id="monthChoose"
				style="width: 80px; height: 26px"> &nbsp; &nbsp;<a
				href="javascript:searchByDate()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">搜索</a>
		</div>
	</div>

</body>
</html>