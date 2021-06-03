<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validation Group.aspx.cs" Inherits="ValidationControl.Validation_Group" %>

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
        <td style="vertical-align: top">
            <table style="border: 1px solid black">
                <tr>
                    <td colspan="2">
                        <h2>
                            Login</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>User Name</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUN" runat="server" Width="100px">
                        </asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUN" 
                            runat="server" ForeColor="Red"
                            ErrorMessage="Username is required" 
                            ControlToValidate="txtUN" Display="Dynamic"
                            Text="*" ValidationGroup="Login">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Password</b>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxPWD" runat="server" Width="100px" 
                        TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPWD" 
                            runat="server" ForeColor="Red"
                            ErrorMessage="Password is required" 
                            ControlToValidate="TextBoxPWD" Display="Dynamic"
                            Text="*" ValidationGroup="Login">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnLogin" ValidationGroup="Login" 
                        runat="server" Text="Login" 
                        onclick="btnLogin_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ValidationGroup="Login" 
                            ID="ValidationSummary2" runat="server" 
                            ForeColor="Red" HeaderText="Page Errors"
                            ShowMessageBox="True" ShowSummary="true" 
                            DisplayMode="List" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblLoginStatus" runat="server" 
                        Font-Bold="true"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            &nbsp;&nbsp;
        </td>
        <td>
            <table>
    <tr>
        <td>
            <b>Name</b>
        </td>
        <td>
            :<asp:TextBox ID="txtName" runat="server" Width="150px" ValidationGroup="Register"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" 
            ErrorMessage="Name is required" ForeColor="Red"
            ControlToValidate="txtName" Display="Dynamic" ValidationGroup="Register" >*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <b>Gender</b>
        </td>
        <td>
            :<asp:DropDownList ID="ddlGender" runat="server" Width="150px">
                <asp:ListItem Text="Select Gender" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorGender" runat="server" 
            ErrorMessage="Gender is required" ForeColor="Red" InitialValue="-1"
            ControlToValidate="ddlGender"  Display="Dynamic" ValidationGroup="Register">*</asp:RequiredFieldValidator>
        </td>
    </tr>

                  <tr>
        <td class="auto-style1">
            <b>Password</b>
        </td>
        <td class="auto-style1">
            :<asp:TextBox ID="txtPassword" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorpassword" 
            runat="server" ErrorMessage="Password is required" 
            ControlToValidate="txtPassword" ForeColor="Red"
            Display="Dynamic" ValidationGroup="Register" >*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <strong>Retype Password</strong></td>
        <td>
            :<asp:TextBox ID="txtRetypePassword" runat="server" 
                Width="150px" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server"
            ErrorMessage="Password and Retype Password must match"
            ControlToValidate="txtRetypePassword" ControlToCompare="txtPassword"
            Type="String" Operator="Equal" ForeColor="Red" ValidationGroup="Register">*</asp:CompareValidator>
        </td>
    </tr>

                 <tr>
        <td>
            <b>Age</b>
        </td>
        <td>
            :<asp:TextBox ID="txtAge" runat="server" Width="150px">
                </asp:TextBox>
            <asp:RangeValidator ID="RangeValidatorAge" runat="server" 
                ErrorMessage="Age must be between 1 & 100"
                MinimumValue="1" MaximumValue="100"
                ControlToValidate="txtAge" Type="Integer" 
                ForeColor="Red" Display="Dynamic" ValidationGroup="Register">*</asp:RangeValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" 
            runat="server" ErrorMessage="Age is required" 
            ControlToValidate="txtAge" ForeColor="Red"
            Display="Dynamic" ValidationGroup="Register" >*</asp:RequiredFieldValidator>
        </td>
    </tr>
<tr>
    <td>EMail Id:</td>
    <td>
        <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" 
ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
ErrorMessage="Invalid Email" ForeColor="Red" ValidationGroup="Register"></asp:RegularExpressionValidator> 
    </td>
</tr>

<tr>
    <td class="auto-style2" colspan="2">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                ForeColor="Red" HeaderText="Page Errors" ShowMessageBox="True"
              ShowSummary="true"   DisplayMode="List"
                />
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
