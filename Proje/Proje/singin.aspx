<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="singin.aspx.cs" Inherits="Proje.singin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gallery Otel Online Rezervasyon Sistemi</title>
    <meta charset = "utf-8" />
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
    </div>
</nav>
<div class = "container">
    <br />
    <br />
    <div class = "col-md-4"></div>
    <div class = "col-md-4">
        <div class = "panel panel-danger">
            <div class = "panel-heading">
                <h4>Kullanıcı</h4>
            </div>
            <div class = "panel-body">
    <form id="form1" runat="server">

       <div class = "form-group">
                        <label>Ad</label>
                        <asp:TextBox ID = "firstname" class = "form-control" required = "required" runat="server"></asp:TextBox>
                    </div>
                    <div class = "form-group">
                        <label>Soyad</label>
                        <asp:TextBox ID = "lastname"   class = "form-control" required = "required" runat="server"></asp:TextBox>
                    </div>
                    <div class = "form-group">
                        <label>İletişim Bilgisi</label>
                        <asp:TextBox ID = "contactno"   class = "form-control" required = "required" runat="server"></asp:TextBox>
                    </div>
                    <div class = "form-group">
                        <label>Şifre</label>
                        <asp:TextBox ID = "passaword"   class = "form-control" required = "required" runat="server"></asp:TextBox>
                    </div>
                    <br />
                    <div class = "form-group">
                        <asp:Button ID="kaydol"  runat="server"  text="Kaydol" class = "form-control btn btn-primary" OnClick="kaydol_Click" />
                    </div>
                    
    </form>
                </div>
        </div>
    </div>
    <div class = "col-md-4"></div>
</div>
<br />
<br />
</body>
    <script src = "js/jquery.js"></script>
    <script src = "js/bootstrap.js"></script>
</html>
