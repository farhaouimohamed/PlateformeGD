<%@ include file="__header.jsp"%>
<%@ include file="menu_ministere.jsp"%>
<section class="page-section">

	<div class="container">
		<div class="row text-center">

			<h1>Liste des Interm�diaires</h1>
		</div>
	</div>
	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nom �tablissement</th>
					<th scope="col">Adresse</th>
					<th scope="col">Nom & pr�nom responsable</th>
					<th scope="col">Contact responsable</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="etab" items="${etablissements}">
					<tr>
						<td><c:out value="${etab.getNomEtablissement()}"></c:out></td>
						<td><c:out value="${etab.getAdresse().getAdresse()}, ${etab.getAdresse().getGouvernorat()}, ${etab.getAdresse().getCodePostale()}"></c:out></td>
						<td>
							<c:forEach items="${etab.getUtilisateurs()}" var="utilisateur">
											<h6>${utilisateur.getNom()}, ${utilisateur.getPrenom()}</h6><br>
										</c:forEach>
						</td>
						<td>
							<c:forEach items="${etab.getUtilisateurs()}" var="utilisateur">
											<c:forEach items="${utilisateur.getTelephone()}" var="tel">
												${tel.getNumero()}, 
											</c:forEach>
										</c:forEach>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../pagination.jsp">
	        	<jsp:param name="currentPage" value="${currentPage}"/>
	        	<jsp:param name="noOfPages" value="${noOfPages}"/>
	        	<jsp:param name="link" value="Liste_Intermediaire"/>
	    </jsp:include>
	</div>

</section>
<%@ include file="__footer.jsp"%>