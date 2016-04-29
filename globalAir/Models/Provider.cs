using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;




namespace ArcadePool.Models
    {
    public enum enumRating
        {
        A,
        AA,
        AAA,
        AAAA,
        AAAAA,
        }
    //[Table("Provider")]
    public class Provider : User
        {
        public int ProviderID { get; set; }

        public enumRating Rating { get; set; }

        public List<Machine> Machines { get; set; }

        public List<Order> Orders { get; set; }

        //public User User { get; set; }
        public Provider():base()
            {
        this.Machines = new List<Machine>();
        this.Orders = new List<Order>();

            }

        }
    }
