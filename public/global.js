albums_btn = document.getElementById("albums_button")
albums_div = document.getElementById("album_links")


var showAlbums = function() {
  if (albums_div.style.display == "initial") {
    albums_div.style.display = "none"
  } else {
    albums_div.style.display = "initial"
  }
}


albums_btn.addEventListener("click", showAlbums)


photographers_btn = document.getElementById("photographers_button")
photographers_div = document.getElementById("photographer_links")


var showPhotographers = function() {
  if (photographers_div.style.display == "initial") {
    photographers_div.style.display = "none"
  } else {
    photographers_div.style.display = "initial"
  }
}


photographers_btn.addEventListener("click", showPhotographers)