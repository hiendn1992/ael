<%@ include file="/common/taglibs.jsp"%>
	    <div class="row">
		    <spring:bind path="inland.docsgeneral.jobNo">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.jobNo"/>
		        <form:input path="docsgeneral.jobNo" id="jobNo" maxlength="45" autofocus="true" cssClass="form-control" readonly="true"/>
		        <form:errors path="docsgeneral.jobNo" cssClass="help-block"/>
		    </div>
		    
		    <c:choose >
		    	<c:when test="${empty  inland.docsgeneral.customer}">
				   	<spring:bind path="inland.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.customerCode"/>
				        <form:select path="docsgeneral.customer.id" id="customercode" autofocus="true" cssClass="form-control select2">
				        	<c:forEach items="${docsSelection.customers}" var="cust">
				        		<form:option value="${cust.id}">${cust.code}</form:option>
				        	</c:forEach>
				        </form:select>
				        <form:errors path="docsgeneral.customer.id" cssClass="help-block"/>
				    </div>
				</c:when>
				<c:otherwise>
					<form:hidden path="docsgeneral.customer.id"/>
					<spring:bind path="inland.docsgeneral.customer.code">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.customerCode"/>
				        <form:input path="docsgeneral.customer.code" id="customercode" maxlength="45" autofocus="true" cssClass="form-control" disabled="true"/>
				        <form:errors path="docsgeneral.customer.code" cssClass="help-block"/>
				    </div>
				</c:otherwise>
		    </c:choose>
		    
		    <spring:bind path="inland.docsgeneral.docReceiveDate">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.docReceiveDate"/>
		        <form:input path="docsgeneral.docReceiveDate" data-provide="datepicker" id="docReceiveDate" maxlength="45" autofocus="true" cssClass="form-control"/>
		        <form:errors path="docsgeneral.docReceiveDate" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="inland.route">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.route"/>
		        <form:select path="route.id" id="route"  autofocus="true" cssClass="form-control" items="${docsSelection.selections['routes']}"/>
		        <form:errors path="route.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="inland.docsgeneral.processingStaff">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.processingStaff"/>
		        <form:select path="docsgeneral.processingStaff.id" id="processingStaff" autofocus="true" cssClass="form-control select2">
		        	<c:forEach items="${docsSelection.staff}" var="st">
		        		<form:option value="${st.id}">${st.firstName}&nbsp;${st.lastName} </form:option>
		        	</c:forEach>
		        </form:select>
		        <form:errors path="docsgeneral.processingStaff.id" cssClass="help-block"/>
		    </div>
		    
		    <spring:bind path="inland.etd">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.etd"/>
			        <form:input path="etd" data-provide="datepicker" id="etd"  autofocus="true" cssClass="form-control"/>
			        <form:errors path="etd" cssClass="help-block"/>
			    </div>
			    <spring:bind path="inland.eta">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.eta"/>
			        <form:input path="eta" data-provide="datepicker" id="eta"  autofocus="true" cssClass="form-control"/>
			        <form:errors path="eta" cssClass="help-block"/>
			    </div>
			    
		    <spring:bind path="inland.docsgeneral.shippingLine">
		    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
		    </spring:bind>
		        <appfuse:label styleClass="control-label" key="inland.shippingLine"/>
		        <form:select path="docsgeneral.shippingLine.id" id="shippingLine"  autofocus="true" cssClass="form-control" items="${hangtaus}"/>
		        <form:errors path="docsgeneral.shippingLine.id" cssClass="help-block"/>
		    </div>
		    
		     <spring:bind path="inland.attachServices">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.attachServices"/>
					        <form:input path="attachServices" id="attachServices"  autofocus="true" cssClass="form-control"/>
					        <form:errors path="attachServices" cssClass="help-block"/>
					    </div>
					    
		    <spring:bind path="inland.nameVehicle">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.nameVehicle"/>
			        <form:input path="nameVehicle" id="nameVehicle"  autofocus="true" cssClass="form-control"/>
			        <form:errors path="nameVehicle" cssClass="help-block"/>
			    </div>
		    	
		    	<spring:bind path="inland.docsgeneral.placeRev">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.gettingPlace"/>
			        <form:input path="docsgeneral.placeRev" id="placeRev"  autofocus="true" cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeRev" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.docsgeneral.placeDelivery">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-4">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.deliveryPlace"/>
			        <form:input path="docsgeneral.placeDelivery" id="deliveryPlace"  autofocus="true" cssClass="form-control"/>
			        <form:errors path="docsgeneral.placeDelivery" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.dateRecPack">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.dateRecPack"/>
			        <form:input path="dateRecPack" data-provide="datepicker" id="dateRecPack" autofocus="true" cssClass="form-control"/>
			        <form:errors path="dateRecPack" cssClass="help-block"/>
			    </div>
			    <spring:bind path="inland.dateDevPack">
			    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
			    </spring:bind>
			        <appfuse:label styleClass="control-label" key="inland.dateDevPack"/>
			        <form:input path="dateDevPack" data-provide="datepicker" id="dateDevPack" autofocus="true" cssClass="form-control"/>
			        <form:errors path="dateDevPack" cssClass="help-block"/>
			    </div>
			    
			    <spring:bind path="inland.docsgeneral.noOfPkgs">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.noOfPkgs"/>
				        <form:input path="docsgeneral.noOfPkgs" id="noOfPkgs" maxlength="45" autofocus="true" cssClass="form-control number"/>
				        <form:errors path="docsgeneral.noOfPkgs" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.docsgeneral.weigth">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.weigth"/>
				        <form:input path="docsgeneral.weigth" id="weigth" maxlength="45" autofocus="true" cssClass="form-control money"/>
				        <form:errors path="docsgeneral.weigth" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.docsgeneral.cmb">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-2">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.cmb"/>
				        <form:input path="docsgeneral.cmb" id="cmb" maxlength="45" autofocus="true" cssClass="form-control number"/>
				        <form:errors path="docsgeneral.cmb" cssClass="help-block"/>
				    </div>
	    			<spring:bind path="inland.nameOfPack">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.nameOfPack"/>
				        <form:input path="nameOfPack" id="nameOfPack"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="nameOfPack" cssClass="help-block"/>
				    </div>
				    
	    		<spring:bind path="inland.docsgeneral.placeEmptyUp">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placeEmptyUp"/>
					        <form:input path="docsgeneral.placeEmptyUp" id="placeEmptyUp" autofocus="true" cssClass="form-control"/>
					        <form:errors path="docsgeneral.placeEmptyUp" cssClass="help-block"/>
					    </div>
					    
					<spring:bind path="inland.docsgeneral.portPutCont">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placePutCont"/>
					        <form:input path="docsgeneral.portPutCont" id="portPutCont" autofocus="true" cssClass="form-control"/>
					        <form:errors path="docsgeneral.portPutCont" cssClass="help-block"/>
					    </div>
					
					<spring:bind path="inland.docsgeneral.contactDelivery">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.contactDelivery"/>
				        <form:input path="docsgeneral.contactDelivery" id="contactDelivery"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="docsgeneral.contactDelivery" cssClass="help-block"/>
				    </div>
				    
					<spring:bind path="inland.docsgeneral.placeGetCont">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placeGetCont"/>
					        <form:input path="docsgeneral.placeGetCont" id="placeEmptyDown"  autofocus="true" cssClass="form-control"/>
					        <form:errors path="docsgeneral.placeGetCont" cssClass="help-block"/>
					    </div>
					    
					<spring:bind path="inland.docsgeneral.placeEmptyDown">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-3">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.placeEmptyDown"/>
					        <form:input path="docsgeneral.placeEmptyDown" id="placeEmptyDown"  autofocus="true" cssClass="form-control"/>
					        <form:errors path="docsgeneral.placeEmptyDown" cssClass="help-block"/>
					    </div>
	    	</div>
	    	
	    	<div class="row">
	    		<div class="col-md-6 inner">
	    			
	    			 <spring:bind path="inland.otherInfo">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-12">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.otherInfo"/>
				        <form:input path="otherInfo" id="otherInfo"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="otherInfo" cssClass="help-block"/>
				    </div>
				    
	    			<spring:bind path="inland.docsgeneral.infoInvoice">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.infoInvoice"/>
				        <form:input path="docsgeneral.infoInvoice" id="infoInvoice"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="docsgeneral.infoInvoice" cssClass="help-block"/>
				    </div>
				    
		    		 <spring:bind path="inland.dateCutOff">
					    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
					    </spring:bind>
					        <appfuse:label styleClass="control-label" key="inland.dateCutOff"/>
					        <form:input path="dateCutOff" id="dateCutOff" data-provide="datepicker" autofocus="true" cssClass="form-control"/>
					        <form:errors path="dateCutOff" cssClass="help-block"/>
					    </div>
					    
				    <spring:bind path="inland.freeTimeInHCM">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.freeTimeInHCM"/>
				        <form:input path="freeTimeInHCM" id="freeTimeInHCM"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="freeTimeInHCM" cssClass="help-block"/>
				    </div>
				    
				    <spring:bind path="inland.freeTimeInHP">
				    <div class="form-group${(not empty status.errorMessage) ? ' has-error' : ''} col-md-6">
				    </spring:bind>
				        <appfuse:label styleClass="control-label" key="inland.freeTimeInHP"/>
				        <form:input path="freeTimeInHP" id="freeTimeInHP"  autofocus="true" cssClass="form-control"/>
				        <form:errors path="freeTimeInHP" cssClass="help-block"/>
				    </div>
				    
				    
	    		</div>
	    		<div class="col-md-6">
					<jsp:include page="contTypes.jsp"></jsp:include>
	    		</div>
	    	</div>
	    </div>
