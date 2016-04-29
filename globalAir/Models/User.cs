using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;


namespace ArcadePool.Models
    {
    public abstract class User
        {
 //       public int ID { get; set; }

        public string FirstName { get; set; }

        public string  LastName { get; set; }

        public string CompanyName { get; set; }


        public int? OrganisationsNummer { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string County { get; set; }
        public string zipCode { get; set; }
        public int? PhoneNr { get; set; }
        public string Email { get; set; }

        }
    }