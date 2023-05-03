using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Masterpies.Models;

namespace Masterpies.Controllers
{
    public class commentsController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: comments
        public ActionResult Index()
        {
            var comments = db.comments.Include(c => c.AspNetUser).Include(c => c.Blog).Include(c => c.User);
            return View(comments.ToList());
        }

        // GET: comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comment comment = db.comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: comments/Create
        public ActionResult Create()
        {
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.id_blog = new SelectList(db.Blogs, "id", "image");
            ViewBag.user_id = new SelectList(db.Users, "iduser", "userName");
            return View();
        }

        // POST: comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,Email,comment1,aspuser,user_id,id_blog")] comment comment)
        {
            if (ModelState.IsValid)
            {
                db.comments.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", comment.aspuser);
            ViewBag.id_blog = new SelectList(db.Blogs, "id", "image", comment.id_blog);
            ViewBag.user_id = new SelectList(db.Users, "iduser", "userName", comment.user_id);
            return View(comment);
        }

        // GET: comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comment comment = db.comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", comment.aspuser);
            ViewBag.id_blog = new SelectList(db.Blogs, "id", "image", comment.id_blog);
            ViewBag.user_id = new SelectList(db.Users, "iduser", "userName", comment.user_id);
            return View(comment);
        }

        // POST: comments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,Email,comment1,aspuser,user_id,id_blog")] comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", comment.aspuser);
            ViewBag.id_blog = new SelectList(db.Blogs, "id", "image", comment.id_blog);
            ViewBag.user_id = new SelectList(db.Users, "iduser", "userName", comment.user_id);
            return View(comment);
        }

        // GET: comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comment comment = db.comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            comment comment = db.comments.Find(id);
            db.comments.Remove(comment);
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
