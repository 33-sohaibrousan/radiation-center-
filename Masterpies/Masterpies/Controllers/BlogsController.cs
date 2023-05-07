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
    public class BlogsController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: Blogs
        public ActionResult Index()
        {
            var blogs = db.Blogs.Include(b => b.AspNetUser);
            return View(blogs.ToList());
        }
        public ActionResult Blog()
        {
            var blogs = db.Blogs.Include(b => b.AspNetUser);
            return View(blogs.ToList());
        }
        public ActionResult Blogsingle(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var blog = db.Blogs.Include(b => b.AspNetUser).SingleOrDefault(b => b.id == id);

            if (blog == null)
            {
                return HttpNotFound();
            }

            return View(new List<Blog> { blog });
        }



        // GET: Blogs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // GET: Blogs/Create
        public ActionResult Create()
        {
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Blogs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles ="Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,image,title,text,aspuser")] Blog blog, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {

                string folderPath = Server.MapPath("~/Content/Images/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                string fileName = Path.GetFileName(image.FileName);
             
                string path = Path.Combine(folderPath, fileName);
          

                image.SaveAs(path);
             
                blog.image = "../Content/Images/" + fileName;

                db.Blogs.Add(blog);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", blog.aspuser);
            return View(blog);
        }

        // GET: Blogs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", blog.aspuser);
            return View(blog);
        }

        // POST: Blogs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,image,title,text,aspuser")] Blog blog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(blog).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.aspuser = new SelectList(db.AspNetUsers, "Id", "Email", blog.aspuser);
            return View(blog);
        }

        // GET: Blogs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Blog blog = db.Blogs.Find(id);
            if (blog == null)
            {
                return HttpNotFound();
            }
            return View(blog);
        }

        // POST: Blogs/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Blog blog = db.Blogs.Find(id);
            db.Blogs.Remove(blog);
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
