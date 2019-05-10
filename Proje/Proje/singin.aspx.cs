using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Proje
{
    public partial class singin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void kaydol_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti= new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
            baglanti.Open();
            SqlCommand sorgu = new SqlCommand("INSERT INTO  guest  (firstname,lastname,contactno) VALUES ('" + firstname.Text + "','" + lastname.Text + "','"+contactno.Text+"')", baglanti);
            sorgu.ExecuteNonQuery();
            SqlCommand sorgu1 = new SqlCommand("INSERT INTO  admin  (name,password) VALUES ('" + firstname.Text + "','" + passaword.Text + "')", baglanti);
            sorgu1.ExecuteNonQuery();
            Response.Redirect("index.aspx");


        }
    }
}