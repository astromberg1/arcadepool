﻿using System;

using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ArcadePool.Models
    {
    public class Carrier
        {
      
        public int CarrierID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string CarrierName { get; set; }

        public ICollection<Order> Orders { get; set; }
        public Carrier()

            {
            this.Orders = new List<Order>();
            }

        }
    }
