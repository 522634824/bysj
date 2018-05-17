<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="base.jsp"></jsp:include>
<script type="text/javascript">
    $(function(){
        $("#displayPdfIframe").attr("src",'<c:url value="/generic/web/viewer.html" />?file=' + encodeURIComponent('<c:url value="/pdf/displayPDFById.action?projectreplyid=${projectreply.projectreplyid}"/>'));
    });
</script>
<div >
    <div>
        <iframe id="displayPdfIframe" width="100%" height="800"></iframe>
    </div>
</div>