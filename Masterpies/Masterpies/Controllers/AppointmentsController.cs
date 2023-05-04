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
    public class AppointmentsController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: Appointments
        public ActionResult Index()
        {

            var appointments = db.Appointments.Include(a => a.AspNetUser).Include(a => a.Device).Include(a => a.TimeSlot);
            return View(appointments.ToList());
        }
        public ActionResult statistics()
        {

            int requst = db.Appointments.Count();
            int acceptedCount = db.Appointments.Count(s => s.IsAccepted == true);
            int reject = db.Appointments.Count(s => s.IsAccepted == false);
            int user = db.Users.Count();
            int device = db.Devices.Count();
            int aspuser = db.AspNetUsers.Count();



            ViewBag.requst = requst;
            ViewBag.AcceptedCount = acceptedCount;
            ViewBag.reject = reject;
            ViewBag.user = user;
            ViewBag.device = device;
            ViewBag.aspuser = aspuser;



            return View();
        }
        [Authorize]

        public ActionResult checkout(int? id)
        {
            var devicename = db.Devices.FirstOrDefault(x => x.DeviceID == id);
            ViewBag.Devicename = TempData["devicename"];
            ViewBag.DeviceId = TempData["DeviceId"];
            TempData["id"] = id;
            var AspNetUsers = db.AspNetUsers.ToList();
            var Devices = db.Devices.ToList();
            var appoiment = db.Appointments.ToList();

            if (devicename != null)
            {
                var prepayment = Convert.ToInt32(devicename.Price * 0.1);
                ViewBag.prepayment = prepayment;
            }

            return View();
        }
        public ActionResult ConfirmBooking(int id, [Bind(Include = "AppointmentID,FirstName,LastName,patientAge,city,DeviceID, AppointmentDate,aspuserid,StartTime,EndTime,IsAccepted,Timeslotsid")] Appointment appoint, string card_name)
        {
            var userId = User.Identity.GetUserId();

            appoint.FirstName = Session["FirstName"].ToString();
            appoint.LastName = Session["LastName"].ToString();
            appoint.city = Session["city"].ToString();
            appoint.StartTime = Session["time"].ToString();
            appoint.patientAge = Convert.ToInt32(Session["patientAge"]);
            appoint.DeviceID = id;
            appoint.aspuserid = userId;
            appoint.AppointmentDate = Convert.ToDateTime(Session["AppointmentDate1"]).Date;
            if (Session["patientgender"] == "True")
            {
                appoint.patientgender = true;

            }
            else
            {
                appoint.patientgender = false;
            }
         
;





            using (var db = new MasterPieseEntities2())
            {
                db.Appointments.Add(appoint);



                TempData["swal_message"] = $"Dear- Your appointment has been confirmed. We look forward to seeing you soon. In the meantime, feel free to explore our website and find ways to bring more peace into your life.";

                ViewBag.title = "success";
                ViewBag.icon = "success";
                ViewBag.redirectUrl = Url.Action("successfullyBooking", new { id = id });

                db.SaveChanges();
            }
            Session["xray"] = null;
            return View("checkout");
        }



        // GET: Appointments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            return View(appointment);
        }

        // GET: Appointments/Create
        public ActionResult Create()
        {
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.DeviceID = new SelectList(db.Devices, "DeviceID", "DeviceName");
            ViewBag.Timeslotsid = new SelectList(db.TimeSlots, "TimeSlotID", "TimeSlotID");

            return View();
        }

        // POST: Appointments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AppointmentID,FirstName,LastName,patientAge,patientgender,city,TimeSlotID,DeviceID,AppointmentDate,aspuserid,IsAccepted,Timeslotsid")] Appointment appointment)
        {
            if (ModelState.IsValid)
            {
                db.Appointments.Add(appointment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", appointment.aspuserid);
            ViewBag.DeviceID = new SelectList(db.Devices, "DeviceID", "DeviceName", appointment.DeviceID);
            ViewBag.Timeslotsid = new SelectList(db.TimeSlots, "TimeSlotID", "TimeSlotID", appointment.Timeslotsid);

            return View(appointment);
        }



        // GET: Appointments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", appointment.aspuserid);
            ViewBag.DeviceID = new SelectList(db.Devices, "DeviceID", "DeviceName", appointment.DeviceID);
            ViewBag.Timeslotsid = new SelectList(db.TimeSlots, "TimeSlotID", "TimeSlotID", appointment.Timeslotsid);
            return View(appointment);
        }

        // POST: Appointments1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AppointmentID,FirstName,LastName,patientAge,patientgender,city,DeviceID,AppointmentDate,aspuserid,StartTime,EndTime,IsAccepted,Timeslotsid")] Appointment appointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(appointment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email", appointment.aspuserid);
            ViewBag.DeviceID = new SelectList(db.Devices, "DeviceID", "DeviceName", appointment.DeviceID);
            ViewBag.Timeslotsid = new SelectList(db.TimeSlots, "TimeSlotID", "TimeSlotID", appointment.Timeslotsid);
            return View(appointment);
        }

        // GET: Appointments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Appointment appointment = db.Appointments.Find(id);
            if (appointment == null)
            {
                return HttpNotFound();
            }
            return View(appointment);
        }

        // POST: Appointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Appointment appointment = db.Appointments.Find(id);
            db.Appointments.Remove(appointment);
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
