<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ServerControls.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Enter your Name"></asp:Label>&nbsp
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Label ID="Label2" runat="server" Text="Enter your Password"></asp:Label>&nbsp
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="DateofBirth"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
&nbsp;Gender
            <br />
            <asp:RadioButton ID="MaleRadioButton" runat="server" GroupName="Gender"  Text="Male"  OnCheckedChanged="MaleRadioButton_CheckedChanged"/>
            <br />
            <asp:RadioButton ID="FemaleRadioButton" runat="server" GroupName="Gender"  Text="Female" OnCheckedChanged="FemaleRadioButton_CheckedChanged" />
            <br />
            <br />
            <%--<asp:DropDownList ID="DropDownList1" runat="server" >
                <asp:ListItem Value="1">Chennai</asp:ListItem>
                <asp:ListItem Value="2" Text="Mumbai"></asp:ListItem>
                <asp:ListItem Value="3" Text="Pune"></asp:ListItem>
            </asp:DropDownList>--%>
           <asp:DropDownList ID="City" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        </div>
        
    </form>
</body>
</html>
