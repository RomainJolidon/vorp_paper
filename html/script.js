function setMessage(message, author) {
    $("#text-message").text(message);
    $("#text-message").show();

	$("#text-signature").text(author);
	$("#text-signature").show();
	$("#letter-separator").hide();

}

function setRecipe(title, ingredients) {
	$("#recipe-title").text(title);
	$("#recipe-title").show();

	ingredients.forEach(ingr => {
		$("#list-recipe").append(`<li>${ingr}</li>`)
	});
	$("#letter-separator").show();
    $("#list-recipe").show();
}

$("document").ready(function () {
	$("#letter-container").draggable({
		cursor: "move",
		start: function(event, ui) {
			$(this).draggable('instance').offset.click = {
				left: Math.floor(ui.helper.width() / 10),
				top: Math.floor(ui.helper.height() / 10)
			};
		}
	});
    $("body").hide();

    $("body").on("keyup", function(key) {
        if (Config.closeKeys.includes(key.which)) {
            $.post("http://vorp_paper/NUIFocusOff", JSON.stringify({}));
        }
    });
})

function setLetterHud()
{
	reset();
	$("#recipeHud").hide();
	$("#letterHud").show();
}

function setRecipeHud()
{
	reset();
	$("#letterHud").hide();
	$("#recipeHud").show();
}

function reset() {
	$("#letter-separator").hide();
	$("#list-recipe").html("");
	$("#recipe-title").html("");
	$("#text-message").text("");
	$("#text-signature").text("");
}

window.addEventListener('message', (event) => {
	/**
	 * @type {{
	 *     action: string,
	 *     message: string,
	 *     author: string,
	 *     title: string,
	 *     ingredients: string[]
	 * }}
	 * */
	const data = event.data;


	switch (data.action) {
		case 'open':
			$("body").show();
			break;
		case 'close':
			$("body").hide();
			break;
		case 'set_message':
			setLetterHud();
			setMessage(data.message, data.author, false);
			break;
		case 'set_recipe':
			setRecipeHud();
			setRecipe(data.title, data.ingredients);
			break;
		default:
			return;
	}
});


