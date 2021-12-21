   <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="compare.aspx.cs" Inherits="compare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   Compare product| E-Shopper
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style>
        .left {
            border:solid 1px;
            float :left ;
            width:49%;

        }
        .right {
            border:solid 1px;
            float :right;
            width :49%;

        }
        .line { 
         display:inline-block;
         background-color:silver;
        }
        
        .main {
            height:800px;
            width:auto;
        }
        .imge {
            margin-left:130px;
        }
        .compare {
            margin-top:20px;
            margin-left :400px;
           
        }
        .center {
            margin-left :100px;
            margin-right :100px;
        }
      </style>
    <div class ="container">
        <div class="row">
                <div class="col-sm-1 col-sm-offset-1" >
                </div>
            <div class="col-sm-1 col-sm-offset-1" >
              <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-sm-1 col-sm-offset-1" >
               <asp:Button ID="Button1" runat="server" Text="compare with" Width="114px" Border-radius="10px" OnClick="Button1_Click" BackColor="#FF9900"/>
            </div>
            <div class="col-sm-2 col-sm-offset-1" >
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> <asp:Label ID="Label12" runat="server"></asp:Label> <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
        </div>
    </div>
    <div class="container">
        <hr />
			<div class="row">
                <div class="col-sm-5 col-sm-offset-1" >
                     <div class="center">
    <asp:Repeater ID="d2" runat="server">
   <ItemTemplate>
            <table>
                <tr><td><asp:Image ID="Label1" runat="server" ImageUrl='<%#Eval("product_image") %>' Width="300px"  Height="250"/> </td></tr>
                <tr><td><hr /></td></tr>
                <tr><td> <asp:Label ID="Label2" runat="server" Text='<%#Eval("product_name") %>'/></td></tr> 
                <tr><td>Rs. <asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></td></tr> 
             
                <tr><td> <asp:Label ID="Label3" runat="server" Text='<%#Eval("product_dec") %>'/></td></tr> 
                
                   <tr><td> <asp:Label ID="Label5" runat="server" Text='<%#Eval("product_link") %>' Visible="False" /></td></tr>
               
            </table>
   </ItemTemplate>
   </asp:Repeater>
    </div>
                </div>
                <div class="col-sm-5 col-sm-offset-1" >
                    <div class="center">
     <asp:Repeater ID="d1" runat="server">
     <ItemTemplate>
       <table>
                <tr><td><asp:Image ID="Label7" runat="server" ImageUrl='<%#Eval("product_image") %>' Width="300px"  Height="250"/> </td></tr>
                <tr><td><hr /></td></tr>
                <tr><td> <asp:Label ID="Label8" runat="server" Text='<%#Eval("product_name") %>'/></td></tr> 
                <tr><td>Rs. <asp:Label ID="Label10" runat="server" Text='<%#Eval("product_price") %>'/></td></tr> 
                <tr><td> <asp:Label ID="Label9" runat="server" Text='<%#Eval("product_dec") %>'/></td></tr> 
                   <tr><td> <asp:Label ID="Label11" runat="server" Text='<%#Eval("product_link") %>' Visible="False" /></td></tr> 
       </table>
      </ItemTemplate>
   </asp:Repeater>
    </div>
                </div>
			</div>
        </div>
</asp:Content>

