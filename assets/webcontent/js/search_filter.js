let serchbar = document.getElementById("searchbar");
serchbar.addEventListener("keyup", filter);

function filter() {

	  var input, filter, list, elements, par, i, txtValue;
	  input = document.getElementById("searchbar");
	  filter = input.value.toUpperCase();
	  list = document.getElementById("buildingsList");
	  elements = list.getElementsByTagName("li");

	  // Loop through all list items, and hide those who don't match the search query
	  for (i = 0; i < elements.length; i++) {
	    el = elements[i].getElementsByTagName("button")[0];
	    txtValue = el.innerText || el.innerHTML;
	    if (txtValue.toUpperCase().indexOf(filter) > -1) {
	      elements[i].style.display = "";
	    } else {
	      elements[i].style.display = "none";
	    }
	  }
	}