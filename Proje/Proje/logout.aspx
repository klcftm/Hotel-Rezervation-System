<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Proje.logout" %>

<!DOCTYPE html>
<script runat="server">
    
    void Page_Load(Object o, EventArgs e)
    {
        Session["admin_id"] = null;
        Response.Redirect("index.aspx");
    }


</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
