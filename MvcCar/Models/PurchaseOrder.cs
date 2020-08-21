using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcCar.Models;

namespace MvcCar.Models
{
    public class PurchaseOrder
    {
        dbQLCarDataContext data = new dbQLCarDataContext();
        public int iCarID { set; get; }
        public string sCarName { set; get; }
        public string sImage { set; get; }
        public Double dPrice { set; get; }
        public int iQuantity { set; get; }
        public Double dDiscout { set; get; }
        public int iTypeCusID { set; get; }

        public Double dTotal
        {
            get { return (iQuantity * dPrice)-((iQuantity * dPrice)* dDiscout); }
        }
      

        public PurchaseOrder(int CarID)
        {
            iCarID = CarID;
            CAR car = data.CARs.Single(n => n.CarID == iCarID);
            sCarName = car.CarName;
            sImage = car.Image;
            dPrice = double.Parse(car.Price.ToString());
            iQuantity = 1;
            dDiscout = 0;

        }
    }
}