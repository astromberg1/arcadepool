using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ArcadePool.Models
    {
    public class Order
        {
        public int OrderID { get; set; }

        public int ContractNumber { get; set; }

        public DateTime  OrderDate { get; set; }

        public DateTime ShippingDate { get; set; }
        public DateTime RentalDate { get; set; }
        public DateTime ReturnDate { get; set; }

        public decimal Price { get; set; }


        public Customer CustomerID { get; set; }
        public Provider ProviderID { get; set; }

        public Carrier CarrierID { get; set; }

        public List<Machine> Machines { get; set; }

        public Order()
            {
            this.Machines = new List<Machine>();
            //this.Routes = new HashSet<>();
            }





        }
    }