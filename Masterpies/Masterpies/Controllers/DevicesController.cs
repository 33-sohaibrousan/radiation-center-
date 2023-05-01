using System;
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
        public ActionResult Search(string search)
        {
            
            var x1 = db.Devices.Where(x => x.DeviceName.Contains(search)).ToList();
            return View("Index",x1);
        }

        public ActionResult XRay(int? id, string slot, string AppointmentDate, string datatocheckout, string SelectedTime, string FirstName, string LastName, string patientAge, string patientgender, string city)
        {
            var devicename = db.Devices.FirstOrDefault(x => x.DeviceID == id);
            ViewBag.Devicename = devicename.DeviceName;
            ViewBag.DeviceId = devicename.DeviceID;

            Session["device"] = id;


            var ray = db.Devices.Where(x => x.DeviceID == id).ToList();
            ViewBag.flag = true;

            if (slot != null)
            {

                DateTime appointdatee = Convert.ToDateTime(AppointmentDate);

                var appointment = db.Appointments.Where(c => c.DeviceID == id && c.AppointmentDate == appointdatee.Date).ToList();

                ViewBag.date = appointdatee.Date.ToString("yyyy-MM-dd");

                foreach (var item in appointment)
                {

                    ViewBag.slothour += item.StartTime + ',';



                }
                ViewBag.flag = false;
                Session["AppointmentDate"] = AppointmentDate;

            }

            if (datatocheckout == "Appoint")
            {
               Session["time"] = SelectedTime;
               Session["city"] = city;
               Session["patientgender"] = patientgender;
               Session["patientAge"] = patientAge;
               Session["FirstName"] = FirstName;
               Session["LastName"] = LastName;
               Session["AppointmentDate1"] = Session["AppointmentDate"];
            


                return RedirectToAction("checkout", "Appointments", new { id = id });

            }






            //var app=db.Appointments.Where(a=> a.DeviceID==id).ToList();
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


            DateTime appointdatee = Convert.ToDateTime(Session["AppointmentDate"]);

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
        public ActionResult Create([Bind(Include = "DeviceID,DeviceName,Description,Devicebackground,singledeviceid,DeviceImg2,DeviceImg3,step1,step2,step3,Duration,Price")] Device device, HttpPostedFileBase Devicebackground, HttpPostedFileBase DeviceImg2, HttpPostedFileBase DeviceImg3)
        {
            if (ModelState.IsValid)
            {

               
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
        public ActionResult Edit([Bind(Include = "DeviceID,DeviceName,Description,Devicebackground,singledeviceid,DeviceImg2,DeviceImg3,step1,step2,step3,Duration,Price")] Device device, HttpPostedFileBase Devicebackground, HttpPostedFileBase DeviceImg2, HttpPostedFileBase DeviceImg3)
        {
            //device.DeviceImage = Session["img"].ToString();
            if (ModelState.IsValid)
            {

            
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