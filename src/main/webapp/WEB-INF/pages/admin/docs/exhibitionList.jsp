<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="exhibitionList.title"/></title>
    <meta name="menu" content="DocsMenu"/>
</head>

<div class="col-sm-12">
    <h2><fmt:message key="exhibitionList.heading"/></h2>
    <div id="actions" class="btn-group">
    	 <a class="btn btn-primary" href="<c:url value='exhibition?method=Add&from=list'/>">
            <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/></a>
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="icon-ok"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="exhibitionList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="exhibition.refNo"/></th>
                <th><fmt:message key="exhibition.customerCode"/></th>
                <th><fmt:message key="exhibition.typeOfContainer"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="exhibition.refNo"/></th>
                <th><fmt:message key="exhibition.customerCode"/></th>
                <th><fmt:message key="exhibition.typeOfContainer"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${exhibitionList}" var="exhibition" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
              	<td>${exhibition.docsgeneral.jobNo}</td>
              	<td>${exhibition.docsgeneral.customer.code}</td>
              	<td>${exhibition.docsgeneral.typeOfContainer.value}</td>
              	<td>
              		<c:if test="${exhibition.docsgeneral.doDelivery}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="exhibition?id=${exhibition.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

