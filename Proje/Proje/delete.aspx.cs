using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Proje
{
    public partial class delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
            baglanti.Open();
            SqlCommand sorgu = new SqlCommand("DELETE FROM checkin WHERE checkin_id = '" + Request["checkin_id"] + "'", baglanti);
            sorgu.ExecuteNonQuery();
            Response.Redirect("home.aspx");
            
        }
    }
}