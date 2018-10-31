<%@ Page Title="Kullanıcı Tanımlama" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KullaniciTanimlama.aspx.cs" Inherits="DestekTalep.KullaniciTanimlama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <style type="text/css">

.ddlstyle 
{
color:black;
font-size: 10px;
padding: 5px 15px;
border-radius: 5px;
background-color:white;
font-weight: bold;
font-stretch:normal;
}
.input[type=text] {
    border: 2px solid red;
    border-radius: 4px;
}
.mGrid { 
    width: 100%; 
    background-color: #fff; 
    margin: 5px 0 10px 0; 
    border: solid 1px #525252; 
    border-collapse:collapse; 
}
.mGrid td { 
    padding: 2px; 
    border: solid 1px #c1c1c1; 
    color: #717171; 
}
.mGrid th { 
    padding: 4px 2px; 
    color: #fff; 
    background: #424242 url(grd_head.png) repeat-x top; 
    border-left: solid 1px #525252; 
    font-size: 0.9em; 
}
.mGrid .alt { background: #fcfcfc url(grd_alt.png) repeat-x top; }
        .mGrid .pgr {
            background: #424242 url(grd_pgr.png) repeat-x top;
        }
.mGrid .pgr table { margin: 5px 0; }
.mGrid .pgr td { 
    border-width: 0; 
    padding: 0 6px; 
    border-left: solid 1px #666; 
    font-weight: bold; 
    color: #fff; 
    line-height: 12px; 
 }   
.mGrid .pgr a { color: #666; text-decoration: none; }
.mGrid .pgr a:hover { color: #000; text-decoration: none; }
.button {

/* text */
	text-decoration: 		none;
	font: 					9px/1em 'Droid Sans', sans-serif;
	font-weight: 			bold;
	text-shadow: 			rgba(255,255,255,.5) 0 1px 0;
	-webkit-user-select: 	none;
	-moz-user-select: 		none;
	user-select: 			none;
	
	
/* layout */
	padding: 				.5em .6em .4em .6em;
	margin: 				.5em;
	display: 				inline-block;
	position: 				relative;
	
	-webkit-border-radius: 	8px;
	-moz-border-radius: 	8px;
	border-radius: 	8px;
	
/* effects */
	border-top: 		1px solid rgba(255,255,255,0.8);
	border-bottom: 		1px solid rgba(0,0,0,0.1);
	
	background-image: 	-webkit-gradient(radial, 50% 0, 100, 50% 0, 0, from( rgba(255,255,255,0) ), to( rgba(255,255,255,0.7) )), url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png);
	background-image: 	-moz-radial-gradient(top, ellipse cover, rgba(255,255,255,0.7) 0%, rgba(255,255,255,0) 100%), url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png);
	background-image: 	gradient(radial, 50% 0, 100, 50% 0, 0, from( rgba(255,255,255,0) ), to( rgba(255,255,255,0.7))), url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png);

	-webkit-transition: background .2s ease-in-out;
	-moz-transition: 	background .2s ease-in-out;
	transition: 		background .2s ease-in-out;
	
/* color */
	color: 				hsl(0, 0%, 40%) !important;
	background-color: 	hsl(0, 0%, 75%);
	
	-webkit-box-shadow: inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ 
						hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */
						rgba(0,0,0,0.2) 0 .5em 5px; /* drop shadow */
	-moz-box-shadow: 	inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ 
						hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */
						rgba(0,0,0,0.2) 0 .5em 5px; /* drop shadow */
	box-shadow:		 	inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ 
						hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */
						rgba(0,0,0,0.2) 0 .5em 5px; /* drop shadow */
}
        .auto-style1 {
            /* text */
	    text-decoration: none;
            font-weight: bold;
            text-shadow: rgba(255,255,255,.5) 0 1px 0;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none; /* layout */
            padding: .5em .6em .4em .6em;
            margin: .5em;
            display: inline-block;
            position: relative;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px; /* effects */
            background-image: -webkit-gradient(radial, 50% 0, 100, 50% 0, 0, from( rgba(255,255,255,0) ), to( rgba(255,255,255,0.7) )), url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png);
            background-image: -moz-radial-gradient(top, ellipse cover, rgba(255,255,255,0.7) 0%, rgba(255,255,255,0) 100%), url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png);
            background-image: url('gradient(radial,%2050%25%200,%20100,%2050%25%200,%200,%20from(%20rgba(255,255,255,0)%20),%20to(%20rgba(255,255,255,0.7)%20)),%20url(https://lh4.googleusercontent.com/-Qs9-Ohgo6sk/UY11O1WoMQI/AAAAAAAACME/nUID7awcMow/s50-no/noise.png)');
            -webkit-transition: background .2s ease-in-out;
            -moz-transition: background .2s ease-in-out;
            transition: background .2s ease-in-out; /* color */
            color: hsl(0, 0%, 40%);
            background-color: hsl(0, 0%, 75%);
            -webkit-box-shadow: inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */ rgba(0,0,0,0.2) 0 .5em 5px; /* drop shadow */
            -moz-box-shadow: inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */ rgba(0,0,0,0.2) 0 .5em 5px; /* drop shadow */
            box-shadow: inset rgba(255,254,255,0.6) 0 0.3em .3em, inset rgba(0,0,0,0.15) 0 -0.1em .3em, /* inner shadow */ hsl(0, 0%, 60%) 0 .1em 3px, hsl(0, 0%, 45%) 0 .3em 1px, /* color border */ rgba(0,0,0,0.2) 0 .5em 5px;
            font-style: normal;
            font-variant: normal;
            font-size: 9px;
            line-height: 1em;
            font-family: "Droid Sans", sans-serif;
            left: 400px;
            top: 0px;
            width: 105px;
            height: 25px;
        }
    </style>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
<div style="background-color:lightskyblue; border-radius:15px;">
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı :" Font-Bold="True" Font-Names="corbel" ForeColor="White"></asp:Label>
&nbsp;<asp:TextBox ID="txt_kullaniciAdi" runat="server" Font-Names="corbel"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label2" runat="server" Text="Şifre :" Font-Bold="True" Font-Names="corbel" ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="txt_sifre" runat="server" Font-Names="corbel"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Personel :" Font-Bold="True" Font-Names="corbel" ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:DropDownList ID="DropDownList1" runat="server" CssClass="ddlstyle" AutoPostBack="True">
    </asp:DropDownList>
    <br />
    <asp:Button ID="Button1" runat="server" CssClass="auto-style1" OnClick="Button1_Click" Text="EKLE" Font-Bold="True" Font-Size="10" />
    <br />
    </div>
    <br />
    <div style="background-color:lightskyblue; border-radius:15px;">
    <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Font-Size="8pt">
        <Columns>
            <asp:TemplateField HeaderText="Güncelle">
                <ItemTemplate>
                    <a href='KullaniciTanimlama.aspx?KullaniciID=<%#Eval("KullaniciID") %>'>
                        <asp:Button ID="button1" Text="Güncelle" CssClass="button" runat="server" />
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </div>
    <br />
&nbsp;
</asp:Content>
