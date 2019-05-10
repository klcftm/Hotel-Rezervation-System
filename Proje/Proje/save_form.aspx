<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="save_form.aspx.cs" Inherits="Proje.save_form" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string f_p,f_ci,name,firstname,lastname,contactno,room_type,checkin,status,transaction_id,room_id,price;
    DateTime checkout,checkin1;
    int total = 0, result = 0, total2 = 0;
    SqlConnection baglanti;
    void Page_Load(Object o, EventArgs e)
    {
        var days = "";
        var extra_bed = "";
        
        days = Request.Form["days"];
        extra_bed = Request.Form["extra_bed"];
       
        baglanti = new SqlConnection("Data Source=LAPTOP-F1OAJ4IM\\SQLEXPRESS; Initial Catalog=hotel; integrated security=true;");
        baglanti.Open();
        SqlCommand sorgu = new SqlCommand("SELECT * FROM admin WHERE admin_id = '" + Session["admin_id"] + "'", baglanti);
        SqlDataReader rd = sorgu.ExecuteReader();
        if (rd.Read()) {
            name=rd["name"].ToString();
        }
        rd.Close();
        SqlCommand sorgu9 = new SqlCommand("SELECT * FROM guest,room  WHERE  firstname = '" + name + "' and room_id = '" + Request["room_id"] + "' ",baglanti);
        SqlDataReader rd9 = sorgu9.ExecuteReader();
        if (rd9.Read()) {
            firstname=rd9["firstname"].ToString();
            lastname=rd9["lastname"].ToString();
            price = rd9["price"].ToString();
            room_type=rd9["room_type"].ToString();
            room_id=rd9["room_id"].ToString();
            checkin=rd9["checkin"].ToString();
        }

        rd9.Close();
        total = 200 *Convert.ToInt32(extra_bed);

        total2 = Convert.ToInt32( price) * Convert.ToInt32( days);
        result = total + total2;
        checkout = Convert.ToDateTime(checkin);
        checkin1 = checkout;
        checkout=checkout.AddDays(Convert.ToInt32(days));

        SqlCommand sorgu4 = new SqlCommand("INSERT INTO checkin (cfirstname,clastname,croom_type,days,extrabed,bill,checkin_time,checkout) VALUES ('"+firstname+"','"+lastname+"','"+room_type+"',@1,@2,'"+result+"','"+Convert.ToDateTime(checkin)+"','"+checkout+"')",baglanti); //Convert.ToDateTime(checkin)
        sorgu4.Parameters.AddWithValue("@1",Convert.ToInt32(days));
        sorgu4.Parameters.AddWithValue("@2",Convert.ToInt32(extra_bed));
        sorgu4.ExecuteNonQuery();


    }




</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery Otel Online Rezervasyon Sistemi</title>
		<meta charset = "utf-8" />
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0" />
		<link rel = "stylesheet" type = "text/css" href = "/css/bootstrap.css " />
		<link rel = "stylesheet" type = "text/css" href = "/css/style.css" />
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
							<th>Durum</th>
						</tr>
					</thead>
					<tbody>
						<% 
                            SqlCommand sorgu5 = new SqlCommand("SELECT * FROM guest,checkin,room  WHERE  room_id = '"+Request["room_id"]+"'  and  cfirstname = '"+name+"' and  firstname = '"+name+"'  ",baglanti) ;
                            SqlDataReader rd5 = sorgu5.ExecuteReader();
                            while (rd5.Read()) {

						%>
						<tr>
							<td><%Response.Write(rd5["firstname"].ToString()+" "+rd5["lastname"].ToString()); %></td>
							<td><%Response.Write(rd5["croom_type"].ToString()); %></td>
							<td><%Response.Write("<label style = 'color:#00ff00;'>"+rd5["checkin"].ToString()+"</label>"); %></td>
							<td><%Response.Write(rd5["days"].ToString()); %></td>
							<td><%Response.Write("<label style = 'color:#ff0000;'>"+Convert.ToDateTime(rd5["checkin"].ToString()).AddDays(Convert.ToInt32(rd5["days"].ToString()))+"</label>"); %></td>
							<td><%if (Convert.ToInt32(rd5["extrabed"].ToString()) == 0) { Response.Write("None"); } else { Response.Write(rd5["extrabed"].ToString()); } %></td>
							<td><%Response.Write(rd5["bill"].ToString()+".00TL"); %></td>
							

							<td><a class = "btn btn-warning" onclick = "confirmationCheckin2(); return false;" href = "home.aspx" ><i class = "glyphicon glyphicon-check"></i> Tamam</a> 
                                <a class = "btn btn-warning" onclick = "confirmationCheckin(); return false;" href = "delete.aspx?checkin_id=<%Response.Write(rd5["checkin_id"].ToString()); %>"  ><i class = "glyphicon glyphicon-trash"></i> SİL</a></td>
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
