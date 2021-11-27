<%@ include file="__header.jsp"%>
<%@ include file="menu_ministere.jsp"%>
<section class="page-section">

	<div class="container">
		<div class="row text-center">
			<h1>Liste des h�pitaux</h1>
		</div>
		<a href="AjoutEtablissement" class="btn btn-success">Ajouter un
			�tablissement</a>
<!-- 			<a href="Importer_Etablissement" class="btn btn-default">Importer un fichier excel des �tablissements</a> -->
	</div>
	<div class="container">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Nom �tablissement</th>
					<th scope="col">Libell�</th>
					<th scope="col">Adresse</th>
					<th scope="col">Nom & Pr�nom du responsable</th>
					<th scope="col">T�l�phone responsable</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="etab" items="${etablissements}">
					<tr>
						<td><c:out value="${etab.getNomEtablissement()}"></c:out></td>
						<td><c:out value="${etab.getLibelle()}"></c:out></td>
						<td>
							<h5>${etab.getAdresse().getGouvernorat()}<br>${etab.getAdresse().getAdresse()}
											, ${etab.getAdresse().getCodePostale()}
										</h5>
						</td>
						<td>
							<c:forEach items="${etab.getUtilisateurs()}" var="utilisateur">
											<c:if test="${utilisateur.getAccepted() == true}">
												${utilisateur.getPrenom()},${utilisateur.getNom()}<br>
											</c:if>
										</c:forEach>
						</td>
						<td>
							<c:forEach items="${etab.getUtilisateurs()}" var="utilisateur">
											<c:if test="${utilisateur.getAccepted() == true}">
												<c:forEach items="${utilisateur.getTelephone()}" var="tel">
													${tel.getNumero()}/
												</c:forEach>
												<br>
											</c:if>
										</c:forEach>
						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../pagination.jsp">
	        	<jsp:param name="currentPage" value="${currentPage}"/>
	        	<jsp:param name="noOfPages" value="${noOfPages}"/>
	        	<jsp:param name="link" value="Liste_Etablissements"/>
	    </jsp:include>
	</div>

</section>
<%@ include file="__footer.jsp"%>