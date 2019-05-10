<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirm_reserve.aspx.cs" Inherits="Proje.confirm_reserve" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string name,room_type,photo,firstname,lastname,checkin;
    string Price,transaction_id,room_id;
    SqlDataReader rd1,rd3;
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


        SqlCommand sorgu9 = new SqlCommand("SELECT * FROM guest,room  WHERE  firstname = '" + name + "' and room_id = '" + Request["room_id"] + "' ",baglanti);
        SqlDataReader rd9 = sorgu9.ExecuteReader();
        if (rd9.Read()) {
            firstname=rd9["firstname"].ToString();
            lastname=rd9["lastname"].ToString();
            room_type=rd9["room_type"].ToString();
            room_id=rd9["room_id"].ToString();
            checkin=rd9["checkin"].ToString();
        }

    }
    
    



</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery Otel Online Rezervasyon Sistemi</title>
    <meta charset = "utf-8" />
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0" />
    <link rel = "stylesheet" type = "text/css" href = "css/bootstrap.css " />
    <link rel = "stylesheet" type = "text/css" href = "css/style.css" />
    <style type="text/css">
        .auto-style1 {
            display: block;
            width: 84%;
            height: 33px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }
    </style>
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
				<div class = "alert alert-info">Formu Doldurun</div>
				 
				<br />
				<form method = "POST"  enctype = "multipart/form-data" action = "save_form.aspx?transaction_id=<%Response.Write(transaction_id); %>&room_id=<%Response.Write(room_id); %>">
					<div class = "form-inline" style = "float:left;">
						<label>Ad </label>
						<br />
						<input type = "text" value = "<%Response.Write(firstname); %>" class = "form-control" size = "40" disabled = "disabled" />
					</div>
					
					<div class = "form-inline" style = "float:left; margin-left:20px;">
						<label>Soyad</label>
						<br />
						<input type = "text" value = "<%Response.Write(lastname); %>" class = "form-control" size = "40" disabled = "disabled" />
					</div>
					<br style = "clear:both;"/>
					<br />
					<div class = "form-inline" style = "float:left;">
						<label>Tarih</label>
						<br />
						<input type = "text" value = "<%Response.Write(checkin); %>" class = "form-control" size = "40" disabled = "disabled" />
					</div>
					<br style = "clear:both;"/>
					<br />
					<div class = "form-inline" style = "float:left;">
						<label>Oda Türü</label>
						<br />
						<input type = "text" value = "<%Response.Write(room_type); %>" class = "form-control" size = "20" disabled = "disabled" />
					</div>
					
					<div class = "form-inline" style = "float:left; margin-left:20px;">
						<label for="days">Gün Sayısı</label>
						<br />            
						<input type = "number"  value="@Request.Form["days"]" min = "0" max = "99" name= "days" class = "form-control" required = "required"/>
					</div>
					<div class = "form-inline" style = "float:left; margin-left:20px;">
                   
						<label for="extra_bed">Extra Yatak</label>
						<br />
						<input type = "number"  value="@Request.Form["extra_bed"]" min = "0" max = "99" name = "extra_bed" class = "form-control" required = "required"/>
					</div>
					<div class = "form-inline" style = "float:left; margin-left:20px;">
						<label style = "color:#ff0000;">*Extra yatak maliyeti 200TL</label>
					</div>
					<br style = "clear:both;"/>
					<br />
					<button name = "add_form" class = "btn btn-primary"  ><i class = "glyphicon glyphicon-save" ></i> Kaydet</button>
				</form>
			</div>
		</div>
	</div>
	<br />
	<br />
	
</body>
<script>
   
</script>
<script src = "js/jquery.js"></script>
<script src = "js/bootstrap.js"></script>	
</html>

