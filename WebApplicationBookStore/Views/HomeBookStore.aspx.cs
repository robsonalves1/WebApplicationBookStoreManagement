using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplicationBookStore.Controllers;
using WebApplicationBookStore.Models;

namespace WebApplicationBookStore.Views
{
    public partial class HomeBookStore : System.Web.UI.Page
    {
        BookController bookController = new BookController();

        protected async void Page_Load(object sender, EventArgs e)
        {
            await GetBooks("https://localhost:7004/api/Book");
        }

        protected async Task GetBooks(string url)
        {
            string BookJsonString = await bookController.GetAllBooks(url);
            BookApiModel[] bookApiModel = JsonConvert.DeserializeObject<BookApiModel[]>(BookJsonString);
            ShowBooks(bookApiModel);
        }

        protected void ShowBooks(BookApiModel[] bookApiModel)
        {
            TbodyBooks.InnerHtml = "";

            for (int i = 0; i < bookApiModel.Length; i++) 
            {
                TbodyBooks.InnerHtml += "<tr>" +
                                            "<td scope=\"row\">" + i + "</td>" +
                                            "<td>" + bookApiModel[i].Id + "</td>" +
                                            "<td>" + bookApiModel[i].Name + "</td>" +
                                            "<td>" + bookApiModel[i].Autor + "</td>" +
                                            "<td>" + bookApiModel[i].Price + "</td>" +
                                            "<td>" +
                                                "<button type=\"button\" class=\"btn btn-primary\" data-id=\"" + (i + 1) +"\" onClick=\"UpdateBook(event)\" data-bs-toggle=\"modal\" data-bs-target=\"#modalUpdateBook\">Modificar</button>" +
                                                "<button type=\"button\" class=\"btn btn-danger\" id=\"" + bookApiModel[i].Id + "\" data-id=\"" + (i + 1) + "\" onClick=\"DeleteBook(event)\" data-bs-toggle=\"modal\" data-bs-target=\"#modalDeleteBook\">Excluir</button>" +
                                            "</td>" +
                                        "</tr>";
            }
        }


        protected async void BtnUpdateBook_Click(object sender, EventArgs e)
        {
            BookApiModel book = new BookApiModel();
            book.Id = Convert.ToInt32(ValueHiddenField.Value);
            book.Name = TxbNameBookToUpdate.Value.Trim();
            book.Autor = TxbAutorBookToUpdate.Value.Trim();
            book.Price = Convert.ToDouble(TxbPriceBookToUpdate.Value.Trim());

            await bookController.UpdateBook("https://localhost:7004/api/Book", book.Id, book);
            await GetBooks("https://localhost:7004/api/Book");
        }

        protected async void BtnAddBook_Click(object sender, EventArgs e)
        {
            BookApiModel book = new BookApiModel();
            book.Name = TxbNameBookToAdd.Value.Trim();
            book.Autor = TxbAutorBookToAdd.Value.Trim();
            book.Price = Convert.ToDouble(TxbPriceBookToAdd.Value.Trim());

            await bookController.AddBook("https://localhost:7004/api/Book", book);
            await GetBooks("https://localhost:7004/api/Book");
        }

        protected async void BtnDeleteBook_Click(object sender, EventArgs e)
        {
            BookApiModel book = new BookApiModel();
            book.Id = Convert.ToInt32(ValueHiddenField.Value);

            await bookController.DeleteBook("https://localhost:7004/api/Book", book.Id);
            await GetBooks("https://localhost:7004/api/Book");
        }

    }
}