<header class="shadow">
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid px-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarButtonsExample"
				aria-expanded="false">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a href="/home" class="navbar-brand">
				<h3>
					<i class="fa-solid fa-circle-question fa-2xl"></i> What if
				</h3>
			</a>

			<div class="collapse navbar-collapse " id="navbarButtonsExample">

				<div
					class="d-flex align-items-center justify-content-between ms-auto">

						<img src="https://i.pravatar.cc/150?u=${loggedUser.id }" class="rounded" alt="avatar"
								style="width: 64px; height: 64px">${loggedUser.firstname}</a>
						</div >  <a href="/logOut"
						class="text-decoration-none btn btn-dark mx-2 px-3 pt-1"><i
						class="fa-solid fa-right-from-bracket fa-xl"></i></a>
				</div>
			</div>
		</div>
	</nav>
</header>