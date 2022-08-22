<%-- 
    Document   : report
    Created on : Aug 19, 2022, 12:11:52 AM
    Author     : HUNGLM
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="web/report.css" type="text/css">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="dt" class="helper.DateTimeHelper"/>
      
          
            <h1 >
                BANG CHAM CONG THANG :  8
                
         </h1>
                   
     
        
          <c:forEach items="${s.workingTimes}" var="wt">
                                <c:if test="${wt.cidate eq d}">
                                   ${wt.workShift.wname} <br> ${wt.getWorking()}                       
                                </c:if>
                            </c:forEach>
        <table class="ta" >
            <tr style="background-color:skyblue">
                <th rowspan="2">Name</th>
                <th rowspan="2">NV</th>
           <th rowspan="2">Position</th> 
                
                <c:forEach items="${requestScope.dates}" var="d">
                    <c:if test="${dt.getDayOfMonth(d) <17 }">
                        
                   
                    <td
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                        >
                        
                        
                        <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>
                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                    </td>
                    
                     
                     </c:if>
                    </c:forEach>
               
               
            </tr>
                 <tr style="background-color:skyblue">
         
        <c:forEach items="${requestScope.dates}" var="d">
                    <c:if test="${dt.getDayOfMonth(d) <17 }">
                        
                   
                    <td
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                        >
                        Work Shift
                 </td>
                  </c:if>
                    </c:forEach>
                 
        </tr>
            <c:forEach items="${requestScope.staffs}" var="s">
                <tr>
                    
                    <td>${s.sname}</td>
                    <td >${s.nvname}</td>
                    <td>${s.salary.saname}</td>
           
                    <c:forEach items="${requestScope.dates}" var="d">
                        <c:if test="${dt.getDayOfMonth(d) <17 }">
                        <td 
                            <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                            >

                            <c:forEach items="${s.workingTimes}" var="wt">
                                <c:if test="${wt.cidate eq d}">
                                   ${wt.workShift.wname} <br> 
                                   ${wt.getWork() } 
                                
                                </c:if>
                                  
                                 
                            </c:forEach>
                                  
                        </td>
                        </c:if>
                    </c:forEach>
                 
                </tr>
            </c:forEach>
                        
                
                                        
        </table  >
         <br>
         
         
         
         
         <table class="tb" border="1px">
            
                 <tr style="background-color:skyblue">
                <th rowspan="2">Name</th>
                <th rowspan="2">NV</th>
           <th rowspan="2">Position</th> 
                <c:forEach items="${requestScope.dates}" var="d" >
                    <c:if test="${dt.getDayOfMonth(d) >16 }">
                        
                   
                    <td class="a"
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                        >
                        
                        
                        <fmt:formatDate pattern = "dd" 
                                    value = "${d}" /> <br/>
                    <fmt:formatDate pattern = "EEE" 
                                    value = "${d}" />
                    </td>
                     </c:if>
                    </c:forEach>
               
                <td rowspan="2" width="5.5%">Working hours</td>
            </tr>
            <tr style="background-color:skyblue">
                   <c:forEach items="${requestScope.dates}" var="d">
                    <c:if test="${dt.getDayOfMonth(d) >16 and dt.getDayOfMonth(d) < 32  }">
                        
                   
                    <td
                        <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                        >
                        Work Shift
                 </td>
                  </c:if>
                    </c:forEach>
                 
        </tr>
            <c:forEach items="${requestScope.staffs}" var="s">
                <tr>
                    <td>${s.sname}</td>
                    
                    <td >${s.nvname}</td>
                    <td>${s.salary.saname}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <c:if test="${dt.getDayOfMonth(d) >16  }">
                        <td 
                            <c:if test="${dt.getDayOfWeek(d) eq 6 or dt.getDayOfWeek(d) eq 7}">
                                style="background-color: rgb(142,170,219);"
                            </c:if>
                            >
                            
                            <c:forEach items="${s.workingTimes}" var="wt">
                                 
                                <c:if test="${wt.cidate eq d}">
                                   ${wt.workShift.wname} <br> 
                                   ${wt.getWork() } 
                                
                                </c:if>
                                       <c:if test="${wt.cidate eq null}">
                                   
                                   ${wt.getWork() } 
                                
                                </c:if>
                            </c:forEach>
                        </td>
                        </c:if>
                    </c:forEach>
                        <td class="">${s.getNumberOfWorkingHours()}</td>
                </tr>
                
            </c:forEach>
                        
                   
                                        
        </table>
        
         <h2  style="color:  red">Note: </h2>
      <div >S: Morning Shift</div>
      <div>C: Afternoon Shift</div>
      <div>Full: FullTime</div>
         <h1>Salary</h1>
      <table class="tb" border="1px" >
          <tr style="background: rgb(255,255,204)">
          <th>Name</th>
          <th>Salary/Hour</th>
          <th>Bonus Salary</th>
          <th>Deduction Salary</th>
          <th>Advance Salary</th>
          <th>Salary Total</th>
        </tr>
        <c:forEach items="${requestScope.staffs}" var="s">
        <tr>
           <td>${s.sname}</td>
          <td>${s.salary.salary}</td>
          <td>${s.management.bonus}</td>
          <td>${s.management.deduction}</td>
        <td>${s.management.advance}</td>
          <td>${s.getNumberofSalary()}</td>

        </tr>
      
      
          </c:forEach>
      </table>
         
           
    </body>
</html>
