using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DestekTalep.Helpers
{
    public class Utils
    {
        public static int ConvertToInt(string strInt, int defaultValue = -1)
        {
            try
            {
                return Convert.ToInt32(strInt);
            }
            catch
            {
                return defaultValue;

            }

        }
        public static void BindDdl(DropDownList ddl, DataTable dt, string displayColumnName, string valueColumnName, bool addSeciniz = false)
        {
            ddl.Items.Clear();
            if (addSeciniz)
            {
                ddl.Items.Add(new ListItem("Seçiniz", "-1"));
            }

            foreach (DataRow dr in dt.Rows)
            {
                var item = new ListItem();
                item.Text = dr[displayColumnName].ToString();
                item.Value = dr[valueColumnName].ToString();

                ddl.Items.Add(item);
            }
        }
    }
}