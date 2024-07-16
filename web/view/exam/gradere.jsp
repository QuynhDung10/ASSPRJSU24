<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Grades</title>
    <script>
        function loadGrades() {
            var cid = document.getElementById("cid").value;
            var sid = document.getElementById("sid").value;
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "viewGrades", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById("gradesTable").innerHTML = xhr.responseText;
                }
            };
            xhr.send("sid=" + sid + "&cid=" + cid);
        }
    </script>
</head>
<body>
    <h1>View Grades</h1>
    <input type="hidden" id="sid" value="${param.sid}"/>
    <table border="1">
        <tr>
            <td>
                <label for="cid">Courses:</label>
                <select name="cid" id="cid" onchange="loadCourses()">
                    <c:forEach items="${requestScope.courses}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
                
                
             
            </td>
            <td>
                <div id="gradesTable">
                    <c:if test="${not empty requestScope.grades}">
                        <h2>Grades for Course: ${param.cid}</h2>
                        <table border="1">
                            <tr>
                                <th>Assessment Name</th>
                                <th>Weight</th>
                                <th>Score</th>
                            </tr>
                            <c:forEach items="${requestScope.grades}" var="grade">
                                <tr>
                                    <td>${grade.exam.assessment.name}</td>
                                    <td>${grade.exam.assessment.weight}</td>
                                    <td>${grade.score}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
            </td>
        </tr>
    </table>
</body>
</html>
