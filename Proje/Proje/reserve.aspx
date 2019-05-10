<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reserve.aspx.cs" Inherits="Proje.reserve" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string f_p,f_ci,name,firstname,lastname,contactno,room_type,checkin,status,transaction_id,room_id;
    void Page_Load(Object o, EventArgs e)
    {
        SqlConnection baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
        baglanti.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM admin WHERE admin_id = '" + Session["admin_id"] + "'", baglanti);
        SqlDataReader rd = sorgu.ExecuteReader();
        if (rd.Read()) {
            name=rd["name"].ToString();
        }
        rd.Close();

        SqlCommand sorgu3 = new SqlCommand("SELECT * FROM  durum,guest,room,admin  WHERE  (status= @status) AND (room_id=" + Request["room_id"] + ") AND (firstname='"+name+"')", baglanti);
        sorgu3.Parameters.AddWithValue("@status","Beklemede");

        SqlDataReader rd3 = sorgu3.ExecuteReader();
        if (rd3.Read()) {
            firstname=rd3["firstname"].ToString();
            lastname=rd3["lastname"].ToString();
            checkin=rd3["checkin"].ToString();
            contactno=rd3["contactno"].ToString();
            room_type=rd3["room_type"].ToString();
            transaction_id=rd3["transaction_id"].ToString();
            status=rd3["status"].ToString();
            room_id = rd3["room_id"].ToString();
        }
        rd3.Close();
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
							
							<th>Kullanıcı Adı</th>
							<th>İletişim Bilgileri</th>
							<th>Oda Tipi</th>
							<th>Rezervasyon Tarihi</th>
							<th>Durum</th>
							<th>Faaliyet</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							
							<td><% Response.Write(firstname + " " + lastname); %></td>
							<td><% Response.Write(contactno); %></td>
							<td><% Response.Write(room_type); %></td>
                            <td><strong><%Response.Write(checkin); %></strong></td>
							<td><% Response.Write(status); %></td>
							<td><a class = "btn btn-success"  href = "confirm_reserve.aspx?transaction_id=<%Response.Write(transaction_id); %>&room_id=<%Response.Write(room_id); %>"><i class = "glyphicon glyphicon-check"></i> Kaydol</a>
                                </td>
						</tr>
						
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
	function confirmationDelete(anchor){
		var conf = confirm("Kaydı silmek istediğinize emin misiniz?");
		if(conf){
			window.location = anchor.attr("href");
		}
	} 
</script>
</html>
