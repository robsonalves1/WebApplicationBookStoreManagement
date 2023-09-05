function getBtnId(event) {
    let btn = event.target;
    let id = btn.getAttribute("data-id");
    ValueHiddenField.value = id;
}

function UpdateBook(event) {
    getBtnId(event);
    let id = ValueHiddenField.value;

    let table = document.getElementById("TableBooks");
    let tr = table.rows[id];
    let elements = tr.querySelectorAll("*");
    document.getElementById("TxbIdBookToUpdate").value = elements[1].innerHTML;
    ValueHiddenField.value = elements[1].innerHTML;
    document.getElementById("TxbNameBookToUpdate").value = elements[2].innerHTML;
    document.getElementById("TxbAutorBookToUpdate").value = elements[3].innerHTML;
    document.getElementById("TxbPriceBookToUpdate").value = elements[4].innerHTML;
}

function DeleteBook(event) {
    getBtnId(event);
    let btn = event.target;

    id = btn.getAttribute("id");
    console.log(id);
    ValueHiddenField.value = id;
}