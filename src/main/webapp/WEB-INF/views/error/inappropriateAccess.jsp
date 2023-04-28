<%@ include file="../include/_header.jsp"%>
<%@ include file="../include/_footer.jsp"%>

<script type="text/javascript">
	window.onload = function() {
		<% session.removeAttribute("msg"); %>
		location.href="index";
	}
</script>