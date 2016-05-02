using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ArcadePool.Models
    {
    public enum EnumPopularity
        {

        Trash = 1,
        ImPopular,
        Okay,
        Popular,
        Awesome

        }
    public class Gametitle
        {

        

        public int GametitleID { get; set; }
        [StringLength(50, MinimumLength = 3)]
        [Required]
        public string GameName { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name = "Start Date")]
        [Required]
        public DateTime ReleaseDate { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string Manufacturer { get; set; }
        public EnumPopularity Popularity { get; set; }

        public ICollection<Machine> Machines { get; set; }

        //public ICollection<OrderMachine> Orders { get; set; }

        public Gametitle()
            {
            this.Machines = new List<Machine>();
           // this.Orders = new List<OrderMachine>();
            }

        }
    }
