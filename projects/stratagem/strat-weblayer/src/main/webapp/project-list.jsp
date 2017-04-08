<%@page import="com.kota.stratagem.ejbservice.domain.ProjectStatusRepresentor"%>
<%@page import="com.kota.stratagem.weblayer.common.FormValue"%>
<%@page import="com.kota.stratagem.weblayer.common.project.ListAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Set" %>  
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://qwaevisz.hu/jsp/tlds/booktag" prefix="bt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/page.css" />
<title>:: Projects ::</title>
</head>
<body>
    <bt:header>List of Projects</bt:header>
    <div>
    	<% String userName = (String) request.getUserPrincipal().getName(); %>
	    Welcome <strong><%= userName %></strong>! <a href="Logout">Logout</a>
	</div>
	<br/><br/>
	<form method="post" action="ProjectList">
		<div>
			<label for="status">Status: </label>
			<select name="status" id="status">
			    <% String statusName = (String) request.getAttribute(ListAttribute.ATTR_STATUS); %>
				<option value="-1" <% out.print( FormValue.FILTER_ALL_CATEGORY.equals(statusName) ? "selected=\"selected\"" : "" ); %>>-</option>
			    <c:set var="statusValues" value="<%= ProjectStatusRepresentor.values() %>"/>
				<c:forEach items="${statusValues}" var="status">
					<option value="${status.name}" ${status.name eq requestScope.status ? "selected=\"selected\"" : ""}>${status.label}</option>
				</c:forEach>
			</select>
			<input type="submit" value="Filter" />
		</div>
	</form>
	<br/><br/>
	<c:choose>
	    <c:when test="${requestScope.projects.isEmpty()}">
            <span>Project list is <strong>empty</strong>.</span>
        </c:when>
        <c:otherwise>
            <table class="projectstable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Status</th>
                        <th>Tasks</th>
                        <!-- <th>&nbsp;</th> -->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.projects}" var="project">
                        <tr>
                            <td><c:out value="${project.name}" /></td>
                            <td><c:out value="${project.status.label}" /></td>
                            <td><c:out value="${project.tasks.size()}" /></td>
                            <!--  <td><a href="MagazineDelete?reference=<c:out value="${magazine.reference}" />">delete (unsafe)</a></td> -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br/>
        </c:otherwise>
	</c:choose>
	<br/><br/>
	<% if (request.isUserInRole("department_manager")) { %>
		<div>
		    Projects are up to date.
		</div>
	<% } %>
</body>
</html>