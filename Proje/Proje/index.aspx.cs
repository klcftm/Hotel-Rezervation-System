using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Proje
{
    public partial class proje : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["admin_id"] != null)
            {

                Response.Redirect("index.aspx");

            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
            baglanti.Open();
            SqlCommand sorgu = new SqlCommand("Select * from admin where name='" + username.Text + "' and password='" + password.Text + "'", baglanti);
            SqlDataReader rd = sorgu.ExecuteReader();
            if (rd.Read())
            {
               
                Session["admin_id"] = rd["admin_id"].ToString();       
                Response.Redirect("home.aspx");
            }
            else {
                Response.Write("<center><labe style = 'color:red;'>Geçersiz kullanıcı adı veya şifre</label></center>");
            }
        }

        protected void uyeol_Click(object sender, EventArgs e)
        {
            Response.Redirect("singin.aspx");
        }
    }
}