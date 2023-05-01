using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using Masterpies.Models;

namespace Masterpies.Controllers
{
    public class radiographersController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: radiographers
        public ActionResult Index()
        {
            return View(db.radiographers.ToList());
        }

        // GET: radiographers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            radiographer radiographer = db.radiographers.Find(id);
            if (radiographer == null)
            {
                return HttpNotFound();
            }
            return View(radiographer);
        }

        // GET: radiographers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: radiographers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,imageemployee,Job_title")] radiographer radiographer , HttpPostedFileBase imageemployee)
        {
            if (ModelState.IsValid)
            {

                string folderPath = Server.MapPath("~/Content/Images");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                string fileName = Path.GetFileName(imageemployee.FileName);
                string path = Path.Combine(folderPath, fileName);
                imageemployee.SaveAs(path);

                radiographer.imageemployee = "../Content/Images/" + fileName;   
                db.radiographers.Add(radiographer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(radiographer);
        }

        // GET: radiographers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            radiographer radiographer = db.radiographers.Find(id);
            if (radiographer == null)
            {
                return HttpNotFound();
            }
            return View(radiographer);
        }

        // POST: radiographers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,imageemployee,Job_title")] radiographer radiographer, HttpPostedFileBase imageemployee)
        {
            if (ModelState.IsValid)
            {
                string folderPath = Server.MapPath("~/Content/Images");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                string fileName = Path.GetFileName(imageemployee.FileName);
                string path = Path.Combine(folderPath, fileName);
                imageemployee.SaveAs(path);

                radiographer.imageemployee = "../Content/Images/" + fileName;
                db.Entry(radiographer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(radiographer);
        }

        // GET: radiographers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            radiographer radiographer = db.radiographers.Find(id);
            if (radiographer == null)
            {
                return HttpNotFound();
            }
            return View(radiographer);
        }

        // POST: radiographers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            radiographer radiographer = db.radiographers.Find(id);
            db.radiographers.Remove(radiographer);
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
