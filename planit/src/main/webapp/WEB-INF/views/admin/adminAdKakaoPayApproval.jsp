<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	window.parent.$(".ui-dialog-content:visible").dialog("close");
	window.parent.$("form").submit();
</script>