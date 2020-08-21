using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcCar.Models;
using System.IO;

using PagedList;
using PagedList.Mvc;

namespace MvcCar.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        dbQLCarDataContext db = new dbQLCarDataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Car(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.CARs.ToList().OrderBy(n => n.CarID).ToPagedList(pegeNumber, pageSize));
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var AdUser = collection["username"];
            var AdPass = collection["pass"];
            if (String.IsNullOrEmpty(AdUser))
            {
                ViewData["loi1"] = "Username cannot be blank!";
            }
            else if (String.IsNullOrEmpty(AdPass))
            {
                ViewData["loi2"] = "Password cannot be blank!";
            }
            else
            {
                ADMIN ad = db.ADMINs.SingleOrDefault(n => n.AdUser == AdUser && n.AdPass == AdPass);
                if (ad != null)
                {
                    Session["LoginAdmin"] = ad;
                    return RedirectToAction("Index", "Admin");
                }
                else
                    ViewBag.Thongbao = "User or Password incorrect!";
            }
            return View();
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.TypeCarID = new SelectList(db.TYPECARs.ToList().OrderBy(n => n.TypeCarName), "TypeCarID", "TypeCarName");
            ViewBag.BraID = new SelectList(db.BRANCHes.ToList().OrderBy(n => n.BraLocal), "BraID", "BraLocal");
            ViewBag.CarManuID = new SelectList(db.CARMANUFACTURERs.ToList().OrderBy(n => n.CarManuName), "CarManuID", "CarManuName");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(CAR car, HttpPostedFileBase fileupload)
        {
            ViewBag.TypeCarID = new SelectList(db.TYPECARs.ToList().OrderBy(n => n.TypeCarName), "TypeCarID", "TypeCarName");
            ViewBag.BraID = new SelectList(db.BRANCHes.ToList().OrderBy(n => n.BraLocal), "BraID", "BraLocal");
            ViewBag.CarManuID = new SelectList(db.CARMANUFACTURERs.ToList().OrderBy(n => n.CarManuName), "CarManuID", "CarManuName");

            if (fileupload == null)
            {
                ViewBag.Thongbao = "Image can not null!";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var filename = Path.GetFileName(fileupload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), filename);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Image already exists";
                    }
                    else
                    {
                        fileupload.SaveAs(path);
                    }
                    car.Image = filename;
                    db.CARs.InsertOnSubmit(car);
                    db.SubmitChanges();
                }
                return RedirectToAction("Car");           
            }
        }

        public ActionResult Details(int id)
        {
            CAR car = db.CARs.SingleOrDefault(n => n.CarID == id);
            ViewBag.CarID = car.CarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            CAR car = db.CARs.SingleOrDefault(n => n.CarID == id);
            ViewBag.CarID = car.CarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult AgreeToDelete(int id)
        {
            CAR car = db.CARs.SingleOrDefault(n => n.CarID == id);
            ViewBag.CarID = car.CarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.CARs.DeleteOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("Car");
        }

        //[HttpGet]
        //public ActionResult Edit(int id)
        //{
        //    CAR car = db.CARs.SingleOrDefault(n => n.CarID == id);

        //    if (car == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    ViewBag.TypeCarID = new SelectList(db.TYPECARs.ToList().OrderBy(n => n.TypeCarName), "TypeCarID", "TypeCarName",car.TypeCarID);
        //    ViewBag.BraID = new SelectList(db.BRANCHes.ToList().OrderBy(n => n.BraLocal), "BraID", "BraLocal",car.BraID);
        //    ViewBag.CarManuID = new SelectList(db.CARMANUFACTURERs.ToList().OrderBy(n => n.CarManuName), "CarManuID", "CarManuName",car.CarManuID);
        //    return View(car);
        //}

        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Edit(CAR car, HttpPostedFileBase fileupload)
        //{
        //    ViewBag.TypeCarID = new SelectList(db.TYPECARs.ToList().OrderBy(n => n.TypeCarName), "TypeCarID", "TypeCarName");
        //    ViewBag.BraID = new SelectList(db.BRANCHes.ToList().OrderBy(n => n.BraLocal), "BraID", "BraLocal");
        //    ViewBag.CarManuID = new SelectList(db.CARMANUFACTURERs.ToList().OrderBy(n => n.CarManuName), "CarManuID", "CarManuName");

        //    if (fileupload == null)
        //    {
        //        ViewBag.Thongbao = "Image can not null!";
        //        return View();
        //    }
        //    else
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            var filename = Path.GetFileName(fileupload.FileName);
        //            var path = Path.Combine(Server.MapPath("~/Images"), filename);
        //            if (System.IO.File.Exists(path))
        //            {
        //                ViewBag.Thongbao = "Image already exists";
        //            }
        //            else
        //            {
        //                fileupload.SaveAs(path);
        //            }
        //            car.Image = filename;
        //            UpdateModel(car);
        //            db.SubmitChanges();
        //        }
        //        return RedirectToAction("Car");
        //    }
        //}


        public ActionResult Manufacturer(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.CARMANUFACTURERs.ToList().OrderBy(n => n.CarManuID).ToPagedList(pegeNumber, pageSize));
        }

        [HttpGet]
        public ActionResult CreateM()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateM(CARMANUFACTURER car)
        {
            db.CARMANUFACTURERs.InsertOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("Manufacturer");
        }

        public ActionResult DetailsM(int id)
        {
            CARMANUFACTURER car = db.CARMANUFACTURERs.SingleOrDefault(n => n.CarManuID == id);
            ViewBag.CarManuID = car.CarManuID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpGet]
        public ActionResult DeleteM(int id)
        {
            CARMANUFACTURER car = db.CARMANUFACTURERs.SingleOrDefault(n => n.CarManuID == id);
            ViewBag.CarManuID = car.CarManuID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpPost, ActionName("DeleteM")]
        public ActionResult AgreeToDeleteM(int id)
        {
            CARMANUFACTURER car = db.CARMANUFACTURERs.SingleOrDefault(n => n.CarManuID == id);
            ViewBag.CarManuID = car.CarManuID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.CARMANUFACTURERs.DeleteOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("Manufacturer");
        }


        public ActionResult Branch(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.BRANCHes.ToList().OrderBy(n => n.BraID).ToPagedList(pegeNumber, pageSize));
        }

        [HttpGet]
        public ActionResult CreateB()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateB(BRANCH car)
        {
            db.BRANCHes.InsertOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("Branch");
        }

        public ActionResult DetailsB(int id)
        {
            BRANCH car = db.BRANCHes.SingleOrDefault(n => n.BraID == id);
            ViewBag.BraID = car.BraID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpGet]
        public ActionResult DeleteB(int id)
        {
            BRANCH car = db.BRANCHes.SingleOrDefault(n => n.BraID == id);
            ViewBag.BraID = car.BraID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpPost, ActionName("DeleteB")]
        public ActionResult AgreeToDeleteB(int id)
        {
            BRANCH car = db.BRANCHes.SingleOrDefault(n => n.BraID == id);
            ViewBag.BraID = car.BraID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.BRANCHes.DeleteOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("Branch");
        }



        public ActionResult TypeCar(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.TYPECARs.ToList().OrderBy(n => n.TypeCarID).ToPagedList(pegeNumber, pageSize));
        }

        [HttpGet]
        public ActionResult CreateT()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateT(TYPECAR car)
        {
            db.TYPECARs.InsertOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("TypeCar");
        }

        public ActionResult DetailsT(int id)
        {
            TYPECAR car = db.TYPECARs.SingleOrDefault(n => n.TypeCarID == id);
            ViewBag.TypeCarID = car.TypeCarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpGet]
        public ActionResult DeleteT(int id)
        {
            TYPECAR car = db.TYPECARs.SingleOrDefault(n => n.TypeCarID == id);
            ViewBag.TypeCarID = car.TypeCarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(car);
        }

        [HttpPost, ActionName("DeleteT")]
        public ActionResult AgreeToDeleteT(int id)
        {
            TYPECAR car = db.TYPECARs.SingleOrDefault(n => n.TypeCarID == id);
            ViewBag.TypeCarID = car.TypeCarID;
            if (car == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.TYPECARs.DeleteOnSubmit(car);
            db.SubmitChanges();
            return RedirectToAction("TypeCar");
        }



        public ActionResult Order(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.ORDERDETAILs.ToList().OrderBy(n => n.OrderID).ToPagedList(pegeNumber, pageSize));
        }

        public ActionResult Custommer(int? page)
        {
            int pegeNumber = (page ?? 1);
            int pageSize = 5;
            return View(db.CUSTOMMERs.ToList().OrderBy(n => n.CusID).ToPagedList(pegeNumber, pageSize));
        }
    }
}