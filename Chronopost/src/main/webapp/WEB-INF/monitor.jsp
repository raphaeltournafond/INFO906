<%--
  Created by IntelliJ IDEA.
  User: raphael
  Date: 25/09/2020
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<h1>Monitor</h1>

<!-- Combobox for the package selection -->
<form method="post">
    <div class="form-group">
        <label for="packageId">Package ID</label>
        <select class="form-control" id="idList" name="packageId">
            <!-- Loop through the ids and add them as a selection item -->
            <!-- Select the item if the currently displayed package corresponding to the current id -->
            <c:forEach var="id" items="${ids}">
                <c:choose>
                    <c:when test="${package.id == id}">
                        <option selected="selected">${id}</option>
                    </c:when>
                    <c:otherwise>
                        <option>${id}</option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary">Monitor package</button>
</form>

<!-- If a package have been chosen for the display of information -->
<!-- Generate the table of package status -->
<!-- Make the package status editable by adding a form and some hidden field to make the mapping of the items -->
<c:if test="${package.id != null}">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Latitude</th>
            <th scope="col">Longitude</th>
            <th scope="col">Date</th>
            <th scope="col">State</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="packageStatus" items="${package.packageStatusList}" varStatus="status">
            <tr>
                <th>${packageStatus.location}</th>
                <td>${packageStatus.coordinate.latitude}</td>
                <td>${packageStatus.coordinate.longitude}</td>
                <td>${packageStatus.date}</td>
                <td>${packageStatus.state}</td>
                <td>
                    <form method="get" action="EditPackageStatusServlet">
                        <input type="number" hidden class="form-control" id="hiddenPackageID" name="packageId"
                               value="${package.id}">
                        <input type="number" hidden class="form-control" id="hiddenID" name="packageStatusId"
                               value="${packageStatus.id}">
                        <button type="submit" class="btn btn-primary">
                            Edit
                        </button>
                    </form>

                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

    <!-- Loop until the last package status of the current package -->
    <!-- If the package have not been delivered yet -->
    <!-- Display the form to add a new status -->
    <c:forEach var="item" items="${package.packageStatusList}" varStatus="loop">
        <c:if test="${loop.last}">
            <c:if test="${item.state != 'DELIVERED'}">
                <form method="post" action="AddPackageStatusServlet">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" required id="name" name="name"
                               placeholder="Enter step name">
                    </div>
                    <div class="form-group">
                        <label for="latitude">Latitude</label>
                        <input type="text" class="form-control" required id="latitude" name="latitude"
                               placeholder="Enter package value">
                    </div>
                    <div class="form-group">
                        <label for="longitude">Longitude</label>
                        <input type="text" class="form-control" required id="longitude" name="longitude"
                               placeholder="Enter package value">
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <select class="form-control" id="state" name="state">
                            <option>REGISTRATION</option>
                            <option>PENDING</option>
                            <option selected>TRANSITING</option>
                            <option>BLOCKED</option>
                            <option>DELIVERED</option>
                        </select>
                    </div>
                    <input type="number" hidden id="packageId" name="packageId" value="${package.id}">
                    <button type="submit" class="btn btn-primary">Add</button>
                </form>
            </c:if>
        </c:if>
    </c:forEach>
</c:if>

<%@include file="footer.jsp" %>
