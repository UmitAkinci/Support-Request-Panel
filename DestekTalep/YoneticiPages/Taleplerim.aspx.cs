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
    public partial class Taleplerim : System.Web.UI.Page
    {
        TalepContext tc = new TalepContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullaniciAdi"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                    BindGrid(0);

                var id = Utils.ConvertToInt(Request.QueryString["TalepID"]);              
                if(id>0)
                {
                    BilgileriAktar();
                }           
            }
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            if(txt_talepIcerik.Text.Trim()==""||ddl_talepTuru.Text=="Seçiniz")
            {
                Response.Write("<script language='javascript'>alert('Lütfen alanları kontrol ediniz!');</script>");
            }
            else
            {
                if (btn_ekle.Text == "Yeni Talep")
                {
                    string kullaniciAdi = Session["KullaniciAdi"].ToString();
                    DataRow dr = tc.GetPersonelId(kullaniciAdi);
                    int personelId = Utils.ConvertToInt(dr["PersonelID"].ToString());
                    DateTime talepTarihi = DateTime.Now;
                    tc.Insert(txt_talepIcerik.Text, ddl_talepTuru.Text, talepTarihi, personelId);
                    Response.Write("<script language='javascript'>alert('Ekleme işlemi başarıyla gerçekleşti!');</script>");

                }
                else
                {
                    DateTime talepTarihi = DateTime.Now;
                    var id = Utils.ConvertToInt(Request.QueryString["TalepID"]);
                    tc.Update(txt_talepIcerik.Text, ddl_talepTuru.Text, talepTarihi, id);
                    Response.Write("<script language='javascript'>alert('Güncelleme işlemi başarıyla gerçekleşti!');</script>");

                    btn_ekle.Text = "Yeni Talep";
                    txt_talepIcerik.Text = "";
                }
                BindGrid(0);
            }

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