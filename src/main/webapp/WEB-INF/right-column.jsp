<!-- This div menages everything displayed in the right side of the main page -->
<div class="right-column ml-5">
	<div class="input-group mb-3">
		<span class="input-group-text" id="basic-addon1"><i
			class="fa-solid fa-magnifying-glass"></i></span> <input type="text"
			class="form-control" placeholder="search" aria-label="search"
			aria-describedby="basic-search">
	</div>

	<div class="card p-3">
		<h3>Who to follow?</h3>
		
		<!-- This forEach iterates through all the users in our database and retrieves the first two. 
		We need to work on retrieving random users and preventing the retrieval of the logged-in user. However, I think it looks better than having default users -->
		<c:forEach var="user" items="${users}" begin="0" end="1">
			<div class="d-flex justify-content-evenly mb-3 align-items-center">
				<img src="https://i.pravatar.cc/150?u=${user.id }" class="rounded"
					alt="avatar" style="width: 64px; height: 64px">
					<%-- <img alt="" src="https://ui-avatars.com/api/?name=${user.username}&length=1"> --%>
					
				<label>${user.username}</label>
				<button class="btn btn-dark btn-sm">Follow</button>
			</div>
		</c:forEach>


	</div>



</div>


</div>



</div>