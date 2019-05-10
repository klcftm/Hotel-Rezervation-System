<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hakkimizda.aspx.cs" Inherits="Proje.hakkimizda" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    
    string genel, odalar, restoran, plaj, spa, aktivite, diger,name;
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
        SqlCommand sorgu1 = new SqlCommand("SELECT * FROM hakkimizda ", baglanti);
        SqlDataReader rd1 = sorgu1.ExecuteReader();
        if (rd1.Read())
        {
            genel = rd1["genel"].ToString();
            odalar = rd1["odalar"].ToString();
            restoran = rd1["restoran"].ToString();
            plaj = rd1["plaj"].ToString();
            spa = rd1["spa"].ToString();
            aktivite = rd1["aktivite"].ToString();
            diger = rd1["diger"].ToString();

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
    <!-- ABOUT-US-->
    <section class="about about-v2">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10 col-lg-offset-1">
                    <div class="about-centent">
                        <h2 class="about-title text-center">Gallery Otel Hakkında</h2>
                        <div class="line-v2"></div>
                        <h2>Genel</h2>
                        
                         <p class="about-p1" ><%  Response.WriteFile("text/"+genel+".txt"); %></p>


                        <h2>Odalar</h2>
                        <p class="about-p1"><%Response.WriteFile("text/" + odalar + ".txt"); %></p>
                        

                        <h2>Restoran&Bar</h2>
                        <p class="about-p2"><%Response.WriteFile("text/" + restoran + ".txt"); %></p>

                        <h2>Plaj&Havuz</h2>
                        <p class="about-p3"><%Response.WriteFile("text/"+plaj+".txt"); %></p>

                        <h2>Spa&Wellness</h2>
                         <p class="about-p4"><%Response.WriteFile("text/"+spa+".txt"); %></p>

                        <h2>Aktivite&Eğlence</h2>
                        <p class="about-p5"><%Response.WriteFile("text/" + aktivite + ".txt"); %></p>

                        <h2>Diğer Hizmetler</h2>
                        <p class="about-p6"><%Response.WriteFile("text/"+diger+".txt"); %></p>


                    </div>
                    <div class="about-img">
                        <div class="img-1">
                            <img src="images/gallery/1.jpg" class="img-responsive" alt="Image"/>
                            <div class="img-2">
                                <img src="images/gallery/2.jpg" class="img-responsive" alt="Image"/>
                            </div>
                        </div>
                        <div class="img-3">
                            <img src="images/gallery/3.jpg" class="img-responsive" alt="Image"/>
                            <div class="img-4">
                                <img src="images/gallery/4.jpg" class="img-responsive" alt="Image"/>
                            </div>
                        </div>
                        <div class="img-5">
                            <img src="images/gallery/5.jpg" class="img-responsive" alt="Image"/>
                            <div class="img-6">
                                <img src="images/gallery/6.jpg" class="img-responsive" alt="Image"/>
                            </div>
                        </div>
                        
                        <div class="img-9">
                            <img src="images/gallery/9.jpg" class="img-responsive" alt="Image"/>
                            
                        </div>
                        <div class="img-11">
                            <img src="images/gallery/11.jpg" class="img-responsive" alt="Image"/>
                            <div class="img-12">
                                <img src="images/gallery/12.jpg" class="img-responsive" alt="Image"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END/ ABOUT-US-->
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
