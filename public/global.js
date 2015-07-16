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