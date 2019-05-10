<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="data.aspx.cs" Inherits="Proje.data" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string f_p,f_ci,name,firstname,lastname,contactno,room_type,checkin,status,transaction_id,room_id;
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
            <li><a href = "room.aspx">Oda</a></li>	
			<li class = "active"><a>Rezervasyon</a></li>
            <li><a href = "data.aspx">Kayıtlar</a></li>
					
		</ul>	
	</div>
	<br />
    <div class = "container-fluid">	
		<div class = "panel panel-default">
			
			<div class = "panel-body">
				
				<br />
				<br />
				<table id = "table" class = "table table-bordered">
					<thead>
						<tr>
							<th>Ad</th>
							<th>Oda Türü</th>						
							<th>Giriş</th>
							<th>Gün Sayısı</th>
							<th>Çıkış</th>
							<th>Extra Yatak</th>
							<th>Ücret</th>
							
						</tr>
					</thead>
					<tbody>
						<% 
                            SqlCommand sorgu = new SqlCommand("SELECT * FROM  checkin  WHERE  cfirstname = '" + name + "'    ", baglanti);
                            SqlDataReader rd4 = sorgu.ExecuteReader();
                            while (rd4.Read())
                            {
						 %>
						<tr>

							<td><%Response.Write(rd4["cfirstname"].ToString()+" "+rd4["clastname"].ToString()); %></td>
							<td><%Response.Write(rd4["croom_type"].ToString()); %></td>
							<td><%Response.Write("<label style = 'color:#00ff00;'>"+rd4["checkin_time"].ToString()+"</label>"); %></td>
							<td><%Response.Write(rd4["days"].ToString()); %></td>
							<td><%Response.Write("<label style = 'color:#ff0000;'>"+Convert.ToDateTime(rd4["checkin_time"].ToString()).AddDays(Convert.ToInt32(rd4["days"].ToString()))+"</label>"); %></td>
							<td><%if (Convert.ToInt32(rd4["extrabed"].ToString()) == 0) { Response.Write("None"); } else { Response.Write(rd4["extrabed"].ToString()); } %></td>
							<td><%Response.Write(rd4["bill"].ToString()+".00TL"); %></td>
							

							
						</tr>
						<% 
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<br />
	<br />
    
</body>
    <script src = "js/jquery.js"></script>
<script src = "js/bootstrap.js"></script>
<script src = "js/jquery.dataTables.js"></script>
<script src = "js/dataTables.bootstrap.js"></script>	
<script type = "text/javascript">
	$(document).ready(function(){
		$("#table").DataTable();
	});
</script>
<script type = "text/javascript">
	function confirmationCheckin(anchor){
		var conf = confirm("Silmek istediğinize emin misiniz?");
		if(conf){
			window.location = anchor.attr("href");
		}
	}
	function confirmationCheckin2(anchor){
		var conf = confirm("Bigileriniz sistemimize kaydolmuştur.");
		if(conf){
			window.location = anchor.attr("href");
		}
	}
</script>
</html>
