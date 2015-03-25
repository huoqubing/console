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
<script src="<%=path %>/js/uploader.js"></script>
<script langeuage="javascript">
baseUrl = 'mobileUser';
var BASE_URL = '<%=path %>';
</script>
</head>

<script language="javascript">
$().ready(function(){
	var gender = $('#gender').val();
	if(gender){
		$("#gender"+gender).prop("checked",true);
	}
	$("input[name='genderRadios']").bind('click',function(){
		if($(this).prop("checked")){
			$("#gender").val($(this).val());
		}
	});
});
function validate(){
	var pass=true;
	return pass;
}

function checkIsExist(pass){
	return pass;
}

function doAfterUploadAccept(object,data){
	if(null!=data&&data.status=='0'){
		$('#oldImage').hide();
		$('#avatar').val(data.url);
		return true;
	}else{
		return false;
	}
}
function doUploadBeforeSend(object,data){
	data['path']='mobileUser';
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
				modelAttribute="mobileUser">
				<input type="hidden" name="oldItemKey"
					value="<c:out value="${mobileUser.id }" />" />
				<fieldset>
					<div id="legend">
						<legend>修改</legend>
					</div>
					<form:input path="id" type="hidden"/>
					<div class="control-group">
						<label class="control-label" for="input01">登陆名</label>
						<div class="controls">
							<form:input type="text" id="loginname" path="loginname" readonly="true"/>
							<form:errors path="loginname" cssClass="validate-error"></form:errors>
						</div>
					</div>					
					
					<div class="control-group">
						<label class="control-label" for="input01">真实姓名</label>
						<div class="controls">
							<form:input type="text" id="realname" path="realname" />
							<form:errors path="realname" cssClass="validate-error"></form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">密码</label>
						<div class="controls">
							<form:input type="password" id="password" path="password" />
							<form:errors path="password" cssClass="validate-error"></form:errors>
						</div>
					</div>					
					<div class="control-group">
						<label class="control-label" for="input01">手机号码</label>
						<div class="controls">
							<form:input type="text" id="phone" path="phone" />
							<form:errors path="phone" cssClass="validate-error"></form:errors>
						</div>
					</div>
					<div class="control-group">
						<!-- Text input-->
						<label class="control-label" for="input01">性别</label>
						<div class="controls">
							<div class="radio radio-inline">
							  <label>
							    <input type="radio" name="genderRadios" id="gender1" value="1">
							    男
							  </label>
							</div>
							<div class="radio radio-inline">
							  <label>
							    <input type="radio" name="genderRadios" id="gender0" value="0 ">
							    女
							  </label>
							</div>
							<form:input type="hidden" id="gender" path="gender" />
							<form:errors path="gender" cssClass="validate-error"></form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">email</label>
						<div class="controls">
							<form:input type="text" id="email" path="email" />
							<form:errors path="email" cssClass="validate-error"></form:errors>
						</div>
					</div>
					
					
					<div class="control-group">
						<div class="controls" id="oldImage">
							<a href="${mobileUser.avatar }" class="fancybox"><img src="${mobileUser.avatar }" alt=""/></a>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="input01">头像</label>
						<div class="controls">
						
							<div id="uploader-demo">
							    <!--用来存放item-->
							    <div id="fileList" class="uploader-list"></div>
							    <div id="filePicker">选择图片</div>
							</div>
							
							<form:input type="hidden" id="avatar" path="avatar" />
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label"></label>

						<!-- Button -->
						<div class="controls">
							<console:input funcnum="p_mobileUser_edit" type="button"
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


