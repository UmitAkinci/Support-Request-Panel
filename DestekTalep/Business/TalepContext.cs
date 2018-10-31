using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DestekTalep.Business
{
    public class TalepContext
    {
        private DbHelper _dbHelper;
        public TalepContext()
        {
            _dbHelper = new DbHelper();
        }
        public DataTable GetTalepList()
        {
            string sql = "Select*from Talep";
            var d = _dbHelper.GetDataTable(sql);
            return d;
        }
        public DataTable GetTalepList(int personelId)
        {
            string sql = "Select*from Talep Where PersonelID=" + personelId;
            var dt = _dbHelper.GetDataTable(sql);
            return dt;
        }
        public DataTable GetDepartmanTalepList(int departmanId)
        {
            string sql = "Select*from VwDepTal Where DepartmanID=" + departmanId;
            var dt = _dbHelper.GetDataTable(sql);
            return dt;
        }
        public DataRow GetPersonelId(string kullaniciAdi)
        {
            string sql = "Select PersonelID from VwKulPer Where KullaniciAdi=" + "'" + kullaniciAdi + "'";
            var dr = _dbHelper.GetDataRow(sql);
            return dr;
        }
        public int Insert(string talepIcerik,string talepTuru,DateTime talepTarihi,int personelId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@TalepIcerik", talepIcerik);
            pars.Add("@TalepTuru", talepTuru);
            pars.Add("@TalepTarihi", talepTarihi);
            pars.Add("@TalepDurumu", "Bekleniyor");
            pars.Add("@PersonelID", personelId);
            string sql = "INSERT INTO Talep(TalepIcerik,TalepTuru,TalepTarihi,PersonelID,TalepDurumu) VALUES (@TalepIcerik,@TalepTuru,@TalepTarihi,@PersonelID,@TalepDurumu)";
            var d = _dbHelper.Execute(sql, pars);
            return d;
        }
        public int Update(string talepIcerik, string talepTuru, DateTime talepTarihi, int talepId)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@TalepID", talepId);
            pars.Add("@TalepIcerik", talepIcerik);
            pars.Add("@TalepTuru", talepTuru);
            pars.Add("@TalepTarihi", talepTarihi);
            
            string sql = "UPDATE Talep SET TalepIcerik=@TalepIcerik,TalepTuru=@TalepTuru,TalepTarihi=@TalepTarihi WHERE TalepID=@TalepID";
            var d = _dbHelper.Execute(sql, pars);
            return d;
        }
        public DataRow SelectItem(int id)
        {
            var pars = new Dictionary<string, object>();
            pars.Add("@TalepID", id);

            string sql = "Select * from Talep where TalepID=@TalepID";
            _dbHelper = new DbHelper();
            return _dbHelper.GetDataRow(sql, pars);
        }

    }
}