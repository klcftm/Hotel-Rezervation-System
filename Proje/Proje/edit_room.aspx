<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_room.aspx.cs" Inherits="Proje.edit_room" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<script runat="server">
    string name,room_type,photo;
    string Price;
    SqlDataReader rd1;
    SqlConnection baglanti;
    String room_id;
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
    void degistir_Click(object sender, EventArgs e)
    {

        SqlCommand sorgu = new SqlCommand("UPDATE  room set checkin='"+date.Text+"' WHERE room_id='" + Request["room_id"] + "'",baglanti);
        sorgu.ExecuteNonQuery();
        

            Response.Redirect("reserve.aspx?room_id="+Request["room_id"]+"");
     
    }


</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<title>Gallery Otel Online Rezervasyon Sistemi</title>
		<meta charset = "utf-8" />
         <style>
        .center {
            
            width: 100%;
            height:100%;
           
            }
    </style>
		
		<meta charset = "utf-8" />
		<meta name = "viewport" content = "width=device-width, initial-scale=1.0" />
		<link rel = "stylesheet" type = "text/css" href = "css/bootstrap.css " />
		<link rel = "stylesheet" type = "text/css" href = "css/bootstrap-datetimepicker.css " />
		<link rel = "stylesheet" type = "text/css" href = "css/bootstrap-datetimepicker.min.css " />
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
						<li><a href="logout.php"><i class = "glyphicon glyphicon-off"></i> Cıkış</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class = "container-fluid">	
		<ul class = "nav nav-pills">
			<li><a href = "home.aspx">Anasayfa</a></li>
			<li><a href = "room.aspx">Oda</a></li>
			<li><a>Rezervasyon</a></li>
            <li><a href = "data.aspx">Kayıtlar</a></li>
						
		</ul>	
	</div>
	<br />
	<div class = "container-fluid">
		<div class = "panel panel-default">
			<div class = "panel-body">
				<div class = "alert alert-info">İşlem / Oda Seç</div>
				<br />
				<div class = "col-md-4">
					<%
                        if (Request.HttpMethod == "POST"){
                            SqlCommand sorgu = new SqlCommand("SELECT * FROM room WHERE room_id = '" + Request["room_id"] + "'", baglanti);
                            SqlDataReader rd = sorgu.ExecuteReader();
                        }
					%>
    <form id="form1" runat="server" method = "POST" enctype = "multipart/form-data">
       <%
           SqlCommand sorgu1=new SqlCommand("SELECT * FROM  room  where room_id = '" + Request["room_id"] + "'",baglanti) ;
           SqlDataReader rd1 = sorgu1.ExecuteReader();
           while (rd1.Read()){
         
							
							 Price=rd1["price"].ToString();
							 photo=rd1["photo"].ToString();
							 room_type=rd1["room_type"].ToString();

               }
					    %>	
					    <div class = "form-group">
							<label>Oda Türü </label>
							<input type = "text"  value = "<%Response.Write(room_type); %>" class = "form-control" name = "room_type" disabled = "disabled" />
						</div>
						<div class = "form-group">
							<label>Price </label>
							<input type = "text"  value = "<%Response.Write(Price); %>" class = "form-control" name = "price" disabled = "disabled" />
						</div>
						<div class = "form-group">
							<label>Resim </label>
							<div id = "preview" style = "width:400px; height :400px; border:1px solid #000;">
								<img src = "photo/<%Response.Write(photo+".jpg"); %>" id = "lbl" class="center"  />
							</div>
							
						</div>
						<div class="input-append date form_datetime" data-date="2012-12-21T15:25:00Z">

							<label>Tarih  </label>
                            
							<asp:TextBox ID = "date1"   class="form-control"  runat="server" ReadOnly="true"  value="" ></asp:TextBox>
                            <span class="add-on"><i class="icon-remove"></i></span>
						    <span class="add-on"><i class="icon-th"></i></span>
							 
						</div>
                             <asp:TextBox ID = "date"  class="form-control"  runat="server"  ></asp:TextBox>
                             
						
						<br />
						<div class = "form-group">
							 <asp:Button ID= "editroom"   runat="server"   text="Degişikliği Kaydet" class = "btn btn-warning form-control" OnClick="degistir_Click"/>
						</div>
					</form>
					
    
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
</body>
   <script src = "js/jquery.js"></script>
<script src = "js/bootstrap.js"></script>
<script src = "js/bootstrap-datetimepicker.js"></script>
<script src = "js/bootstrap-datetimepicker.min.js"></script>
<script type = "text/javascript">
	$(document).ready(function(){
		$pic = $('<img id = "image" width = "100%" height = "100%"/>');
		$lbl = $('<center id = "lbl">[Photo]</center>');
		$("#photo").change(function(){
			$("#lbl").remove();
			var files = !!this.files ? this.files : [];
			if(!files.length || !window.FileReader){
				$("#image").remove();
				$lbl.appendTo("#preview");
			}
			if(/^image/.test(files[0].type)){
				var reader = new FileReader();
				reader.readAsDataURL(files[0]);
				reader.onloadend = function(){
					$pic.appendTo("#preview");
					$("#image").attr("src", this.result);
				}
			}
		});
	});
</script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format: "dd MM yyyy - hh:ii",
        linkField: "date",
        linkFormat: "yyyy-mm-dd hh:ii"
    });
</script>

</html>
