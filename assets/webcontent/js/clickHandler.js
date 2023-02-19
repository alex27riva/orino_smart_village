AFRAME.registerComponent("clickhandler", {
	init: function () {
		this.el.addEventListener("click", function (evt) {
			let icon = evt.target || evt.srcElement;
			let index = parseInt(icon.getAttribute("id"));
			let panel = parent.document.getElementById("info-panel");
			let el = parent.db.location[index];
			panel.innerHTML = "";
			let backBtn = parent.document.createElement("button");
			backBtn.setAttribute("class", "button close");
			backBtn.setAttribute("onClick", "btnClose()");
			panel.appendChild(backBtn);
			
			// Panel title
			let title = parent.document.createElement("h1");
			title.innerHTML = el.name;
			panel.appendChild(title);

			// Panel description
			let description = parent.document.createElement("h2");
			description.innerHTML = el.description;
			panel.appendChild(description)

			parent.displayInfoPanel();
		});
	}
});
