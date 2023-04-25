using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Masterpies.Models;
using Microsoft.AspNet.Identity;

namespace Masterpies.Controllers
{
    public class UsersController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: Users
        public ActionResult Index()
        {
            //var userapp = db.Users.ToList();
            var devices = db.Devices.ToList();
            var appointment = db.Appointments.ToList();

            var users = db.Users.Include(u => u.AspNetUser);
            return View(Tuple.Create(users, devices, appointment));
            //return View(users.ToList());
        }
        public ActionResult profile1()
        {
            // Get the current user's ASP.NET Identity ID
            var login = User.Identity.GetUserId();

            // Retrieve the user's information based on their ASP.NET Identity ID
            var user = db.Users.Include(u => u.AspNetUser).FirstOrDefault(u => u.aspuserid == login);

            if (user == null)
            {
                return HttpNotFound();
            }

            // Pass a collection of users to the view
            var users = db.Users.Include(u => u.AspNetUser).Where(u => u.aspuserid == login).ToList();

            // Pass the user's email to the view
            ViewBag.UserEmail = user.AspNetUser.Email;

            return View(users);
        }


        public PartialViewResult _profileapp(int? id)
        {
            var login = User.Identity.GetUserId();
            var appointments = db.Appointments.Where(a => a.aspuserid == login).Include(a => a.Device);
            return PartialView(appointments.ToList());
        }
        public PartialViewResult _profileappending()
        {
            var login = User.Identity.GetUserId();
            var appointments = db.Appointments.Where(a => a.aspuserid == login && a.IsAccepted == null).Include(a => a.Device);
            return PartialView(appointments.ToList());
        }
        // GET: Users/Details/5
        public ActionResult Details(int? id)
        {var user1=db.Users.Where(x=>x.iduser==id);
            ViewBag.iduser=user1;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "iduser,userName,Age,Gender,aspuserid")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", user.aspuserid);
            return View(user);
        }

        // GET: Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", user.aspuserid);
            return View(user);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "iduser,userName,Age,Gender,aspuserid")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", user.aspuserid);
            return View(user);
        }

        // GET: Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
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
