using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcCar.Models;

namespace MvcCar.Controllers
{
    public class PurchaseOrderController : Controller
    {
        dbQLCarDataContext data = new dbQLCarDataContext();
        // GET: PurchaseOrder
        public List<PurchaseOrder> Getpurchseorder()
        {
            List<PurchaseOrder> lstPurchaseOrder = Session["PurchaseOrder"] as List<PurchaseOrder>;
            if (lstPurchaseOrder == null)
            {
                lstPurchaseOrder = new List<PurchaseOrder>();
                Session["PurchaseOrder"] = lstPurchaseOrder;
            }

            return lstPurchaseOrder;
        }

        public ActionResult Addpurchaseorder(int iCarID, string strURL)
        {
            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            PurchaseOrder sanpham = lstPurchaseOrder.Find(n => n.iCarID == iCarID);
            if (sanpham == null)
            {
                sanpham = new PurchaseOrder(iCarID);
                lstPurchaseOrder.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iQuantity++;
                return Redirect(strURL);
            }

        }

        private int TotalQ()
        {
            int iTotalQ = 0;
            List<PurchaseOrder> lstPurchaseOrder = Session["PurchaseOrder"] as List<PurchaseOrder>;
            if (lstPurchaseOrder != null)
            {
                iTotalQ = lstPurchaseOrder.Sum(n => n.iQuantity);
            }
            return iTotalQ;
        }

        private double TotalM()
        {
            double dTotalM = 0;
            List<PurchaseOrder> lstPurchaseOrder = Session["PurchaseOrder"] as List<PurchaseOrder>;
            if (lstPurchaseOrder != null)
            {
                dTotalM = lstPurchaseOrder.Sum(n => n.dTotal);
            }
            return dTotalM;
        }

        public ActionResult Purchaseorder()
        {
            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            if (lstPurchaseOrder.Count == 0)
            {
                return RedirectToAction("Index", "Car");
            }
            ViewBag.TotalQ = TotalQ();
            ViewBag.TotalM = TotalM();
            return View(lstPurchaseOrder);
        }

        public ActionResult PurchaseOrderPartial()
        {
            ViewBag.TotalQ = TotalQ();
            ViewBag.TotalM = TotalM();
            return PartialView();
        }

        public ActionResult Deletepurchaseorder(int iMasp)
        {
            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            PurchaseOrder sp = lstPurchaseOrder.SingleOrDefault(n => n.iCarID == iMasp);
            if (sp != null)
            {
                lstPurchaseOrder.RemoveAll(n => n.iCarID == iMasp);
                return RedirectToAction("Purchaseorder");
            }
            if (lstPurchaseOrder.Count == 0)
            {
                return RedirectToAction("Index", "Car");
            }
            return RedirectToAction("PurchaseOrder");
        }

        public ActionResult UpdatePurchaseOrder(int iMaSP, FormCollection f)
        {
            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            PurchaseOrder sanpham = lstPurchaseOrder.SingleOrDefault(n => n.iCarID == iMaSP);
            if (sanpham != null)
            {
                sanpham.iQuantity = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("PurchaseOrder");
        }

        public ActionResult DeleteAll()
        {
            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            lstPurchaseOrder.Clear();
            return RedirectToAction("Index", "Car");
        }

        [HttpGet]
        public ActionResult Order()
        {

            if (Session["Email"] == null || Session["Email"].ToString() == "")
            {
                return RedirectToAction("Login", "Custommer");
            }
            if (Session["PurchaseOrder"] == null)
            {
                return RedirectToAction("Index", "Car");
            }

            List<PurchaseOrder> lstPurchaseOrder = Getpurchseorder();
            ViewBag.TotalQ = TotalQ();
            ViewBag.TotalM = TotalM();
            return View(lstPurchaseOrder);
        }

        [HttpPost]
        public ActionResult Order(FormCollection collection)
        {
            ORDERCAR ddh = new ORDERCAR();
            CUSTOMMER kh = (CUSTOMMER)Session["Email"];
            ORDERDETAIL ctdh = new ORDERDETAIL();
            List<PurchaseOrder> gh = Getpurchseorder();
            ddh.CusID = kh.CusID;
            ddh.OrderDate = DateTime.Now;
            var DeliveryDate = String.Format("{0:MM/dd/yyyy}", collection["DeliveryDate"]);
            ddh.DeliveryDate = DateTime.Parse(DeliveryDate);
            ddh.DeliveryStatus = false;
            ddh.Paid = false;         
            data.ORDERCARs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            foreach (var item in gh)
            {              
                ctdh.OrderID = ddh.OrderID;
                ctdh.CarID = item.iCarID;
                ctdh.Quantity = item.iQuantity;
                ctdh.UnitPrice = (decimal)item.dPrice;
                ctdh.Discout = item.dDiscout;
                DateTime ReturnDate = DateTime.Parse(DeliveryDate).AddDays(+item.iQuantity);
                ctdh.ReturnDate = ReturnDate;
                data.ORDERDETAILs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["PurchaseOrder"] = null;
            return RedirectToAction("OrderConfirmation", "PurchaseOrder");
        }

        public ActionResult OrderConfirmation()
        { 
            return View();
        }
    }
}