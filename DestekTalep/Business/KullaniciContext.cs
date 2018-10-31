using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DestekTalep.Helpers
{
    public class KullaniciContext
    {
        private DbHelper _dbHelper;
        public KullaniciContext()
        {
            _dbHelper = new DbHelper();
        }
        public DataRow GetKullanici(string kullaniciAdi, string kullaniciSifre)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@KullaniciAdi", kullaniciAdi);
            pars.Add("@KullaniciSifre", kullaniciSifre);
            string sql = "Select * from Kullanici where KullaniciAdi=@KullaniciAdi and KullaniciSifre=@KullaniciSifre";
            _dbHelper = new DbHelper();
            return _dbHelper.GetDataRow(sql, pars);
        }
        public DataRow GetKullaniciRol(string kullaniciAdi)
        {
            string sql = "Select KullaniciRol from Kullanici where KullaniciAdi=" + "'" + kullaniciAdi + "'";
            var d = _dbHelper.GetDataRow(sql);
            return d;
        }
        public int Insert(string kullaniciAdi,string sifre,string kullaniciRol,int personelId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@KullaniciAdi", kullaniciAdi);
            pars.Add("@KullaniciSifre", sifre);
            pars.Add("@KullaniciRol", kullaniciRol);
            pars.Add("@PersonelID", personelId);
            string sql = "INSERT INTO Kullanici(KullaniciAdi,KullaniciSifre,KullaniciRol,PersonelID) VALUES (@KullaniciAdi,@KullaniciSifre,@KullaniciRol,@PersonelID)";
            var d = _dbHelper.Execute(sql,pars);
            return d;
        }
        public int Update(string kullaniciAdi,string sifre,int kullaniciId,int personelId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@KullaniciID", kullaniciId);
            pars.Add("@KullaniciAdi", kullaniciAdi);
            pars.Add("@KullaniciSifre", sifre);
            pars.Add("@PersonelID", personelId);
            string sql = "UPDATE Kullanici SET KullaniciAdi=@KullaniciAdi,KullaniciSifre=@KullaniciSifre,PersonelID=@PersonelID WHERE KullaniciID=@KullaniciID";
            var d = _dbHelper.Execute(sql, pars);
            return d;

        }
        public DataRow SelectItem(int id)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@KullaniciID", id);

            string sql = "Select * from VwKulPer where KullaniciID=@KullaniciID";
            _dbHelper = new DbHelper();
            return _dbHelper.GetDataRow(sql, pars);
        }
        public DataTable GetKullaniciList()
        {
            string sql = "Select*from VwKulPer";
            _dbHelper = new DbHelper();
            return _dbHelper.GetDataTable(sql);
        }
    }
}