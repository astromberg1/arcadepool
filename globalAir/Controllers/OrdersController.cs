﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArcadePool.DAL;
using ArcadePool.Models;

namespace ArcadePool.Controllers
{
    public class OrdersController : Controller
    {
        private ArcadePoolDBContext db = new ArcadePoolDBContext();

        // GET: Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Carrier).Include(o => o.Customer).Include(o => o.Provider);
            return View(orders.ToList());
        }

        // GET: Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Order order = db.Orders.Find(id);
           
            

            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            ViewBag.CarrierID = new SelectList(db.Carriers, "CarrierID", "CarrierName");
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "OrganisationsNummer");
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer");
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderID,ContractNumber,OrderDate,ShippingDate,RentalDate,ReturnDate,Price,CustomerID,ProviderID,CarrierID")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(order);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CarrierID = new SelectList(db.Carriers, "CarrierID", "CarrierName", order.CarrierID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "OrganisationsNummer", order.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", order.ProviderID);
            return View(order);
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.CarrierID = new SelectList(db.Carriers, "CarrierID", "CarrierName", order.CarrierID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "OrganisationsNummer", order.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", order.ProviderID);
            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderID,ContractNumber,OrderDate,ShippingDate,RentalDate,ReturnDate,Price,CustomerID,ProviderID,CarrierID")] Order order)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CarrierID = new SelectList(db.Carriers, "CarrierID", "CarrierName", order.CarrierID);
            ViewBag.CustomerID = new SelectList(db.Customers, "CustomerID", "OrganisationsNummer", order.CustomerID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", order.ProviderID);
            return View(order);
        }

        // GET: Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
