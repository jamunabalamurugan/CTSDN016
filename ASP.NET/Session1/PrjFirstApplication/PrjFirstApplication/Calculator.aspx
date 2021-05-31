<%@ Page Language="C#" AutoEventWireup="true" trace="true" CodeBehind="Calculator.aspx.cs" Inherits="PrjFirstApplication.Calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="font-family: 'Courier New', Courier, monospace; color: #00FFFF; font-style: normal; font-weight: bolder; font-size: large">Calculator</p>
            <br />
            <asp:Label ID="Label1" runat="server" Text="Value1" BorderColor="#003399" Font-Italic="True" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="input1" runat="server" OnTextChanged="input1_TextChanged" BackColor="#99CCFF" AutoPostBack="True"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Value2"></asp:Label>
             <asp:TextBox ID="input2" runat="server"></asp:TextBox>

            <br />
            <label>Value3</label>
            <asp:TextBox ID="input3" runat="server"></asp:TextBox>
            <label>Value4</label>
            <asp:TextBox ID="input4" runat="server"></asp:TextBox>
            <br />
            <br />
            Result&nbsp;   
              <asp:TextBox ID="Result" runat="server"></asp:TextBox>
            <br />
            <hr />
            <br />
         <br />

        &nbsp;
            <asp:Button ID="Addition" runat="server" Text="Add" OnClick="AddMethod"  />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Subtraction" runat="server" Text="Sub" OnClick="SubMethod"  />
               &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Multiply" runat="server" OnClick="MultiplyMethod" Text="Product" />
            &nbsp;
            <asp:Button ID="NewCancel" runat="server" BorderStyle="Dotted" Text="Cancel" ValidateRequestMode="Enabled" OnClick="btnCancel" />
            &nbsp;
            <asp:Button ID="btnClear1" runat="server" Text="Clear" OnClick="btnClear" />
            <br />
        </div>
    </form>
</body>
</html>
