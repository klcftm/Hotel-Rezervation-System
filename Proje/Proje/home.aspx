<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Proje.home" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string name;
    void Page_Load(Object o, EventArgs e)
    {
        SqlConnection baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
        baglanti.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM admin WHERE admin_id = '" + Session["admin_id"] + "'", baglanti);
        SqlDataReader rd = sorgu.ExecuteReader();
        if (rd.Read()) {
          
            name=rd["name"].ToString();
           
        }


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
					<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class = "glyphicon glyphicon-user"></i><%  Response.Write(name);   %></a>
					<ul class="dropdown-menu">
						<li><a href="logout.aspx"><i class = "glyphicon glyphicon-off"></i> Cıkış</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class = "container-fluid">	
		<ul class = "nav nav-pills">
			<li class = "active"><a href = "home.aspx"> Anasayfa</a></li>
            <li><a href = "room.aspx"> Oda</a></li>	
			<li><a> Rezervasyon</a></li>
            <li><a href = "data.aspx">Kayıtlar</a></li>
					
		</ul>	
	</div>
	<br />
	<div class = "container-fluid">
		<div class = "panel panel-default">
			<div class = "panel-body">
				<img src = "images/hotelimage.jpg"  class="center" />
			</div>
		</div>
	</div>
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
    <script src = "js/jquery.js"></script>
    <script src = "js/bootstrap.js"></script>
</html>
