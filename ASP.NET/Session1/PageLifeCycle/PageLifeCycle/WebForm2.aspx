<%@ Page Language="C#" AutoEventWireup="true" Trace="true" CodeBehind="WebForm2.aspx.cs" Inherits="PageLifeCycle.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            City :<asp:DropDownList ID="ddlCity" runat="server" DataValueField="Chennai"></asp:DropDownList>
        </div>
    </form>
</body>
</html>
