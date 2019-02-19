using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebFroms.Models
{
    public class City
    {
        public int IDCity { get; set; }
        public string Name { get; set; }

        //public IList<City> GetCities()
        //{
        //    IList<City> cities = new List<City>();
        //    cities.Add(new City { IDCity = 1, Name = "Zagreb" });
        //    cities.Add(new City { IDCity = 2, Name = "Varaždin" });
        //    cities.Add(new City { IDCity = 3, Name = "Split" });
        //    cities.Add(new City { IDCity = 4, Name = "Rijeka" });
        //    cities.Add(new City { IDCity = 5, Name = "Pula" });
        //    cities.Add(new City { IDCity = 5, Name = "Osijek" });
        //    cities.Add(new City { IDCity = 5, Name = "Dubrovnik" });
        //    return cities;
        //}
        public int GetIDCity()
        {
            return IDCity;
        }
        public string GetName()
        {
            return Name;
        }

    }
}