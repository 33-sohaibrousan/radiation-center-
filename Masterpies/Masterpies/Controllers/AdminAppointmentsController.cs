using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using Masterpies.Models;

namespace Masterpies.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminAppointmentsController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: AdminAppointments
        public ActionResult Index()
        {
            var appointments = db.Appointments.Include(a => a.AspNetUser).Include(a => a.Device).Include(a => a.TimeSlot);
            return View(appointments.ToList());
        }
        [Authorize(Roles = "Admin")]
        public ActionResult statistics()
        {

            int requst = db.Appointments.Count(a=> a.IsAccepted==null);
            int acceptedCount = db.Appointments.Count(s => s.IsAccepted == true);
            int reject = db.Appointments.Count(s => s.IsAccepted == false);
            int user = db.Users.Count();
            int device = db.Devices.Count();
            int aspuser = db.AspNetUsers.Count();

          


            // Get the distinct DeviceIDs from the Devices table
            var distinctDeviceIDs = db.Devices.Distinct().ToList();
           List<int> deviceSum = new List<int>();
            // Loop through each distinct DeviceID
            foreach (var deviceId in distinctDeviceIDs)
            {

                var deviceMoney = db.Appointments.Where(x => x.IsAccepted == true && x.DeviceID == deviceId.DeviceID).ToList();
                int count = 0;
                foreach (var item in deviceMoney)
                {
                    count += Convert.ToInt32(deviceId.Price);
                }
                deviceSum.Add(Convert.ToInt32(count*0.1));  

            }
            ViewBag.requst = requst;
            ViewBag.AcceptedCount = acceptedCount;
            ViewBag.reject = reject;
            ViewBag.user = user;
            ViewBag.device = device;
            ViewBag.aspuser = aspuser;
            ViewBag.deviceSum = deviceSum;



            return View();
        }
        public ActionResult Search(string search)
        {
            var x1 = db.Appointments.Where(x => x.FirstName.Contains(search)
                                                 || x.LastName.Contains(search)).ToList();
            return View("Requsts",x1);
        }
        public ActionResult Searchacc(string search)
        {
            var x1 = db.Appointments.Where(x => (x.FirstName.Contains(search) || x.LastName.Contains(search))
                                                 && x.IsAccepted == true).ToList();
            return View("AcceptedAppointment", x1);
        }

        public ActionResult Searchrej(string search)
        {
            var x1 = db.Appointments.Where(x => (x.FirstName.Contains(search) || x.LastName.Contains(search))
                                                             && x.IsAccepted == false).ToList();
            return View("RejectedAppointment", x1);
        }
        public ActionResult Searchindex(string search)
        {
            var x1 = db.Appointments.Where(x => x.FirstName.Contains(search)
                                                 || x.LastName.Contains(search)).ToList();
            return View("Index", x1);
        }


        [Authorize(Roles = "Admin")]
        public ActionResult Requsts()
        {
            
                //var apprequest = db.Appointments.Where(e => e.IsAccepted == null).Include(s => s.Device).Include(a => a.TimeSlot);
                var apprequest = db.Appointments.Where(e => e.IsAccepted == null)
                 .OrderByDescending(a => a.AppointmentID)
                 .Include(s => s.Device)
                 .Include(a => a.TimeSlot);

                return View(apprequest.ToList());
            
        }
        [Authorize(Roles = "Admin")]
        public ActionResult AcceptedAppointment()
        {
            {

                var acceptapp = db.Appointments.Where(s => s.IsAccepted == true).Include(s => s.Device).Include(a => a.TimeSlot).OrderByDescending(a => a.AppointmentID);
               
                return View(acceptapp.ToList());
            }
        }
        [Authorize(Roles = "Admin")]
        public ActionResult RejectedAppointment()
        {

            
                var rejectapp = db.Appointments.Where(s => s.IsAccepted == false).Include(s => s.Device).Include(a => a.TimeSlot).OrderByDescending(a => a.AppointmentID);
                return View(rejectapp.ToList());
            
        }
        public ActionResult accept(int? id)
        {
            Appointment appointment = db.Appointments.Find(id);
            Appointment appointment1 = db.Appointments.Include(a => a.AspNetUser).SingleOrDefault(a => a.AppointmentID == id);

            string userEmail = appointment.AspNetUser.Email;

            // Perform any desired operations using the userEmail

            db.Entry(appointment).State = EntityState.Modified;
            appointment.IsAccepted = true;
            //emaiiil


            //Create a new MailMessage object
            try
            {
                MailMessage mail = new MailMessage();

                // Set the sender's email address
                mail.From = new MailAddress("sohaibalrousan99@outlook.com");

                // Set the recipient's email address

                mail.To.Add(userEmail);

                // Set the subject of the email
                mail.Subject = "New message from " + "Finding piece";

                // Set the body of the email

                mail.Body = $"<b>Welcome ";

                // Set the body format to HTML
                mail.IsBodyHtml = true;

                // Create a new SmtpClient object
                SmtpClient smtp = new SmtpClient("smtp-mail.outlook.com", 587);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("sohaibalrousan99@outlook.com", "Sohaib@123");
                smtp.EnableSsl = true;

                // Send the email
                smtp.Send(mail);
            }
            catch (Exception ex)
            {






            }

            //email
            db.SaveChanges();
            return RedirectToAction("Requsts", "AdminAppointments");
        }



    

        public ActionResult reject(int? id)
        {
            Appointment appointment = db.Appointments.Find(id);
            Appointment appointment1 = db.Appointments.Include(a => a.AspNetUser).SingleOrDefault(a => a.AppointmentID == id);
            string userEmail = appointment.AspNetUser.Email;
            // Perform any desired operations using the userEmail
            db.Entry(appointment).State = EntityState.Modified;
            appointment.IsAccepted = false;
            //emaiiil


            //Create a new MailMessage object
            try
            {
                MailMessage mail = new MailMessage();

                // Set the sender's email address
                mail.From = new MailAddress("sohaibalrousan99@outlook.com");

                // Set the recipient's email address

                mail.To.Add(userEmail);

                // Set the subject of the email
                mail.Subject = "New message from " + "Finding piece";

                // Set the body of the email

                mail.Body = $"<b>Welcome to Finding Peace!</b><br/><br/>Dr-, your registration has been submitted and is waiting for approval. You will receive an email notification when your account has been accepted.";

                // Set the body format to HTML
                mail.IsBodyHtml = true;

                // Create a new SmtpClient object
                SmtpClient smtp = new SmtpClient("smtp-mail.outlook.com", 587);
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("sohaibalrousan99@outlook.com", "Sohaib@123");
                smtp.EnableSsl = true;

                // Send the email
                smtp.Send(mail);
            }
            catch (Exception ex)
            {






            }
            db.SaveChanges();
            return RedirectToAction("Requsts", "AdminAppointments");

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
                return RedirectToAction("Requsts", "AdminAppointments");
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
            return RedirectToAction("Requsts", "AdminAppointments");
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
