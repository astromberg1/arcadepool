using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Data.SqlClient;
using ArcadePool.Models;
using ArcadePool.Controllers;

namespace ArcadePool.DAL
    {
   public class ArcadePoolDBContext : DbContext
        {

        public ArcadePoolDBContext() : base("name = ArcadePoolDBContextConnectionString")
            {
       //     Database.SetInitializer(new MigrateDatabaseToLatestVersion<ArcadePoolDBContext, ArcadePool.Migrations.Configuration>("ArcadePoolDBContextConnectionString"));
            }

        public DbSet<Gametitle> Gametitles { get; set; }

        public DbSet<Machine> Machines { get; set; }


        

        public DbSet<Customer> Customers { get; set; }

        public DbSet<Provider> Providers { get; set; }

        public DbSet<Carrier> Carriers { get; set; }

        public DbSet<Order> Orders { get; set; }

        public DbSet<OrderMachine> Orderlines { get; set; }


        // public DbSet<User> Users { get; set; }

        //protected override void OnModelCreating(DbModelBuilder modelBuilder)
        //    {
        //    modelBuilder.Entity<Customer>().Map(m =>
        //    {
        //        m.MapInheritedProperties();
        //        m.ToTable("Customer");
        //    });



        //    modelBuilder.Entity<Provider>().Map(m =>
        //    {
        //        m.MapInheritedProperties();
        //        m.ToTable("Provider");
        //    });
        //    }


        }
    }
