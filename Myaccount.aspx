<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Myaccount.aspx.cs" Inherits="Myaccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    account
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
<asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="500px">
    <EditItemTemplate>
        Id
        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
        <br />
        user_name
        <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>' />
        <br />
        email_id
        <asp:TextBox ID="email_idTextBox" runat="server" Text='<%# Bind("email_id") %>' />
        <br />
        mobile_no
        <asp:TextBox ID="mobile_noTextBox" runat="server" Text='<%# Bind("mobile_no") %>' />
        <br />
        address
         <asp:TextBox ID="address" runat="server" Text='<%# Bind("address") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <InsertItemTemplate>
        Id:
        <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
        <br />
        user name
        <asp:TextBox ID="user_nameTextBox" runat="server" Text='<%# Bind("user_name") %>' />
        <br />
        email id
        <asp:TextBox ID="email_idTextBox" runat="server" Text='<%# Bind("email_id") %>' />
        <br />
        mobile no.
        <asp:TextBox ID="mobile_noTextBox" runat="server" Text='<%# Bind("mobile_no") %>' />
        <br />
        address
        <asp:TextBox ID="address" runat="server" Text='<%# Bind("address") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <table border ="1" style ="width :1000px;height :400px;text-align :center ;" >
       <tr><td>user id</td> 
       <td><asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' /></td>
        </tr>
      <tr> <td>user name:</td>
       <td> <asp:Label ID="user_nameLabel" runat="server" Text='<%# Bind("user_name") %>' /></td>
        </tr> 
      <tr> <td> email id:</td>
       <td> <asp:Label ID="email_idLabel" runat="server" Text='<%# Bind("email_id") %>' /></td>
        </tr>
      <tr> <td> mobile no.</td>
       <td> <asp:Label ID="mobile_noLabel" runat="server" Text='<%# Bind("mobile_no") %>' /></td>
       </tr>
            <tr><td>address</td>
                <td> <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' /></td>
            </tr>
</table>
    </ItemTemplate>
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [user_name], [email_id], [mobile_no], [address] FROM [user_data] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="user_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>


