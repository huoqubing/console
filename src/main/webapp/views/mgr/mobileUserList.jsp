<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="../common/include.jsp"%>
<script langeuage="javascript">
	baseUrl = 'mobileUser';
/* 	$().ready(function() {
		$('#type-dropdown-menu li a').click(function (e) {
		    var newHeading = $(this).text();
		    var newType = e.currentTarget['id'];
		    var $heading = $('#genderValue');
		    $("#gender").val(newType.substring(7));
		    $heading.html(newHeading + ' ');
		});
		var typeValue = $("#gender").val();
		if(null!=typeValue&&typeValue.length>0){
			$('#gender_'+typeValue).get(0).click();
		}else{
			$('#gender_-1').get(0).click();
		}
	}); */
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menu.jsp"%>

	<div class="content">
		<div class="header">
			<h3>列表</h3>
			<%@ include file="../common/message.jsp"%>
		</div>

		<div class="alert alert-info form-search">
			<form:form id="filter_form" action="list" cssStyle="margin:0px"
				method="post" modelAttribute="dto">
				<fieldset>
					<label>登陆名:</label>
					<form:input cssClass="input-medium search-query" type="text"
						path="loginname" />
					<label>电话号码:</label>
					<form:input cssClass="input-medium search-query" type="text"
						path="phone" />
					<button class="btn" type="submit">查找</button>
				</fieldset>
			</form:form>
		</div>
		<form id="list_form" action="del" method="post">
			<table class="table table-bordered" id="list_table">
				<thead>
					<tr style="background-color: #E8EAEB">
						<th><input type="checkbox" /></th>
						<th>登陆名</th>
						<th>头像</th>
						<th>手机号码</th>
						<th>性别</th>
						<th>电子邮件</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list.result }" var="item" varStatus="sn">
						<tr>
							<td><input type="checkbox" name="selected_item"
								value="<c:out value='${item.id }' />" /></td>
							
							<td>
								${item.loginname}
							</td>
							<td>
								<a href="${item.avatar }" class="fancybox"><img src="${item.avatar }" alt="" width="100px"/></a>
							</td>
							<td>
								${item.phone }
							</td>
							<td>
								<c:if test="${item.gender =='0' }">
									<c:out value="女" />
								</c:if>
								<c:if test="${item.gender =='1' }">
									<c:out value="男" />
								</c:if>
							</td>
							<td>${item.email }</td>
							<td><fmt:formatDate value='${item.createtime}'
									pattern='yyyy-MM-dd HH:mm:ss' /></td>
							<td style="width: 130px"><console:input
									funcnum="p_mobileUser_edit" type="button" cssClass="btn btn-info"
									value="修改" onclick="editItem('${item.id}')"></console:input>
								&nbsp; <console:input funcnum="p_mobileUser_del" type="button"
									cssClass="btn btn-warning" value="删除"
									onclick="removeItem('${item.id}')"></console:input></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<console:input funcnum="p_mobileUser_del" cssClass="btn btn-warning"
				type="button" onclick="removeItems()" value="删除所选"></console:input>
		</form>
		<console:pagination resultKey="list" javascript="void(0)"
			onclick="doPagnation(this)"></console:pagination>
	</div>
</body>
</html>


