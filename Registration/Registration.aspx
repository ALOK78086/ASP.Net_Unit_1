<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Registration.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

<div class="container">

    <h2>Student Registration Form</h2>

    <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server" CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server"
        TextMode="Password" CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblMobile" runat="server" Text="Mobile Number"></asp:Label>
    <asp:TextBox ID="txtMobile" runat="server" CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
    <asp:RadioButtonList ID="rblGender" runat="server">
        <asp:ListItem>Male</asp:ListItem>
        <asp:ListItem>Female</asp:ListItem>
        <asp:ListItem>Other</asp:ListItem>
    </asp:RadioButtonList>

    <asp:Label ID="lblHobbies" runat="server" Text="Hobbies"></asp:Label>
    <asp:CheckBox ID="chkReading" runat="server" Text="Reading" />
    <asp:CheckBox ID="chkGaming" runat="server" Text="Gaming" />
    <asp:CheckBox ID="chkCoding" runat="server" Text="Coding" />

    <br /><br />

    <asp:Label ID="lblDOB" runat="server" Text="Date of Birth"></asp:Label>
    <asp:TextBox ID="txtDOB" runat="server"
        TextMode="Date" CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
    <asp:DropDownList ID="ddlCountry" runat="server" CssClass="txt">
        <asp:ListItem>Select Country</asp:ListItem>
        <asp:ListItem>India</asp:ListItem>
        <asp:ListItem>Nepal</asp:ListItem>
        <asp:ListItem>Bhutan</asp:ListItem>
        <asp:ListItem>Bangladesh</asp:ListItem>
    </asp:DropDownList>

    <asp:Label ID="lblCourse" runat="server" Text="Course"></asp:Label>
    <asp:ListBox ID="lstCourse" runat="server" CssClass="txt">
        <asp:ListItem>BCA</asp:ListItem>
        <asp:ListItem>BBA</asp:ListItem>
        <asp:ListItem>B.Sc</asp:ListItem>
        <asp:ListItem>MCA</asp:ListItem>
    </asp:ListBox>

    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="txtAddress" runat="server"
        TextMode="MultiLine" Rows="4"
        CssClass="txt"></asp:TextBox>

    <asp:Label ID="lblPhoto" runat="server" Text="Upload Photo"></asp:Label>
    <asp:FileUpload ID="fuPhoto" runat="server" CssClass="txt" />

    <br /><br />

    <asp:CheckBox ID="chkTerms" runat="server"
        Text="I Accept Terms & Conditions" />

    <br /><br />

    <asp:Button ID="btnRegister" runat="server"
        Text="Register" CssClass="btn" />

    <asp:Button ID="btnReset" runat="server"
        Text="Reset" CssClass="btn" />

</div>

</form>

</body>
</html>
