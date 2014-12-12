using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingCart
{
    public class OrderDetails
    {
        public CustomerAddresses CustAddress { get; set; }
        public int OrderID { get; set; }
        public string PaymentType { get; set; }
        public DateTime OrderDate { get; set; }
        public string OrderStatus { get; set; }
        public decimal OrderTotal { get; set; }
        public List<CartItem> OrderItemList { get; set; }

    }
}