﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ArcadePool.Models
    {
    public abstract class User
        {
        //       public int ID { get; set; }
        
        [StringLength(50, MinimumLength = 3)]

        [DisplayFormat(DataFormatString = "{0:999999-9999}", ApplyFormatInEditMode = true)]
        [Index(IsUnique = true)]
        [Required]
        public string OrganisationsNummer { get; set; }

        [StringLength(50, MinimumLength = 2)]
        public string CompanyName { get; set; }


        [StringLength(50, MinimumLength = 2)]
        public string FirstName { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string  LastName { get; set; }
      




        [StringLength(50, MinimumLength = 3)]
        public string Street { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string City { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string County { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string zipCode { get; set; }
        [StringLength(50, MinimumLength = 3)]
           
        public string PhoneNr { get; set; }
        [StringLength(50, MinimumLength = 3)]
        public string Email { get; set; }

        }
    }