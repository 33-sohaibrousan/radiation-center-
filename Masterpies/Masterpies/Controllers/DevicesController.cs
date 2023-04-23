﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Masterpies.Models;

namespace Masterpies.Controllers
{
    public class DevicesController : Controller
    {
        private MasterPieseEntities2 db = new MasterPieseEntities2();

        // GET: Devices
        public ActionResult Index()
        {

            return View(db.Devices.ToList());
        }
        public ActionResult XRay(int? id, string slot, string AppointmentDate, string datatocheckout, string SelectedTime, string FirstName, string LastName, string patientAge, string patientgender, string city)
        {
            var devicename = db.Devices.FirstOrDefault(x => x.DeviceID == id);
            ViewBag.Devicename = devicename.DeviceName;
            ViewBag.DeviceId = devicename.DeviceID;

            Session["device"] = id;


            var ray = db.Devices.Where(x => x.DeviceID == id).ToList();
            ViewBag.flag = true;
            DateTime appointdatee = Convert.ToDateTime(AppointmentDate);
            DateTime currentDate = DateTime.Now;


            if (slot != null)
            {



                var appointment = db.Appointments.Where(c => c.DeviceID == id && c.AppointmentDate == appointdatee.Date).ToList();

                ViewBag.date = appointdatee.Date.ToString("yyyy-MM-dd");

                foreach (var item in appointment)
                {

                    ViewBag.slothour += item.StartTime?.ToString("hh\\:mm\\:ss") + ",";



                }
                ViewBag.flag = false;
                TempData["AppointmentDate"] = AppointmentDate;

            }

            if (datatocheckout == "Appoint")
            {

                TempData["time"] = SelectedTime;
                TempData["city"] = city;
                TempData["patientgender"] = patientgender;
                TempData["patientAge"] = patientAge;
                TempData["FirstName"] = FirstName;
                TempData["LastName"] = LastName;
                TempData["AppointmentDate1"] = TempData["AppointmentDate"];

                if (appointdatee < currentDate)
                {

                    // The appointment date is in the past
                    ViewBag.ErrorMessage = "Please select a date in the future.";
                    return View();
                }
                else
                {
                    // The appointment date is in the future or present
                    // Perform booking logic
                    return RedirectToAction("checkout", "Appointments", new { id = id });
                }




            }

            return View(ray.ToList());
        }




        // GET: Devices/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }





        public ActionResult slothour(int id, string arrow)
        {
            int count = (int)(Session["countarrow"] ?? 0);

            count += 7;
            ViewBag.weeks = count;

            // Store the updated count value in session state
            Session["countarrow"] = count;


            DateTime appointdatee = Convert.ToDateTime(TempData["AppointmentDate"]);

            var appointment = db.Appointments.Where(c => c.DeviceID == id && c.AppointmentDate == appointdatee).ToList();
            string slothour = "";

            foreach (var item in appointment)
            {
                ViewBag.slothour += slothour + ',';
            }

            ViewBag.slothour = slothour;



            return RedirectToAction("XRay", new { id = id });
        }







        // GET: Devices/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Devices/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DeviceID,DeviceName,Description,Devicebackground,singledeviceid,DeviceImg2,DeviceImg3,step1,step2,step3,Duration")] Device device, HttpPostedFileBase Devicebackground, HttpPostedFileBase DeviceImg2, HttpPostedFileBase DeviceImg3)
        {
            if (ModelState.IsValid)
            {

                if (Devicebackground != null)
                {
                    if (!Devicebackground.ContentType.ToLower().StartsWith("image/"))
                    {
                        ModelState.AddModelError("", "file uploaded is not an image");
                        return View(Devicebackground);
                    }
                    string folderPath = Server.MapPath("~/Content/Images");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    string fileName = Path.GetFileName(Devicebackground.FileName);
                    string fileName2 = Path.GetFileName(DeviceImg2.FileName);
                    string fileName3 = Path.GetFileName(DeviceImg3.FileName);

                    string path = Path.Combine(folderPath, fileName);
                    string path2 = Path.Combine(folderPath, fileName2);
                    string path3 = Path.Combine(folderPath, fileName3);

                    Devicebackground.SaveAs(path);
                    DeviceImg2.SaveAs(path2);
                    DeviceImg3.SaveAs(path3);
                    device.Devicebackground = "../Content/Images/" + fileName;
                    device.DeviceImg2 = "../Content/Images/" + fileName2;
                    device.DeviceImg3 = "../Content/Images/" + fileName3;


                }
                else
                {
                    ModelState.AddModelError("", "Please upload an image.");
                    return View(device);
                }
                db.Devices.Add(device);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(device);
        }

        // GET: Devices/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        // POST: Devices/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DeviceID,DeviceName,Description,Devicebackground,singledeviceid,DeviceImg2,DeviceImg3,step1,step2,step3,Duration")] Device device, HttpPostedFileBase Devicebackground, HttpPostedFileBase DeviceImg2, HttpPostedFileBase DeviceImg3)
        {
            //device.DeviceImage = Session["img"].ToString();
            if (ModelState.IsValid)
            {

                if (Devicebackground != null)
                {
                    if (!Devicebackground.ContentType.ToLower().StartsWith("image/"))
                    {
                        ModelState.AddModelError("", "file uploaded is not an image");
                        return View(Devicebackground);
                    }
                    string folderPath = Server.MapPath("~/Content/Images");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }
                    string fileName = Path.GetFileName(Devicebackground.FileName);
                    string fileName2 = Path.GetFileName(DeviceImg2.FileName);
                    string fileName3 = Path.GetFileName(DeviceImg3.FileName);

                    string path = Path.Combine(folderPath, fileName);
                    string path2 = Path.Combine(folderPath, fileName2);
                    string path3 = Path.Combine(folderPath, fileName3);

                    Devicebackground.SaveAs(path);
                    DeviceImg2.SaveAs(path2);
                    DeviceImg3.SaveAs(path3);
                    device.Devicebackground = "../Content/Images/" + fileName;
                    device.DeviceImg2 = "../Content/Images/" + fileName2;
                    device.DeviceImg3 = "../Content/Images/" + fileName3;


                }
                else
                {
                    ModelState.AddModelError("", "Please upload an image.");
                    return View(device);
                }
                db.Entry(device).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(device);
        }

        // GET: Devices/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Device device = db.Devices.Find(id);
            if (device == null)
            {
                return HttpNotFound();
            }
            return View(device);
        }

        // POST: Devices/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Device device = db.Devices.Find(id);
            db.Devices.Remove(device);
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