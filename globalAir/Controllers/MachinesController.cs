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
    public class MachinesController : Controller
    {
        private ArcadePoolDBContext db = new ArcadePoolDBContext();

        // GET: Machines
        public ActionResult Index()
        {
            var machines = db.Machines.Include(m => m.Gametitle).Include(m => m.Provider);
            return View(machines.ToList());
        }

        // GET: Machines/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Machine machine = db.Machines.Find(id);
            if (machine == null)
            {
                return HttpNotFound();
            }
            return View(machine);
        }

        // GET: Machines/Create
        public ActionResult Create()
        {
            ViewBag.GametitleID = new SelectList(db.Gametitles, "GametitleID", "GameName");
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer");
            return View();
        }

        // POST: Machines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MachineID,SerialNumber,PurchaseDate,DailyRentalprice,GametitleID,ProviderID")] Machine machine)
        {
            if (ModelState.IsValid)
            {
                db.Machines.Add(machine);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.GametitleID = new SelectList(db.Gametitles, "GametitleID", "GameName", machine.GametitleID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", machine.ProviderID);
            return View(machine);
        }

        // GET: Machines/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Machine machine = db.Machines.Find(id);
            if (machine == null)
            {
                return HttpNotFound();
            }
            ViewBag.GametitleID = new SelectList(db.Gametitles, "GametitleID", "GameName", machine.GametitleID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", machine.ProviderID);
            return View(machine);
        }

        // POST: Machines/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MachineID,SerialNumber,PurchaseDate,DailyRentalprice,GametitleID,ProviderID")] Machine machine)
        {
            if (ModelState.IsValid)
            {
                db.Entry(machine).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.GametitleID = new SelectList(db.Gametitles, "GametitleID", "GameName", machine.GametitleID);
            ViewBag.ProviderID = new SelectList(db.Providers, "ProviderID", "OrganisationsNummer", machine.ProviderID);
            return View(machine);
        }

        // GET: Machines/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Machine machine = db.Machines.Find(id);
            if (machine == null)
            {
                return HttpNotFound();
            }
            return View(machine);
        }

        // POST: Machines/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Machine machine = db.Machines.Find(id);
            db.Machines.Remove(machine);
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
