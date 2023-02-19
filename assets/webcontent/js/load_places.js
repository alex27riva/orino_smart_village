class Marker {
    constructor(name, desc, lat, lng){
        this.name = name;
		this.desc = desc;
		this.latitude = lat;
		this.longitude = lng;
    }

    toString(){
    	return this.name + "<br>" + "Coords: <br>" + this.coords[0] + "<br>" + this.coords[1] + "<br>";
    }
}

let arview = document.getElementById("ar-camera");
let markers = [];

function renderPlaces(places) {
	let ar_doc = arview.contentDocument;
    let a_scene = ar_doc.getElementById("scene");

    for(let i = 0; i < places.length; i++) {
		// add icon container
		const iconContainer = ar_doc.createElement("a-entity");
		iconContainer.setAttribute("gps-entity-place", "latitude: " + places[i].latitude + "; longitude: " + places[i].longitude + ";");
		iconContainer.setAttribute("clickhandler", "");
		iconContainer.setAttribute("id", i + "_icon_container");
		a_scene.appendChild(iconContainer);

        // add place icon
        const icon = ar_doc.createElement("a-image");
        icon.setAttribute("gps-entity-place", "latitude: " + places[i].latitude + "; longitude: " + places[i].longitude + ";");
        icon.setAttribute("width", "11");
        icon.setAttribute("height", "16");
        icon.setAttribute("name", places[i].name);
        icon.setAttribute("src", "img/map-marker-orange.png");
        icon.setAttribute("look-at", "[gps-camera]");
        icon.setAttribute("clickhandler", "");
        icon.setAttribute("id", i + "_icon");
        iconContainer.appendChild(icon);

		// add text container
		const textContainer = ar_doc.createElement("a-entity");
		textContainer.setAttribute("gps-entity-place", "latitude: " + places[i].latitude + "; longitude: " + places[i].longitude + ";");
		textContainer.setAttribute("clickhandler", "");
		textContainer.setAttribute("id", i + "_text_container");
		a_scene.appendChild(textContainer);

		// add text
        const text = ar_doc.createElement("a-entity");
        text.setAttribute("text","value: " + places[i].name + "; font: https://cdn.aframe.io/fonts/Monoid.fnt; width: 60; align: center; color: #dd9e06");
        text.setAttribute("position"," 0 12 0");
        text.setAttribute("gps-entity-place", "latitude: " + places[i].latitude + "; longitude: " + places[i].longitude + ";");
        text.setAttribute("look-at", "[gps-camera]");
        text.setAttribute("clickhandler", "");
        text.setAttribute("id", i + "_name");
        textContainer.appendChild(text);
    }
}

function loadSearchbarItems(places) {
	let list = document.getElementById("buildingsList");
	for(let i = 0; i < places.length; i++) {
		const item = document.createElement("li");
		const text = document.createElement("button");
		text.setAttribute("class", "listElement");
		text.setAttribute("data-index", i.toString());
		text.innerHTML = places[i].name;
		text.addEventListener("click", searchbarClickHandler);
		item.appendChild(text);
		list.appendChild(item);
	}
}

function searchbarClickHandler() {
	let event = window.event;
	let src = event.target || event.srcElement;
	let index = src.dataset.index;
	highlight(index);
	src.blur();
}

function highlight(index) {
	for(var i = 0; i<markers.length; i++){
		let element_icon = arview.contentDocument.getElementById(i.toString() + "_icon");
		let element_name = arview.contentDocument.getElementById(i.toString() + "_name");
		if(i == index){
			element_icon.setAttribute("src","img/map-marker-highlight.png");
			element_name.setAttribute("text","value: " + markers[i].name + "; font: https://cdn.aframe.io/fonts/Monoid.fnt; width: 30; align: center; color: #ff000a");
		} else {
			element_icon.setAttribute("src","img/map-marker.png");
			element_name.setAttribute("text","value: " + markers[i].name + "; font: https://cdn.aframe.io/fonts/Monoid.fnt; width: 30; align: center; color: #086e25");
		}
	}
}

arview.contentWindow.onload = () => {
	let httpReq = new XMLHttpRequest();
	httpReq.open("GET", "places.json");
	httpReq.send(null);
	httpReq.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			let json = httpReq.response;
			let obj = JSON.parse(json);
			let places = obj.location;
			for(let i = 0; i < places.length; i++){
				markers.push(new Marker( places[i].name, places[i].description, places[i].latitude, places[i].longitude));
			}
			renderPlaces(markers);
			window.db = obj;
		}
	};
}



