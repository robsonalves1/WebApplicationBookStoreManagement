using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplicationBookStore.Models
{
    public class BookApiModel
    {
        [JsonProperty("id")]
        public int Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("autor")]
        public string Autor { get; set; }

        [JsonProperty("price")]
        public double Price { get; set; }
    }
}