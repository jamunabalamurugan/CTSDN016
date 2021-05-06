using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductDAL;
namespace ProductBusinessLayer
{
    public class ProductBAL
    {
        public ProductDALClass dalobj = new ProductDALClass();

        public DataSet SelectDataBAL()
        {
            DataSet ds = dalobj.SelectData();
            return ds;
            //if (ds.Tables.Count > 0)
            //    return ds;
            //else
            //    return null;
        }

        public int InsertBAL(Product p)
        {
            if (p.UnitPrice > 5000 || p.UnitPrice < 0)
                return 0;
            else
            {
                int rows = dalobj.InsertData(p);
                return rows;
            }
        }
    }

}
