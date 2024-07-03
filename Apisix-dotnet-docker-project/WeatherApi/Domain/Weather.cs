using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WeatherApi.Domain
{
    public class Weather
    {
        public string City { get; set; }
        public double Temperature { get; set; }
        public string Condition { get; set; }
    }
}
