using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DestekTalep
{
    public partial class KullaniciPaneli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["UserInfo"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                string kullaniciRol = Session["KullaniciRol"].ToString();
                if (kullaniciRol != "Normal")
                {
                    Response.Redirect("Login.aspx");
                }
            }

        }
    }
}