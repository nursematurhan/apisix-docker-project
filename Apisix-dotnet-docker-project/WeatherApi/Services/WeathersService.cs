using WeatherApi.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WeatherApi.Services
{
    public class WeathersService : IWeathersService
    {
        public ICollection<Weather> GetAll()
        {
            return new List<Weather>()
            {
                new Weather(){ City="New York", Temperature = 25.0, Condition = "Sunny"},
                new Weather(){ City="London", Temperature = 15.0, Condition = "Cloudy"},
                new Weather(){ City="Tokyo", Temperature = 30.0, Condition = "Clear"},
                new Weather(){ City="Paris", Temperature = 20.0, Condition = "Rainy"},
                new Weather(){ City="Sydney", Temperature = 22.0, Condition = "Windy"}               
            };
        }
    }
}
