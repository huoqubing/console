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
	baseUrl = 'role';
</script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menu.jsp"%>

	<div class="content">
		<div class="header">
			<h3>角色列表</h3>
			<%@ include file="../common/message.jsp"%>
		</div>

		<div class="alert alert-info form-search">
			<form:form id="filter_form" action="list" cssStyle="margin:0px"
				method="post" modelAttribute="dto">
				<fieldset>
					<label>角色标识:</label>
					<form:input cssClass="input-medium search-query" type="text"
						path="roleId" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<label>角色名:</label>
					<form:input cssClass="input-medium search-query" type="text"
						path="roleName" />
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn" type="submit">查找</button>
				</fieldset>
			</form:form>
		</div>
		<form id="list_form" action="del" method="post">
			<table class="table table-bordered" id="list_table">
				<thead>
					<tr style="background-color: #E8EAEB">
						<th><input type="checkbox" /></th>
						<th>角色标识</th>
						<th>角色名</th>
						<th>创建时间</th>
						<th>更新时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list.result }" var="item" varStatus="sn">
						<tr>
							<c:if test="${item.roleId eq 'admin_role' }">
								<td></td>
							</c:if>
							<c:if test="${item.roleId ne 'admin_role'  }">
								<td><input type="checkbox" name="selected_item"
								value="<c:out value='${item.id }' />" /></td>
							</c:if>
							<td><c:out value="${item.roleId }" /></td>
							<td><c:out value="${item.roleName }" /></td>
							<td><fmt:formatDate value='${item.createTime}'
									pattern='yyyy-MM-dd HH:mm:ss' /></td>
							<td><fmt:formatDate value='${item.updateTime}'
									pattern='yyyy-MM-dd HH:mm:ss' /></td>
							<td style="width: 130px"><console:input
									funcnum="p_role_edit" type="button" cssClass="btn btn-info"
									value="修改" onclick="editItem('${item.id}')"></console:input>
									<c:if test="${item.roleId ne 'admin_role' }">
										&nbsp; <console:input funcnum="p_role_del" type="button"
									cssClass="btn btn-warning" value="删除"
									onclick="removeItem('${item.id}')"></console:input>
									</c:if>
									</td>
									
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<console:input funcnum="p_role_add" cssClass="btn btn-primary"
				style="float: left;" type="button" onclick="goAdd()" value="增加"></console:input>
			&nbsp;&nbsp;
			<console:input funcnum="p_role_del" cssClass="btn btn-warning"
				type="button" onclick="removeItems()" value="删除所选"></console:input>
		</form>
		<console:pagination resultKey="list" javascript="void(0)"
			onclick="doPagnation(this)"></console:pagination>
	</div>
</body>
</html>


