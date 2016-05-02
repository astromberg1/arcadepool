using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace ArcadePool.Models
    {
    public class Order
        {
        public int OrderID { get; set; }

        public int ContractNumber { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime  OrderDate { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]

        public DateTime ShippingDate { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime RentalDate { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime ReturnDate { get; set; }

        [DataType(DataType.Currency)]
        [Column(TypeName = "money")]
        public decimal Price { get; set; }

        [ForeignKey("Customer")]
        public int CustomerID { get; set; }
        public virtual Customer Customer { get; set; }



        [ForeignKey("Provider")]

        public int ProviderID { get; set; }
        public virtual Provider Provider { get; set; }

        //Foreign key for Standard
        public int CarrierRefId { get; set; }

        [ForeignKey("CarrierRefId")]
        
        public Carrier Carrier { get; set; }

        //public List<Machine> Machines { get; set; }

        public virtual ICollection<OrderMachine> Orderlines { get; set; }

        public Order()
            {
          //  this.Machines = new List<Machine>();
            //this.Routes = new HashSet<>();
            }





        }
    }