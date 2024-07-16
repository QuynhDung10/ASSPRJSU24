<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form-actions {
                margin-top: 20px; /* Khoảng cách giữa các phần tử trong form */
            }

            .form-actions button {
                margin-right: 10px; /* Khoảng cách từ nút "Take" đến nút "Back" */
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                padding: 20px;
            }
            .container {
                max-width: 800px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .form-section {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
            }
            .form-section h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .form-section form {
                margin-top: 10px;
            }
            .form-section label {
                display: block;
                margin-bottom: 5px;
            }
            .form-section select, .form-section input[type="submit"] {
                padding: 10px;
                width: 100%;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }
            .form-section input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            .form-section input[type="submit"]:hover {
                background-color: #45a049;
            }
            .exam-list {
                margin-top: 20px;
            }
            .exam-list label {
                display: block;
                margin-bottom: 5px;
            }
            .exam-list input[type="checkbox"] {
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="form-section">
                <h2>View Courses</h2>
                <c:if test="${requestScope.exams eq null}">
                    <c:if test="${requestScope.courses.size() > 0}">
                        <form action="lecturer" method="POST">
                            <input type="hidden" name="lid" value="${param.lid}"/>
                            <label for="cid">Select Course:</label>
                            <select id="cid" name="cid">
                                <c:forEach items="${requestScope.courses}" var="c">
                                    <option value="${c.id}">
                                        ${c.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <input type="submit" value="View"/>
                        </form>
                    </c:if>
                </c:if>
            </div>

            <!--        <div class="form-section">
                        <h2>Take Exams</h2>
            <c:if test="${requestScope.exams ne null}">
                <form action="take" method="GET">
                    <input type="hidden" name="cid" value="${param.cid}"/>
                    <div class="exam-list">
                <c:forEach items="${requestScope.exams}" var="e">
                    <label>
                        <input type="checkbox" name="eid" value="${e.id}" /> 
                    ${e.assessment.name} - (${e.from}:${e.assessment.weight}%)
                </label>
                </c:forEach>
            </div>
            <input type="submit" value="Take"/>
        </form>
            </c:if>
        </div>-->
            <div class="form-section">
                <h2>Take Exams</h2>
                <c:if test="${requestScope.exams ne null}">
                    <form id="takeExamsForm" action="take" method="GET" >
                        <input type="hidden" name="cid" value="${param.cid}"/>
                        <div class="exam-list">

                            <c:forEach items="${requestScope.exams}" var="e">
                                <label>
                                    <input type="checkbox" class="examCheckbox" name="eid" value="${e.id}" /> 
                                    ${e.assessment.name} - (${e.from}:${e.assessment.weight}%)
                                </label><br/>
                            </c:forEach>
                            <label><input type="checkbox" id="checkAll"> Choose All</label><br/>
                        </div>
                        <form action="take" method="GET" onsubmit="return validateForm();">

                            <input type="submit" value="Take"/>
                        </form>



                        <div class="form-actions">
                            <button type="button" onclick="history.back()" class="btn-back">Back</button>
                        </div>

                    </form>
                </c:if>
            </div>

            <script>
                // Function to handle "Check All" checkbox
                document.addEventListener('DOMContentLoaded', function () {
                    var checkAllCheckbox = document.getElementById('checkAll');
                    var examCheckboxes = document.querySelectorAll('.examCheckbox');

                    checkAllCheckbox.addEventListener('change', function () {
                        examCheckboxes.forEach(function (checkbox) {
                            checkbox.checked = checkAllCheckbox.checked;
                        });
                    });
                });
            </script>

            <script>
                function validateForm() {
                    var checkboxes = document.getElementsByName("eid");
                    var isChecked = false;
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (checkboxes[i].checked) {
                            isChecked = true;
                            break;
                        }
                    }
                    if (!isChecked) {
                        alert("Cần phải chọn ít nhất một exam!");
                        return false;
                    }
                    return true;
                }
            </script>

        </div>
    </body>
</html>
