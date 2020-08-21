using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcCar.Models;

using PagedList;
using PagedList.Mvc;

namespace MvcCar.Controllers
{
    public class CarController : Controller
    {
        // GET: Car
        dbQLCarDataContext data = new dbQLCarDataContext();

        private List<CAR> Getnewcar(int count)
        {
            return data.CARs.OrderByDescending(a => a.UpdateDay).Take(count).ToList();
        }
        public ActionResult Index(int ? page)
        {
            //var newcar = Getnewcar(6);
            //return View(newcar);
            int pageSize = 6;
            int pageNum = (page ?? 1);

            var newcar = Getnewcar(20);
            return View(newcar.ToPagedList(pageNum, pageSize));
        }

        public ActionResult Typecar()
        {
            var typecar = from tc in data.TYPECARs select tc;
            return PartialView(typecar);
        }

        public ActionResult Branch()
        {
            var branch = from b in data.BRANCHes select b;
            return PartialView(branch);
        }

        public ActionResult Carmanufacturer()
        {
            var carmanufacturer = from cm in data.CARMANUFACTURERs select cm;
            return PartialView(carmanufacturer);
        }

        public ActionResult CarByType(int id)
        {
            var carbytype = from cbt in data.CARs where cbt.TypeCarID == id select cbt;
            return View(carbytype);
        }

        public ActionResult CarByBranch(int id)
        {
            var carbybranch = from cbb in data.CARs where cbb.BraID == id select cbb;
            return View(carbybranch);
        }

        public ActionResult CarByManufacturer(int id)
        {
            var carbymanufacturer = from cbm in data.CARs where cbm.CarManuID == id select cbm;
            return View(carbymanufacturer);
        }

        public ActionResult Details(int id)
        {
            var car = from d in data.CARs where d.CarID == id select d;
            return View(car.Single());
        }
    }
}