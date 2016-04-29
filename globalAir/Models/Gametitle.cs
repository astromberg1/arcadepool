using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ArcadePool.Models
    {
    public enum EnumPopularity
        {

        Trash = 1,
        ImPopular,
        Okay,
        Popular,
        Awesome

        }
    public class Gametitle
        {

        

        public int GametitleID { get; set; }
        public string GameName { get; set; }
        public DateTime ReleaseDate { get; set; }
        public string Manufacturer { get; set; }
        public EnumPopularity Popularity { get; set; }

        public List<Machine> Machines { get; set; }

        public List<OrderMachine> Orders { get; set; }

        public Gametitle()
            {
            this.Machines = new List<Machine>();
            this.Orders = new List<OrderMachine>();
            }

        }
    }
