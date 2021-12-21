<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Orderhistory.aspx.cs" Inherits="Orderhistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    orderhistory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container" >
    <section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping History</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
                             <td class="total">Time</td>
                            <td class="total">Status</td>
							<td></td>
						</tr>
					</thead>
                     
                  	<tbody>
                           <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate >
						<tr>
							<td class="cart_product">
								<asp:Image ID="Label1" runat="server" ImageUrl='<%#Eval("product_image") %>' style="width :100px; height :50px;"/> 
							</td>
							<td class="cart_description">
								<h4><asp:Label ID="Label2" runat="server" Text='<%#Eval("product_name") %>'/></h4>
								<h5><asp:Label ID="Label6" runat="server" Text='<%#Eval("Id") %>'></asp:Label></h5>
							</td>
							<td class="cart_price">
								<p><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

								 	<asp:label runat ="server" ID="cartqty" class="cart_quantity_input" Text ='<%#Eval("product_qty") %>' min="1" max="100" oninput="validity.valid||(value='');" TextMode="Number" Width ="60"></asp:label> 
											</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("total") %>'></asp:Label></p>
							</td>
							<td class="cart_delete">
                                 <asp:Label ID="time" runat="server" Text='<%#Eval("datetime") %>' />
							</td>
                            <td>
                                <asp:Label ID="status" runat ="server" Text='<%#Eval("status") %>' />
                            </td>
						</tr>
</ItemTemplate></asp:Repeater>
						
					</tbody>
                    
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->
        </div>
</asp:Content>

