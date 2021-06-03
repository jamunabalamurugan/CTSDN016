<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ValidationControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
    <tr>
        <td>
            <b>Name</b>
        </td>
        <td>
            :<asp:TextBox ID="txtName" runat="server" Width="150px">
            </asp:TextBox>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName"
                runat="server" ErrorMessage="Name is Required"
                ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <b>Gender</b>
        </td>
        <td>
            <asp:DropDownList ID="ddlGender" runat="server" Width="150px">
                <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlGender"
                runat="server" ErrorMessage="Select From List"
                ControlToValidate="ddlGender" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

        </td>
    </tr>

                  <tr>
        <td>
            <b>Password</b>
        </td>
        <td>
            :<asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <strong>Retype Password</strong></td>
        <td>
            :<asp:TextBox ID="txtRetypePassword" runat="server" 
                Width="150px" TextMode="Password"></asp:TextBox>

             <asp:RequiredFieldValidator ID="RequiredFieldValidatorretypePassword"
                runat="server" ErrorMessage="Password required"
                ControlToValidate="txtRetypePassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" 
                ErrorMessage="Password MisMatch" 
                ControlToValidate="txtRetypePassword"
                ControlToCompare="txtPassword" Type="String" Operator="Equal" Display="Dynamic">

            </asp:CompareValidator>


        </td>
    </tr>

                 <tr>
        <td>
            <b>Age</b>
        </td>
        <td>
            :<asp:TextBox ID="txtAge" runat="server" Width="150px">
                </asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtAge" 
                runat="server" ControlToValidate="txtAge"
                ErrorMessage="Age Should be between 1 and 100"
                MinimumValue="1" MaximumValue="100" Type="Integer" Display="Dynamic">

            </asp:RequiredFieldValidator>
           
        </td>
    </tr>
                 <tr>
        <td>
            <b>Date Available</b>
        </td>
        <td>
            :<asp:TextBox ID="txtDateAvailable" runat="server" Width="150px">
            </asp:TextBox>
           
        </td>
    </tr>
<tr>
    <td>EMail Id:</td>
    <td>
        <asp:TextBox ID="txtEmail" runat="server" Width="150px">
</asp:TextBox>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidatorEmail"
            runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>

    </td>
</tr>

    <tr>
        <td colspan="2">
            <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" 
                onclick="btnSave_Click"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblStatus" runat="server" Font-Bold="true">
            </asp:Label>
        </td>
    </tr>
</table>
        </div>
    </form>
</body>
</html>
