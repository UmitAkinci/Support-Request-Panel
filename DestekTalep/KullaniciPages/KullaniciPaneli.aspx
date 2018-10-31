<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciPaneli.aspx.cs" Inherits="DestekTalep.KullaniciPaneli" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Kullanıcı Paneli</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>
        <div class="navbar navbar-inverse navbar-fixed-top" style="border-radius:15px; glyph-orientation-vertical:inherit;  background-color:lightskyblue">
            <div class="container">
                 <asp:Image ID="image1" ImageUrl='~/hobim.png' runat="server" />
                    <h1><a style="color:white; font:bold;font-family:Corbel;font-style:italic;" runat="server">HOBİM DESTEK TALEP</a>
                    </h1>
            <div class="navbar navbar-default" >
                <div class="navbar-inner">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" style="color:black; font:bold"  href="KullaniciTaleplerim.aspx">Taleplerim</a></li>
                        <li><a runat="server" style="color:black; font:bold; margin-left:400px;"  href="~/Login.aspx?act=loggoff" >ÇIKIŞ</a></li>                      
                    </ul>
                </div>
            </div>
                </div>
            </div>
        <div class="container body-content">
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - My ASP.NET Application</p>
            </footer>
        </div>

    </form>
</body>
</html>

