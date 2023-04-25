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
    public class AdminAppointmentsController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: AdminAppointments
        public ActionResult Index()
        {
            var appointments = db.Appointments.Include(a => a.AspNetUser).Include(a => a.Device).Include(a => a.TimeSlot);
            return View(appointments.ToList());
        }
        public ActionResult Requsts()
        {
            {
                //var apprequest = db.Appointments.Where(e => e.IsAccepted == null).Include(s => s.Device).Include(a => a.TimeSlot);
                var apprequest = db.Appointments.Where(e => e.IsAccepted == null)
         .OrderByDescending(a => a.AppointmentID    )
         .Include(s => s.Device)
         .Include(a => a.TimeSlot);

                return View(apprequest.ToList());
            }
        }
        public ActionResult AcceptedAppointment()
        {
            {

                var acceptapp = db.Appointments.Where(s => s.IsAccepted == true).Include(s => s.Device).Include(a => a.TimeSlot);
                return View(acceptapp.ToList());
            }
        }
        public ActionResult RejectedAppointment()
        {

            {
                var rejectapp = db.Appointments.Where(s => s.IsAccepted == false).Include(s => s.Device).Include(a => a.TimeSlot);
                return View(rejectapp.ToList());
            }
        }
        // GET: AdminAppointments/Details/5
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

        // GET: AdminAppointments/Create
        public ActionResult Create()
        {
            ViewBag.aspuserid = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.DeviceID = new SelectList(db.Devices, "DeviceID", "DeviceName");
            ViewBag.Timeslotsid = new SelectList(db.TimeSlots, "TimeSlotID", "TimeSlotID");
            return View();
        }

        // POST: AdminAppointments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AppointmentID,FirstName,LastName,patientAge,patientgender,city,DeviceID,AppointmentDate,aspuserid,StartTime,EndTime,IsAccepted,Timeslotsid")] Appointment appointment)
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

        // GET: AdminAppointments/Edit/5
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

        // POST: AdminAppointments/Edit/5
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

        // GET: AdminAppointments/Delete/5
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

        // POST: AdminAppointments/Delete/5
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
