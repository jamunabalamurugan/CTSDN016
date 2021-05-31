<%@ Page Language="C#" AutoEventWireup="true" Trace="true" CodeBehind="HtmlandServerControl.aspx.cs" Inherits="PrjFirstApplication.HtmlandServerControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Difference between HTML and ServerControl<br /><br />

           HTML Control <input type="text" id="Input1" /><br /><br />
           SERVER Control<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <button id="Save">Save</button>
        </div>
    </form>
</body>
</html>
