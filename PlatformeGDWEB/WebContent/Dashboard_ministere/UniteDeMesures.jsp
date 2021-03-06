<%@ include file="__header.jsp"%>
<%@ include file="menu_ministere.jsp"%>
<section class="page-section light-bg">
	<div class="container">
		<h1>Liste des unit?s de mesure</h1>

		<a href="ajout_unite_de_mesure" class="btn btn-success">Ajouter
			une Unit? de mesure</a>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Unit? de mesure</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="udm" items="${udms}">
					<tr id="${udm.getIdUnite()}">
						<td><c:out value="${udm.getIdUnite()}"></c:out></td>
						<td><button class="btn btn-danger btn-sm" id="deleteudm">
								Supprimer</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../pagination.jsp">
			<jsp:param name="currentPage" value="${currentPage}" />
			<jsp:param name="noOfPages" value="${noOfPages}" />
			<jsp:param name="link" value="Liste_unite_de_mesure" />
		</jsp:include>
	</div>
	<script>
		$(document).ready(function() {
			$("button").click(function() {
				let id = $(this).closest('tr').attr('id');
				switch (this.id) {
					case "deleteudm":
						async("delete",{id:id})
						break;
				}
			})
			function async(method,data){
				console.log(data);
				$.ajax({
					url:"Liste_unite_de_mesure?currentPage=1",
					data:data,
					method:method
			})
			.done(
					function(data){
						console.log(data);
						if(data){
							location.href="Liste_unite_de_mesure?currentPage=1"
						}
					}
			);
		}
		})	
</script>
</section>
<%@ include file="__footer.jsp"%>