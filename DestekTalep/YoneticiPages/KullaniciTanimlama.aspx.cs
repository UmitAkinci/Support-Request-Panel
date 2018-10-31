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
    public partial class KullaniciTanimlama : System.Web.UI.Page
    {
        
        KullaniciContext kc = new KullaniciContext();
        PersonelContext pc = new PersonelContext();
        DepartmanContext dc = new DepartmanContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid(0);
            if (!IsPostBack)
            {
                if (Session["KullaniciAdi"]==null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                PersonelDoldur();
                string valueDropDown = Request.Form["DropDownList1"];
                DropDownList1.Text = valueDropDown;
                var id = Utils.ConvertToInt(Request.QueryString["KullaniciID"]);
                if(id>0)
                {
                    BilgileriAktar();
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(txt_kullaniciAdi.Text.Trim()=="" || txt_kullaniciAdi.Text.Trim()==""||DropDownList1.Text=="Seçiniz")
            {
                Response.Write("<script language='javascript'>alert('Lütfen alanları kontrol ediniz!');</script>");
            }
            else
            {
                DataRow dr = pc.GetPersonelId(DropDownList1.Text);
                int personelId = Utils.ConvertToInt(dr["PersonelID"].ToString());
                if (Button1.Text == "EKLE")
                {
                    kc.Insert(txt_kullaniciAdi.Text, txt_sifre.Text, "Normal", personelId);
                    Response.Write("<script language='javascript'>alert('Ekleme işlemi başarıyla gerçekleşti!');</script>");

                }
                else
                {
                    var id = Utils.ConvertToInt(Request.QueryString["KullaniciID"]);
                    kc.Update(txt_kullaniciAdi.Text, txt_sifre.Text, id, personelId);
                    Response.Write("<script language='javascript'>alert('Güncelleme işlemi başarıyla gerçekleşti!');</script>");
                    Button1.Text = "EKLE";
                    txt_kullaniciAdi.Text = "";
                    txt_sifre.Text = "";
                }

                BindGrid(0);
            }

        } 
        private void PersonelDoldur()
        {
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            DataRow dr = dc.GetDepartmanId(kullaniciAdi);
            int departmanId = Utils.ConvertToInt(dr["DepartmanID"].ToString());
            DataTable dt = pc.GetPersonelAdSoyad(departmanId);
            Utils.BindDdl(DropDownList1, dt, "PersonelAdiSoyadi", "PersonelAdiSoyadi",true);
        }  
        private void BilgileriAktar()
        {
            var id = Utils.ConvertToInt(Request.QueryString["KullaniciID"]);
            Button1.Text = "Güncelle";
            DataRow dr = kc.SelectItem(id);
            txt_kullaniciAdi.Text = dr["KullaniciAdi"].ToString();
            txt_sifre.Text = dr["KullaniciSifre"].ToString();
            DropDownList1.SelectedValue = dr["PersonelAdiSoyadi"].ToString();
        } 
        private void BindGrid(int pageIndex)
        {
            DataTable dt = kc.GetKullaniciList();
            GridView1.PageIndex = pageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}