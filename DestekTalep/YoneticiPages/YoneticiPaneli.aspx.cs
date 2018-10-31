using DestekTalep.Business;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DestekTalep
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        TalepContext tc = new TalepContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid(0);
            if (!IsPostBack)
            {
                if (Session["UserInfo"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                string kullaniciRol = Session["KullaniciRol"].ToString();
                if (kullaniciRol != "Yönetici")
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
        private DataTable GetTalepData()
        {
            var dt = tc.GetTalepList();
            return dt;
        }
        private void BindGrid(int pageIndex)
        {
            DataTable dt = GetTalepData();
            GridView1.PageIndex = pageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}