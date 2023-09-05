using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using WebApplicationBookStore.Models;

namespace WebApplicationBookStore.Controllers
{
    public class BookController : ApiController
    {
        private HttpClient httpClient;

        public BookController() 
        {
            httpClient = new HttpClient();
        }

        public async Task<string> GetAllBooks(string apiUrl)
        {
            using (HttpResponseMessage response = await httpClient.GetAsync(apiUrl))
            {
                if (response.IsSuccessStatusCode)
                {
                    return await response.Content.ReadAsStringAsync();
                }
                else
                {
                    throw new HttpResponseException(response.StatusCode);
                }

            }
        }

        public async Task<string> GetBookById(string apiUrl, int idBook)
        {
            string url = apiUrl + "/" + idBook;

            using (HttpResponseMessage response = await httpClient.GetAsync(url)) 
            {
                if (response.IsSuccessStatusCode)
                {
                    return await response.Content.ReadAsStringAsync();
                }
                else
                {
                    throw new HttpResponseException(response.StatusCode);
                }
            }
        }

        public async Task<string> UpdateBook(string apiUrl, int idBook, BookApiModel book)
        {
            string url = apiUrl + "/" + idBook;

            using (HttpResponseMessage response = await httpClient.PutAsJsonAsync(url, book))
            {
                if (response.IsSuccessStatusCode)
                {
                    return "Livro atualizado com sucesso!";
                }
                else
                {
                    throw new HttpResponseException(response.StatusCode);
                }
            }
        }

        public async Task<string> AddBook(string apiUrl, BookApiModel book)
        {
            string serializeBook = JsonConvert.SerializeObject(book);
            StringContent content = new StringContent(serializeBook, Encoding.UTF8, "application/json");
            var result = await httpClient.PostAsync(apiUrl, content);

            if (result.IsSuccessStatusCode)
            {
                return "Livro adicionado com sucesso!";
            }
            else
            {
                throw new HttpResponseException(result.StatusCode);
            }
        }

        public async Task<string> DeleteBook(string apiUrl, int idBook)
        {
            string url = apiUrl + "/" + idBook;

            using (HttpResponseMessage response = await httpClient.DeleteAsync(url))
            {
                if (response.IsSuccessStatusCode)
                {
                    return "Livro deletado com sucesso!";
                }
                else
                {
                    throw new HttpResponseException(response.StatusCode);
                }
            }
        }
    }
}