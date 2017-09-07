<%@ Page Title="" Language="C#" MasterPageFile="~/Method/UserSite.Master" AutoEventWireup="true" CodeBehind="ImageUpload.aspx.cs" Inherits="StudentWebsite.User.ImageUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
.UserImage{margin:10px 0 0;height:2.0em;line-height:2.5;border:solid 1px #ccd0d3;padding:5px;font-size:12px;}
#DivImgUser img{width:50px;height:50px;}
.uploadImg{margin-top:30px;border:solid 1px #ccd0d3;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="margin-top:15px;">
<div>用户当前头像：
    <asp:Image ID="imagePic" runat="server" Width="50px" Height="50px" />
</div>
<div class="UserImage">
你可以参考一些图像，如：
</div>
<div style="margin-top:10px;" id="DivImgUser">
<img src="Image/01.jpg"/>&nbsp;
<img src="Image/02.jpg"/>&nbsp;
<img src="Image/03.jpeg"/>&nbsp;
<img src="Image/04.jpg"/>&nbsp;
<img src="Image/05.jpg"/>&nbsp;
<img src="Image/06.jpg"/>&nbsp;
<img src="Image/07.jpg"/>&nbsp;
</div>
<div class="uploadImg">
<span>用户上传图像：</span> 
    <asp:FileUpload ID="FileUpLoadImg" runat="server" />&nbsp;<asp:Button ID="BtnImg" 
        runat="server" Text="提交" Width="79px" onclick="BtnImg_Click" />
</div>
</div>
</asp:Content>
