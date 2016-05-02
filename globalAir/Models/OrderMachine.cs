using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ArcadePool.Models
    {
   public class OrderMachine
        {
        // Set the column order so it appears nice in the database
        [Key, Column(Order = 0)]
        public int OrderId { get; set; }

        [Key, Column(Order = 1)]
        public int MachineId { get; set; }

        // Add the navigation properties
    //    public virtual Order Order { get; set; }
    //    public virtual Machine Machine { get; set; }

        // Add any additional fields you need
        public int OrderLineNumber { get; set; }
        [DataType(DataType.Currency)]
        [Column(TypeName = "money")]
        public decimal Price { get; set; }

        //    public Machine MachineID { get; set; }
     //   [ForeignKey("Gametitle")]

     //   public int GametitleID { get; set; }
     //   public virtual Gametitle GameTitle { get; set; }






        }
    }
