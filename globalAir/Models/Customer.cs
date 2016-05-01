using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ArcadePool.Models
    {
   // [Table("Customer")]
    public class Customer:User
        {
        public int CustomerID { get; set; }
        [DataType(DataType.Currency)]
        [Column(TypeName = "money")]
        public decimal CreditLine { get; set; }

        //public User User { get; set; }
        public List<Order> Orders { get; set; }
        public Customer():base()
            {
            this.Orders = new List<Order>();
            }

        }
    }
