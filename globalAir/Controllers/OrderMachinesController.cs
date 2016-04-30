using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArcadePool.DAL;
using ArcadePool.Models;

namespace globalAir.Controllers
{
    public class OrderMachinesController : Controller
    {
        private ArcadePoolDBContext db = new ArcadePoolDBContext();

        // GET: OrderMachines
        public ActionResult Index()
        {
            return View(db.Orderlines.ToList());
        }

        // GET: OrderMachines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderMachine orderMachine = db.Orderlines.Find(id);
            if (orderMachine == null)
            {
                return HttpNotFound();
            }
            return View(orderMachine);
        }

        // GET: OrderMachines/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrderMachines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderId,MachineId,OrderLineNumber,Price")] OrderMachine orderMachine)
        {
            if (ModelState.IsValid)
            {
                db.Orderlines.Add(orderMachine);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(orderMachine);
        }

        // GET: OrderMachines/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderMachine orderMachine = db.Orderlines.Find(id);
            if (orderMachine == null)
            {
                return HttpNotFound();
            }
            return View(orderMachine);
        }

        // POST: OrderMachines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderId,MachineId,OrderLineNumber,Price")] OrderMachine orderMachine)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orderMachine).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(orderMachine);
        }

        // GET: OrderMachines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderMachine orderMachine = db.Orderlines.Find(id);
            if (orderMachine == null)
            {
                return HttpNotFound();
            }
            return View(orderMachine);
        }

        // POST: OrderMachines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrderMachine orderMachine = db.Orderlines.Find(id);
            db.Orderlines.Remove(orderMachine);
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
