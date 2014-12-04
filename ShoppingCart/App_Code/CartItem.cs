using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShoppingCart
{
    public class CartItem
    {
        public int prod_id { get; set; }
        public string prod_name { get; set; }
        public decimal price { get; set; }
        public int quantity { get; set; }
        public decimal subtotal { get; set; }

    }
}