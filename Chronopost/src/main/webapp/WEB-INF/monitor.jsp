<%--
  Created by IntelliJ IDEA.
  User: raphael
  Date: 25/09/2020
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<h1>Monitor</h1>
<p><c:out value="Bonjour !" /></p>
<form method="get">
    <div class="form-group">
        <label for="id">Package's ID</label>
        <input type="number" class="form-control" id="id" placeholder="Enter package ID">
    </div>
    <button type="submit" class="btn btn-primary">Monitor package</button>
</form>
<%@include file="footer.jsp"%>
