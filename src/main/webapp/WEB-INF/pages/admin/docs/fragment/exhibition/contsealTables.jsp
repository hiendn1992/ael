<%@ include file="/common/taglibs.jsp"%>
<div id="consealContainer">
	<h3>
		<fmt:message key="exhibition.listContsealDetail" />
	</h3>
	<hr>
	<table id="contsealList"
		class="display table table-condensed inFormTable" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th><fmt:message key="table.no" /></th>
				<th><fmt:message key="contseal.noOfCont" /></th>
				<th><fmt:message key="contseal.noSeal" /></th>
				<th><fmt:message key="contseal.noOfPKGS" /></th>
				<th><fmt:message key="contseal.weight" /></th>
				<th><fmt:message key="table.action" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${exhibition.docsgeneral.contseals}"
				var="contseal" varStatus="idx">
				<tr class="${contseal.isAdded == true ? 'hidden' :''}">
					<td colType="index">${idx.index+1}</td>
					<td colType="generalInfo" class="hidden"><form:hidden
							path="docsgeneral.contseals[${idx.index}].id" /> <form:hidden
							path="docsgeneral.contseals[${idx.index}].isAdded"
							valueType="added" /> <form:hidden
							path="docsgeneral.contseals[${idx.index}].isDeleted"
							valueType="deleted" /></td>
					<td><spring:bind
							path="exhibition.docsgeneral.contseals[${idx.index}].noOfCont">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].noOfCont"
							id="noOfCont${idx.index}" maxlength="45" autofocus="true"
							cssClass="form-control" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].noOfCont"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="exhibition.docsgeneral.contseals[${idx.index}].noSeal">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].noSeal"
							id="noSeal${idx.index}" maxlength="45" autofocus="true"
							cssClass="form-control" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].noSeal"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="exhibition.docsgeneral.contseals[${idx.index}].noOfPKGS">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].noOfPKGS"
							id="noOfPKGS${idx.index}" maxlength="45" autofocus="true"
							cssClass="form-control number" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].noOfPKGS"
							cssClass="help-block" />
						</div></td>
					<td><spring:bind
							path="exhibition.docsgeneral.contseals[${idx.index}].weight">
							<div
								class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
						</spring:bind> <form:input path="docsgeneral.contseals[${idx.index}].weight"
							id="weight${idx.index}" maxlength="45" autofocus="true"
							cssClass="form-control money" /> <form:errors
							path="docsgeneral.contseals[${idx.index}].weight"
							cssClass="help-block" />
						</div></td>
					<td rowType="actions"><span class="iconButton removeRow"
						title="<fmt:message key='table.buttonEditTitle'/>"> <i
							class="fa fa-trash"></i>
					</span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="row">
		<div class="col-md-10"></div>
		<div class="col-md-2">
			<span class="btn btn-primary" target-table="contsealList"> <i
				class="icon-ok"></i> <fmt:message key="button.add" /></span>
		</div>
	</div>
</div>