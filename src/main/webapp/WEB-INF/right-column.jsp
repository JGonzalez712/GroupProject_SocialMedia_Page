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

		<!--  <div class="d-flex justify-content-between mb-3">
            <img src="https://avatar.iran.liara.run/public" class="rounded" alt="avatar" style="width:64px; height:64px">
            <div class="">
                <label>Name</label>
                <p>@Name</p>            
            </div>
            <button class="btn btn-dark">Follow</button>
        </div>

        <div class="d-flex justify-content-between mb-3">
            <img src="https://avatar.iran.liara.run/public" class="rounded" alt="avatar" style="width:64px; height:64px">
            <div class="">
                <label>username</label>
                <p>{idsplaytheactualusername}</p>            
            </div>
            <button class="btn btn-dark">Follow</button>
        </div> -->


		<!-- This forEach iterates through all the users in our database and retrieves the first two. 
		We need to work on retrieving random users and preventing the retrieval of the logged-in user. However, I think it looks better than having default users -->
		<c:forEach var="user" items="${users}" begin="0" end="1">
			<div class="d-flex justify-content-between mb-3">
				<img src="https://avatar.iran.liara.run/public" class="rounded"
					alt="avatar" style="width: 64px; height: 64px">
				<div class="">
					<label>Username:</label>
					<p>${user.username}</p>
				</div>
				<button class="btn btn-dark">Follow</button>
			</div>
		</c:forEach>


	</div>



</div>


</div>



</div>