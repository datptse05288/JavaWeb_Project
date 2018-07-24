<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : edit
    Created on : Jul 24, 2018, 8:00:47 AM
    Author     : Muscle_Life
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="w" class="model.WantedModel" scope="request"/>
        <jsp:setProperty name="w" property="*"/>
        <jsp:useBean id="c" class="model.CrimeTypeModel" scope="request"/>
        <jsp:useBean id="m" class="model.MissionUnitModel" scope="request"/>
        <jsp:useBean id="p" class="model.PrisonModel" scope="request"/>
        
        <form action="EditWantedServlet">
            
            <c:forEach var="x" items="${w.selectAll()}">
                <p>
                    <b>WantedID :</b><input type="text" value="${x.wID}" name="wID" readonly="readonly"/>
                </p>
                <p>
                    <b>Image    :</b><image src="${x.image}"/>
                </p>
                <p>
                    <b>CrimeName: </b><input type="text" value="${x.cName}" name="cName"/>
                </p>
                <p>
                    <b>Gender   :</b>
                    <input type="radio" name="gender" value="Male" checked=${x.gender =='Male'? "checked": ""} /> Male
                    <input type="radio" name="gender" value="Female"  checked=${x.gender =='Female'? "checked": ""} /> Female
                </p>
                <p>
                    <b>Country  :</b><input type="text" value="${x.country}" name="country"/>
                </p>
                <p>
                    <b>DOB      :</b><input type="date" value="${x.dob}" name="dob"/>
                </p>
                <p>
                    <b>Offense  :</b><textarea rows="4" cols="50" name="offense">${x.offense}</textarea>
                </p>
                <p>
                    <b>WantedDate  :</b><input type="date" name="wantedDate" value="${x.wDate}"/>
                </p>
                <p>
                    <b>CatchedDate :</b><input type="date" name="catchedDate" value="${x.cDate}" disabled="disabled"/>
                </p>
                <p>
                    <b>Status  :</b><input type="text" value="${x.status}" name="status" disabled="disabled"/>
                </p>
                <p>
                    <b>Detail  :</b><input type="text" value="${x.detail}" name="detail"/>
                </p>
                <p>
                    <b>CrimeType:</b> 
                    <select name="cType">    
                        <c:forEach var="i" items="${c.selectAll()}">
                            <option value="${i.cTypeID}" ${x.cTypeID == i.cTypeID ? "selected":""}
                                    ${param.cType == i.cTypeID ? "selected":""}>${i.cTypeName}</option>
                        </c:forEach>              
                    </select>
                </p>
                <p><b>Mission Unit:</b>
                    <select name="mUnitID">
                        <c:forEach var="i" items="${m.selectAll()}">
                            <option value="${i.mID}" ${x.mID == i.mID ? "selected":""}
                                    ${param.mUnitID == i.mID ? "selected":""}>${i.mName}</option>
                        </c:forEach>
                    </select>
                </p>
                <p><b>PrisonName  :</b>
                    <select name="prisonID" disabled="disabled">
                        <option value="" ${x.pID == null? "selected": ""} ></option>
                        <c:forEach var="i" items="${p.selectAll()}">
                            <option value="${i.pID}" ${x.pID == i.pID? "selected": ""} 
                                    ${param.prisonID == i.pID? "selected": ""}>${i.pName}</option>
                        </c:forEach>
                    </select>
                </p>
                <p>
                    <b>Comment :</b>
                </p>
            </c:forEach>
                <input type="submit" value="Submit" />
        </form>
    </body>
</html>
