<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="../common/include.jsp"%>
<script src="<%=path %>/js/webuploader.js"></script>
<script src="<%=path %>/js/uploaderFile.js"></script>
<script langeuage="javascript">
baseUrl = 'friend';
var BASE_URL = '<%=path %>';
</script>
</head>

<script language="javascript">


function validate(){
	var pass=true;
	return pass;
}

function checkIsExist(pass){
	return pass;
}


</script>

<body>

	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/menu.jsp"%>

	<div class="content">

		<div class="header">
			<h3>列表</h3>
		</div>
		<br />

		<div>
			<form:form id="config_form" action="editItem"
				class="form-horizontal form-newapp hero-unit" method="post"
				modelAttribute="friendDto">
				<input type="hidden" name="oldItemKey"
					value="<c:out value="${friendDto.id }" />" />
				<fieldset>
					<div id="legend">
						<legend>修改</legend>
					</div>
					<form:input path="id" type="hidden"/>
					<%-- <div class="control-group">
						<label class="control-label" for="input01">类型</label>
						<div class="controls">
							<c:if test="${friendDto.type=='0' }">
								<span id="typeValue" readonly="readonly">ANDROID</span>
							</c:if>
							<c:if test="${friendDto.type=='1' }">
								<span id="typeValue" readonly="readonly">IOS</span>
							</c:if>
							<form:input type="hidden" id="type" path="type" />
							<form:errors path="type" cssClass="validate-error"></form:errors>
						</div> 
						<form:input type="hidden" id="type" path="type" value="0"/>
					</div>--%>

					<div class="control-group">
						<label class="control-label" for="input01">学生ID</label>
						<div class="controls">
							<form:input type="text" id="studentId" path="studentId"
								onblur="checkIsExist();" />
							<form:errors path="studentId" cssClass="validate-error"></form:errors>
						</div>
					</div>

 					<div class="control-group">
						<label class="control-label" for="input01">好友ID</label>
						<div class="controls">
							<form:input type="text" id="frientId" path="frientId"
								onblur="checkIsExist();" />
							<form:errors path="frientId" cssClass="validate-error"></form:errors>
						</div>
					</div>
					 								
					<div class="control-group">
						<label class="control-label" for="input01">来源</label>
						<div class="controls">
							<form:input type="text" id="type" path="type" />
							<form:errors path="type" cssClass="validate-error"></form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"></label>

						<!-- Button -->
						<div class="controls">
							<console:input funcnum="p_friend_edit" type="button"
								cssClass="btn btn-primary" value="保存" onclick="doSave();"></console:input>
							<input type="button" class="btn btn-danger" value="取消"
								onclick="doCancel();" />
						</div>
					</div>

				</fieldset>
			</form:form>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>


</body>
</html>


