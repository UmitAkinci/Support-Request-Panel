using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DestekTalep.Business
{
    public class PersonelContext
    {
        private DbHelper _dbHelper;
        public PersonelContext()
        {
            _dbHelper = new DbHelper();
        }
        public int Insert(string personelAdiSoyadi,int departmanId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@PersonelAdiSoyadi", personelAdiSoyadi);
            pars.Add("@DepartmanID", departmanId);
            string sql = "INSERT INTO Personel(PersonelAdiSoyadi,DepartmanID) values (@PersonelAdiSoyadi,@DepartmanID)";
            var d=_dbHelper.Execute(sql,pars);
            return d;
        }
        public int Update(string personelAdiSoyadi,int personelId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@PersonelAdiSoyadi", personelAdiSoyadi);
            pars.Add("@PersonelID", personelId);
            string sql = "UPDATE Personel SET PersonelAdiSoyadi=@PersonelAdiSoyadi WHERE PersonelID=@PersonelID";
            var d = _dbHelper.Execute(sql, pars);
            return d;
        }
        public DataTable GetPersonelList()
        {
            string sql = "Select*from Personel";
            var dt = _dbHelper.GetDataTable(sql);
            return dt;
        }
        public DataTable GetPersonelAdSoyad(int departmanId)
        {
            string sql = "Select PersonelAdiSoyadi from Personel Where DepartmanID="+departmanId;
            var dt = _dbHelper.GetDataTable(sql);
            return dt;
        }
        public DataRow GetPersonelId(string personelAdi)
        {
            string sql = "Select PersonelID from Personel Where PersonelAdiSoyadi=" + "'" + personelAdi + "'";
            var dr = _dbHelper.GetDataRow(sql);
            return dr;
        }
        public DataRow SelectItem(int id)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@PersonelID", id);

            string sql = "Select * from Personel where PersonelID=@PersonelID";
            _dbHelper = new DbHelper();
            return _dbHelper.GetDataRow(sql, pars);
        }
    }
}