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



        [Required]
        public string SerialNumber { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Start Date")]
        [Required]
        public DateTime PurchaseDate { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        [Column(TypeName = "money")]
        public decimal DailyRentalprice { get; set; }

        
        [ForeignKey("Gametitle")]

        public int GametitleID { get; set; }

        virtual public Gametitle Gametitle { get; set; }


        //[not Required]
        //AddForeignKey("dbo.Stories", "StatusId", "dbo.Status", "StatusID", cascadeDelete: false);
        [ForeignKey("Provider")]

        public int? ProviderID { get; set; }

        public virtual Provider Provider { get; set; }

        //public List<OrderMachine> Orders { get; set; }

        public virtual ICollection<OrderMachine> Orderlines { get; set; }

        public Machine()
            {
           
          //  this.Orders = new List<OrderMachine>();

            }


        }
    }
