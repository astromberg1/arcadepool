using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ArcadePool.Models
    {
    public class Machine
        {
        public int MachineID { get; set; }
        public string SerialNumber { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Start Date")]

        public DateTime PurchaseDate { get; set; }
        [DataType(DataType.Currency)]
        [Column(TypeName = "money")]
        public decimal DailyRentalprice { get; set; }
        public Gametitle Gametitle { get; set; }

        //[ForeignKey("Provider")]
        public Provider ProviderID { get; set; }

        //public List<OrderMachine> Orders { get; set; }

        public virtual ICollection<OrderMachine> Orderlines { get; set; }

        public Machine()
            {
           
          //  this.Orders = new List<OrderMachine>();

            }


        }
    }
