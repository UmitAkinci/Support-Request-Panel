using DestekTalep.Business;
using DestekTalep.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DestekTalep
{
    public partial class Taleplerim1 : System.Web.UI.Page
    {
        TalepContext tc = new TalepContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if(Session["UserInfo"]==null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                var id= Utils.ConvertToInt(Request.QueryString["TalepID"]);
                if (id>0)
                {
                    BilgileriAktar();
                }                
                BindGrid(0);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            DataRow dr = tc.GetPersonelId(kullaniciAdi);
            int personelId = Utils.ConvertToInt(dr["PersonelID"].ToString());
            DateTime talepTarihi = DateTime.Now;
            if(btn_ekle.Text=="Yeni Talep")
            {
                tc.Insert(txt_talepIcerik.Text, ddl_talepTuru.Text, talepTarihi, personelId);
            }
            else
            {
                var id = Utils.ConvertToInt(Request.QueryString["TalepID"]);
                tc.Update(txt_talepIcerik.Text, ddl_talepTuru.Text, talepTarihi, id);
            }
            BindGrid(0);

        }
        private void BindGrid(int pageIndex)
        {
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            DataRow dr = tc.GetPersonelId(kullaniciAdi);
            int personelId = Utils.ConvertToInt(dr["PersonelID"].ToString());
            DataTable dt = tc.GetTalepList(personelId);
            GridView1.PageIndex = pageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void BilgileriAktar()
        {
            var id = Utils.ConvertToInt(Request.QueryString["TalepID"]);
            btn_ekle.Text = "Güncelle";
            DataRow dr = tc.SelectItem(id);
            txt_talepIcerik.Text = dr["TalepIcerik"].ToString();
            ddl_talepTuru.Text = dr["TalepTuru"].ToString();
        }
    }
}