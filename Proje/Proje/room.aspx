<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="room.aspx.cs" Inherits="Proje.room" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string name;
    SqlDataReader rd1;
    SqlConnection baglanti;

    void Page_Load(Object o, EventArgs e)
    {
        baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
        baglanti.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM admin WHERE admin_id = '" + Session["admin_id"] + "'", baglanti);
        SqlDataReader rd = sorgu.ExecuteReader();
        if (rd.Read()) {

            name=rd["name"].ToString();

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
				<div class = "alert alert-info"> işlem/Oda</div>
				
				<br />
				<br />
				<table id = "table" class = "table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Oda Türü</th>
							<th>Fiyat</th>
							<th>Resim</th>
							<th>İşlem</th>
						</tr>
					</thead>
					<tbody>
						<% 
                                SqlCommand sorgu1 = new SqlCommand("SELECT * FROM room", baglanti);
                                rd1 = sorgu1.ExecuteReader();
                                while (rd1.Read())
                            { %>
						<tr>
							<td><% Response.Write(rd1["room_id"].ToString()); %></td>
							<td><%Response.Write(rd1["room_type"].ToString()); %></td>
							<td><% Response.Write(rd1["price"].ToString()); %></td>
							<td><img src = "photo/<% Response.Write(rd1["photo"].ToString() + ".jpg"); %>" height = "50" width = "50" class="center"/></td>
							<td><a class = "btn btn-warning" href = "edit_room.aspx?room_id=<% Response.Write(rd1["room_id"].ToString()); %>"><i class = "glyphicon glyphicon-edit"></i> Seç</a> </td>
						</tr>
						<% 
                            }%>
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
	function confirmationDelete(anchor){
		var conf = confirm("Are you sure you want to delete this record?");
		if(conf){
			window.location = anchor.attr("href");
		}
	} 
</script>

<script type = "text/javascript">
	$(document).ready(function(){
		$("#table").DataTable();
	});
</script>
</html>
