using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DestekTalep.Business
{
    public class DepartmanContext
    {
        private DbHelper _dbHelper;
       public DepartmanContext()
        {
            _dbHelper = new DbHelper();
        }
        public DataRow GetDepartmanId(string kullaniciAdi)
        {
            string sql = "Select DepartmanID from VwKulPerDep Where KullaniciAdi="+"'"+kullaniciAdi+"'";
            var d = _dbHelper.GetDataRow(sql);
            return d;
        }
    }
}