<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList"%>
<%@ page
	import="hu.qwaevisz.tickethandling.ejbservice.domain.TicketStub"%>
<%@ page
	import="hu.qwaevisz.tickethandling.ejbservice.domain.PriorityStub"%>
<%@ page
	import="hu.qwaevisz.tickethandling.ejbservice.domain.StatusStub"%>
<%@ page
	import="hu.qwaevisz.tickethandling.ejbservice.domain.EmployeeStub"%>	
<%@ page
	import="hu.qwaevisz.tickethandling.ejbservice.domain.SystemStub"%>
<%@ page
	import="hu.qwaevisz.tickethandling.weblayer.common.TicketAttribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://qwaevisz.hu/jsp/tlds/tickettag" prefix="bt"%>
<%
	TicketStub ticket = (TicketStub) request.getAttribute(TicketAttribute.ATTR_TICKET);
	ArrayList<SystemStub> syss = (ArrayList<SystemStub>) request.getAttribute(TicketAttribute.ATTR_SYSTEMS);
	ArrayList<EmployeeStub> emps = (ArrayList<EmployeeStub>) request.getAttribute(TicketAttribute.ATTR_EMPLOYEES);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/tickethandling.css" />

<script src="js/bootstrap.js"></script>
<title>:: Ticket ::</title>
</head>
<body>

	<jsp:include page="navbar.html"></jsp:include>

	<div class="jumbotron jumbotron-ticketing">
		<h1>
			<%
				if ("".equals(ticket.getId())) {
					out.print("New ticket");
				} else {
					out.print(ticket.getId());
				}
			%>
		</h1>
	</div>
	<div class="container">
		<form method="post" action="Ticket" class="form-horizontal">
			<input type="text" name="id" id="id" hidden="hidden"
				contenteditable="false" value="<%out.print(ticket.getId());%>" />
				
			<div class="form-group">
				<label class="control-label col-sm-2" for="system">System:
				</label>
				<div class="col-sm-2">
					<select class="form-control" name="system" id="system">
						<%
							for (SystemStub sys : syss) {
						%>
						<option value="<%out.print(sys.getId());%>"
						<% out.print(ticket.getSystem() != null && sys.getId() == ticket.getSystem().getId() ? "selected=\"selected\"" : "");%>>
							<%
								out.print(sys.getId());
							%>
						</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="processor">Processor:
				</label>
				<div class="col-sm-2">
					<select class="form-control" name="processor" id="processor">
						<%
							for (EmployeeStub emp : emps) {
						%>
						<option value="<%out.print(emp.getId());%>"
						<% out.print(ticket.getProcessor() != null && emp.getId() == ticket.getProcessor().getId() ? "selected=\"selected\"" : "");%>>
							<%
								out.print(emp.getId());
							%>
						</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="level">Level: </label>
				<div class="col-sm-2">
					<input class="form-control" type="number" name="level" id="level" max="3" min="1"
						value="<%out.print(ticket.getLevel());%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="sender_name">Sender
					name: </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="sender_name" id="sender_name"
						value="<%out.print(ticket.getSender_name());%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="business_impact">Business
					impact: </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="business_impact" id="business_impact"
						value="<%out.print(ticket.getBusiness_impact());%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="steps_to_rep">Steps
					to reproduce the issue: </label>
				<div class="col-sm-10">
					<input class="form-control" type="text" name="steps_to_rep" id="steps_to_rep"
						value="<%out.print(ticket.getSteps_to_rep());%>" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="priority">Priority:
				</label>
				<div class="col-sm-2">
					<select class="form-control" name="priority" id="priority">
						<%
							for (PriorityStub priority : PriorityStub.values()) {
						%>
						<option value="<%out.print(priority.name());%>"
							<%out.print(priority == ticket.getPriority() ? "selected=\"selected\"" : "");%>>
							<%
								out.print(priority.getLabel());
							%>
						</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="status">Status: </label>
				<div class="col-sm-2">
					<select class="form-control" name="status" id="status">
						<%
							for (StatusStub status : StatusStub.values()) {
						%>
						<option value="<%out.print(status.name());%>"
							<%out.print(status == ticket.getStatus() ? "selected=\"selected\"" : "");%>>
							<%
								out.print(status.getLabel());
							%>
						</option>
						<%
							}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
					&nbsp;<a href="Ticket?id=<%out.print(ticket.getId());%>">Cancel</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>