using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcCar.Models;

namespace MvcCar.Controllers
{
    public class CustommerController : Controller
    {
        // GET: Custommer
        dbQLCarDataContext db = new dbQLCarDataContext();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registration(FormCollection collection, CUSTOMMER cus)
        {
            var name = collection["Name"];
            var email = collection["Email"];
            var pass = collection["Pass"];
            var repass = collection["RePass"];
            var address = collection["Address"];
            var telephone = collection["Telephone"];
            var birthday = string.Format("{0:MM/dd/yyyy}", collection["BirthDay"]);
            var typecus = 1;
            if (string.IsNullOrEmpty(name))
            {
                ViewData["Loi1"] = "Name cannot be blank!";
            }
            else if (string.IsNullOrEmpty(email))
            {
                ViewData["Loi2"] = "Email cannot be blank!";
            }
            else if (string.IsNullOrEmpty(pass))
            {
                ViewData["Loi3"] = "Password cannot be blank!";
            }
            else if (string.IsNullOrEmpty(repass))
            {
                ViewData["Loi4"] = "Retype Password!";
            }
            if (string.IsNullOrEmpty(address))
            {
                ViewData["Loi5"] = "Address cannot be blank!";
            }
            if (string.IsNullOrEmpty(telephone))
            {
                ViewData["Loi6"] = "Telephone cannot be blank!";
            }
            else
            {
                cus.CusName = name;
                cus.CusEmail = email;
                cus.CusPass = pass;             
                cus.CusAdress = address;
                cus.CusTelephone = telephone;
                cus.BirthDay = DateTime.Parse(birthday);
                cus.TypeCusID = typecus;
                db.CUSTOMMERs.InsertOnSubmit(cus);
                db.SubmitChanges();
                return RedirectToAction("Login");


            }

            return this.Registration();
        }

        public ActionResult Login(FormCollection collection)
        {
            var email = collection["Email"];
            var pass = collection["Password"];

            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi1"] = "Email cannot be blank!";
            }
            else if (String.IsNullOrEmpty(pass))
            {
                ViewData["Loi2"] = "Password cannot be blank!";
            }
            else
            {
                CUSTOMMER cus = db.CUSTOMMERs.SingleOrDefault(n => n.CusEmail == email && n.CusPass == pass);
                if (cus != null)
                {                  
                    Session["Email"] = cus;
                    return RedirectToAction("Index", "Car");
                }
                else
                {
                    ViewBag.Thongbao = "Email or Password incorrect!";
                }
            }

            return View();
        }


        public ActionResult Contact()
        {
            return View();
        }


    }
}