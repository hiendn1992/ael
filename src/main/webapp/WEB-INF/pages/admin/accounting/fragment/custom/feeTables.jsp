<%@ include file="/common/taglibs.jsp"%>
<h3><fmt:message key="accountingcus.chiholist" /></h3>
<hr>
<table id="chihoList"
	class="display table table-condensed feeTable" cellspacing="0"
	width="100%">
	<thead>
		<tr>
			<th rowspan="2"><fmt:message key="table.no" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feeName" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feeDescription"/></th>
			<th colspan="3" class="centerText"><fmt:message key="accountingcus.typeOfContainer"/></th>
			<th rowspan="2"><fmt:message key="accountingcus.total" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.vat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feevat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.feewithvat" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.note" /></th>
			<th rowspan="2"><fmt:message key="accountingcus.invoice" /></th>
		</tr>
		<tr>
			<th class="numberCol"><fmt:message key="accountingcus.20"/></th>
			<th class="numberCol"><fmt:message key="accountingcus.40"/></th>
			<th class="numberCol"><fmt:message key="accountingcus.LCL"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${accountingcus.extendfeeaccs}" var="extendfeeacc" varStatus="idx"  >
			<tr>
				<td colType="index">${idx.index+1}</td>
				<td>
					<div class="form-group">
				        <input value="${extendfeeacc.feeowner.name.value}" maxlength="45" autofocus="true" class="form-control" readonly="true"/>
				    </div>
			    </td>
			    <td>
					<spring:bind path="accountingcus.extendfeeaccs[${idx.index}].description.id">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="24">
					</spring:bind>
					<form:select
							path="extendfeeaccs[${idx.index}].description.id"
							id="description${idx.index}" autofocus="true"
							items="${selections['debitfeesDes']}"
							cssClass="form-control"/> 
								 <form:errors
								path="extendfeeaccs[${idx.index}].description.id"
								cssClass="help-block" />
					</div>
				</td>
				<td>
					<div class="form-group">
						<input readonly="readonly" class="form-control">
					</div>
				</td>
				<td>
					<div class="form-group">
						<input readonly="readonly" class="form-control">
					</div>
				</td>
				<td>
					<div class="form-group">
						<input readonly="readonly" class="form-control">
					</div>
				</td>
				<td>
					<div class="form-group">
				        <input value="${extendfeeacc.feeowner.amount}"  maxlength="45" autofocus="true" class="form-control money amount" readonly="true"/>
				    </div>
			    </td>
			    <td>
					<div class="form-group">
						<spring:bind path="accountingcus.extendfeeaccs[${idx.index}].feeowner.vat">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}" addUrl="/admin/config/constant" type="24">
					</spring:bind>
					<form:input
							path="extendfeeaccs[${idx.index}].feeowner.vat"
							id="description${idx.index}" autofocus="true"
							cssClass="form-control money vat"/> 
								 <form:errors
								path="extendfeeaccs[${idx.index}].feeowner.vat"
								cssClass="help-block" />
					<form:hidden path="extendfeeaccs[${idx.index}].feeowner.id"/>
					</div>
			    </td>
			     <td>
					<div class="form-group">
				        <input value="${extendfeeacc.feeowner.vatFee}"  maxlength="45" autofocus="true" class="form-control money vatAmount" readonly="true"/>
				    </div>
			    </td>
			     <td>
					<div class="form-group">
				        <input value="${extendfeeacc.feeowner.total}"  maxlength="45" autofocus="true" class="form-control money total" disabled="true"/>
				    </div>
			    </td>
			    <td>
					<spring:bind path="accountingcus.extendfeeaccs[${idx.index}].note">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> 
					<form:input
								path="extendfeeaccs[${idx.index}].note"
								autofocus="true"
								cssClass="form-control"/>
								 <form:errors
								path="extendfeeaccs[${idx.index}].note"
								cssClass="help-block" />
					</div>
				</td>
				<td>
					<spring:bind path="accountingcus.extendfeeaccs[${idx.index}].invoice">
					<div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''}">
					</spring:bind> 
					<form:input
								path="extendfeeaccs[${idx.index}].invoice"
								autofocus="true"
								cssClass="form-control"/>
								 <form:errors
								path="extendfeeaccs[${idx.index}].invoice"
								cssClass="help-block" />
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
