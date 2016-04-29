using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArcadePool;
using ArcadePool.DAL;
using ArcadePool.Models;


namespace globalAir.Controllers
{
    public class GametitlesController : Controller
    {
        private ArcadePoolDBContext db = new ArcadePoolDBContext();

        // GET: Gametitles
        public ActionResult Index()
        {
            return View(db.Gametitles.ToList());
        }

        // GET: Gametitles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gametitle gametitle = db.Gametitles.Find(id);
            if (gametitle == null)
            {
                return HttpNotFound();
            }
            return View(gametitle);
        }

        // GET: Gametitles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Gametitles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GametitleID,GameName,ReleaseDate,Manufacturer,Popularity")] Gametitle gametitle)
        {
            if (ModelState.IsValid)
            {
                db.Gametitles.Add(gametitle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(gametitle);
        }

        // GET: Gametitles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gametitle gametitle = db.Gametitles.Find(id);
            if (gametitle == null)
            {
                return HttpNotFound();
            }
            return View(gametitle);
        }

        // POST: Gametitles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GametitleID,GameName,ReleaseDate,Manufacturer,Popularity")] Gametitle gametitle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gametitle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gametitle);
        }

        // GET: Gametitles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Gametitle gametitle = db.Gametitles.Find(id);
            if (gametitle == null)
            {
                return HttpNotFound();
            }
            return View(gametitle);
        }

        // POST: Gametitles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Gametitle gametitle = db.Gametitles.Find(id);
            db.Gametitles.Remove(gametitle);
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
