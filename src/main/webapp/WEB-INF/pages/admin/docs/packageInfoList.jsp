<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="packageInfoList.title"/></title>
    <meta name="menu" content="DocsMenu"/>
</head>

<div class="col-sm-12">
    <h2><fmt:message key="packageInfoList.heading"/></h2>
    <div id="actions" class="btn-group">
    	 <a class="btn btn-primary" href="<c:url value='packageInfo?method=Add&from=list'/>">
            <i class="icon-plus icon-white"></i> <fmt:message key="button.add"/></a>
        <a class="btn btn-default" href="<c:url value='/home'/>">
            <i class="icon-ok"></i> <fmt:message key="button.done"/></a>
    </div>
    <table id="packageInfoList" class="display datatable" cellspacing="0" width="100%" >
        <thead>
            <tr>
            	<th><fmt:message key="table.no"/></th>
                <th><fmt:message key="packageInfo.jobNo"/></th>
                <th><fmt:message key="packageInfo.customerCode"/></th>
                <th><fmt:message key="packageInfo.imExMode"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th><fmt:message key="table.no"/></th>
                <th><fmt:message key="packageInfo.jobNo"/></th>
                <th><fmt:message key="packageInfo.customerCode"/></th>
                <th><fmt:message key="packageInfo.imExMode"/></th>
                <th><fmt:message key="packageInfo.status"/></th>
                <th><fmt:message key="table.action"/></th>
            </tr>
        </tfoot>
        <tbody>
        <c:forEach items="${packageinfoList}" var="packageInfo" varStatus="idx">
        	<tr>
                <td>${idx.index+1}</td>
              	<td>${packageInfo.docsgeneral.jobNo}</td>
              	<td>${packageInfo.docsgeneral.customer.code}</td>
              	<td>${packageInfo.imExMode.value}</td>
              	<td>
              		<c:if test="${packageInfo.docsgeneral.doDelivery}">
              			<a><i class="fa fa-check"></i></a>
              		</c:if>
              	</td>
                <td>
                	<a href="packageInfo?id=${packageInfo.id}" class="iconButton" title="<fmt:message key='table.buttonEditTitle'/>"><i class="fa fa-pencil-square-o"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

