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
    public partial class _Default : Page
    {
        DepartmanContext dc = new DepartmanContext();
        TalepContext tc = new TalepContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["UserInfo"]==null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                BindGrid(0);
            }
        }
        private void BindGrid(int pageIndex)
        {
            string kullaniciAdi = Session["KullaniciAdi"].ToString();
            DataRow dr = dc.GetDepartmanId(kullaniciAdi);
            int departmanId = Utils.ConvertToInt(dr["DepartmanID"].ToString());
            DataTable dt = tc.GetDepartmanTalepList(departmanId);
            GridView1.PageIndex = pageIndex;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }     

    }
}