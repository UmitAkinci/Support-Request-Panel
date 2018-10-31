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
    public partial class PersonelTanimlama : System.Web.UI.Page
    {
        PersonelContext pc = new PersonelContext();
        DepartmanContext dc = new DepartmanContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid(0);
            if(!IsPostBack)
            {
                if (Session["KullaniciAdi"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                var id = Utils.ConvertToInt(Request.QueryString["PersonelID"]);
                if(id>0)
                {
                    BilgileriAktar();
                }       
            }
        }

        protected void btn_ekle_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            DataRow dr = dc.GetDepartmanId(kullaniciAdi);
            int departmanId = Utils.ConvertToInt(dr["DepartmanID"].ToString());
            if(txt_personelAdi.Text.Trim()=="")
            {
                Response.Write("<script language='javascript'>alert('Lütfen alanları kontrol ediniz!');</script>");
            }
            else
            {
                if (btn_ekle.Text == "EKLE")
                {
                    pc.Insert(txt_personelAdi.Text, departmanId);
                    Response.Write("<script language='javascript'>alert('Ekleme işlemi başarıyla gerçekleşti!');</script>");
                }
                else
                {
                    var id = Utils.ConvertToInt(Request.QueryString["PersonelID"]);
                    pc.Update(txt_personelAdi.Text, id);
                    Response.Write("<script language='javascript'>alert('Güncelleme işlemi başarıyla gerçekleşti!');</script>");
                    btn_ekle.Text = "EKLE";
                    txt_personelAdi.Text = "";
                }
                BindGrid(0);
            }

        }
        public DataTable GetPersonelData()
        {
            DataTable dt = pc.GetPersonelList();
            return dt;
        }
        private void BindGrid(int pageIndex)
        {
            DataTable dt = GetPersonelData();
            GridView1.PageIndex = pageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void BilgileriAktar()
        {
            var id = Utils.ConvertToInt(Request.QueryString["PersonelID"]);
            btn_ekle.Text = "Güncelle";
            DataRow dr = pc.SelectItem(id);
            txt_personelAdi.Text = dr["PersonelAdiSoyadi"].ToString();
        }
    }
}