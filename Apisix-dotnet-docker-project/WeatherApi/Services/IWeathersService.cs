using WeatherApi.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WeatherApi.Services
{
    public interface IWeathersService
    {
        public ICollection<Weather> GetAll();
    }
}
