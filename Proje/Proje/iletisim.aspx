<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hakkimizda.aspx.cs" Inherits="Proje.hakkimizda" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
   
    string name,adres,telefon,fax,email;
    SqlConnection baglanti;
    void Page_Load(Object o, EventArgs e)
    {
        baglanti= new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
        baglanti.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM admin WHERE admin_id = '" + Session["admin_id"] + "'", baglanti);
        SqlDataReader rd = sorgu.ExecuteReader();
        if (rd.Read())
        {
            name = rd["name"].ToString();
        }
        rd.Close();
        SqlCommand sorgu1 = new SqlCommand("SELECT * FROM iletisim ", baglanti);
        SqlDataReader rd1 = sorgu1.ExecuteReader();
        if (rd1.Read())
        {
            adres = rd1["adres"].ToString();
            telefon = rd1["telefon"].ToString();
            fax = rd1["fax"].ToString();
            email = rd1["email"].ToString();

        }
        rd1.Close();
    }


</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery Otel Online Rezervasyon Sistemi</title>
		<meta charset = "utf-8" />
     <style>
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
           
            }
    </style>
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0" />
		<link rel = "stylesheet" type = "text/css" href = "css/bootstrap.css " />
		<link rel = "stylesheet" type = "text/css" href = "css/style.css" />
</head>
<body>
    <nav style = "background-color:rgba(0, 0, 0, 0.1);" class = "navbar navbar-default">
		<div  class = "container-fluid">
			<div class = "navbar-header">
				<a class = "navbar-brand" >Gallery Otel Online Rezervasyon Sistemi</a>
			</div>
			<ul class = "nav navbar-nav pull-right ">
				<li class = "dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class = "glyphicon glyphicon-user"></i> <% Response.Write(name);%></a>
					<ul class="dropdown-menu">
						<li><a href="logout.aspx"><i class = "glyphicon glyphicon-off"></i>Cıkış</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class = "container-fluid">	
		<ul class = "nav nav-pills">
			<li><a href = "home.aspx">Anasayfa</a></li>
					
		</ul>	
	</div>
	<br />
    <section class="about about-v2">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1">
                    <div class="about-centent">
                        <h2 class="about-title text-center">Gallery Otel İletişim Bilgileri</h2>
                        <div class="line-v2"></div>
                        <h2>Adres:</h2>
                        
                         <p class="about-p1" ><%  Response.Write(adres); %></p>


                        <h2>Telefon:</h2>
                        <p class="about-p1"><%Response.Write(telefon); %></p>
                        

                        <h2>Fax:</h2>
                        <p class="about-p2"><%Response.Write(fax); %></p>

                        <h2>E-mail:</h2>
                        <p class="about-p3"><%Response.Write(email); %></p>

                        


                    </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </section>
   
  <br />
  <br />
  <div class="footer">
     <nav style = "background-color:rgba(0, 0, 0, 0.1);" class = "navbar navbar-default">
    <div class = "container-fluid">
        
        
        <div class="grid_13">
        
          <div class="botmenu">
              <ul class = "nav navbar-nav pull-right ">
         
                    <li><a href="./hakkimizda.aspx">Hakkımızda</a></li>
                    <li class="last"><a href="./iletisim.aspx">İletişim</a></li>
              </ul>
            </div>
                        
        </div>
        
        <div class="clear"></div>

  </div>
    </nav>
</div>

</body>
</html>
