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
    public partial class Login : System.Web.UI.Page
    {
        KullaniciContext kc = new KullaniciContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
            if (!IsPostBack)
            {
                var act = Request.QueryString["act"] == null ? "" : Request.QueryString["act"];
                if (act.ToLower() == "loggoff")
                {
                    Session["UserInfo"] = null;
                }
            }
        }

        protected void btn_giris_Click1(object sender, EventArgs e)
        {

            var user=kc.GetKullanici(txt_kullaniciAdi.Text, txt_sifre.Text);
            if(user!=null)
            {
                Session["UserInfo"] = user;
                Session["KullaniciAdi"] = txt_kullaniciAdi.Text;
                DataRow dr = kc.GetKullaniciRol(txt_kullaniciAdi.Text);
                string kullaniciRol = dr["KullaniciRol"].ToString();
                if(kullaniciRol=="Admin")
                {
                    Response.Redirect("AdminPanel.aspx?KullaniciRol=" + kullaniciRol);
                }
                else if(kullaniciRol=="Yönetici")
                {
                    Session["KullaniciRol"] = kullaniciRol;
                    Response.Redirect("YoneticiPages/YoneticiPaneli.aspx");          
                }
                else if(kullaniciRol=="Normal")
                {
                    Session["KullaniciRol"] = kullaniciRol;
                    Response.Redirect("KullaniciPages/KullaniciPaneli.aspx");
                }
            }
            else
            {
                Label3.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "Kullanici adı veya şifre geçersiz!";
                Label3.Visible = true;
                Session["UserInfo"] = null;
            }
        }
    }
}