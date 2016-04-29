using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;

namespace ArcadePool.Models
    {
    public class Machine
        {
        public int MachineID { get; set; }
        public string SerialNumber { get; set; }
        public DateTime PurchaseDate { get; set; }
        public decimal DailyRentalprice { get; set; }
        public Gametitle Gametitle { get; set; }

        //[ForeignKey("Provider")]
        public Provider ProviderID { get; set; }

        public List<OrderMachine> Orders { get; set; }

        public Machine()
            {
           
            this.Orders = new List<OrderMachine>();

            }


        }
    }
