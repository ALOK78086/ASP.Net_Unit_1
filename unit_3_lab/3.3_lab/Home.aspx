<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Title="Home" %>
<asp:Content ID="c1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <h2>Welcome to the Home Page</h2>
  <p>This page uses the master page <b>Site.master</b>. The header, menu and
     footer come from the master page and only this content area is written here.</p>
  <asp:Button ID="btnStart" runat="server" Text="Get Started" />
</asp:Content>
