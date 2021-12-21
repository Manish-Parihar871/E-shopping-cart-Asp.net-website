<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cheakout.aspx.cs" Inherits="cheakout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Bill</h3>
				</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="total_area">
                        <asp:Repeater ID="Repeater2" runat="server">
                            <ItemTemplate>
						<ul>
							<li> Name <span>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("user_name") %>'></asp:Label></span></li>
							<li>Address <span>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("address") %>'></asp:Label></span></li>
						</ul>
                                </ItemTemplate>
                            </asp:Repeater>
							</div>
				</div>
                <div class="container">
			<div class="breadcrumbs">
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
								Rs<p><asp:Label ID="Label4" runat="server" Text='<%#Eval("product_price") %>'/></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">

								 	<asp:Label runat ="server" ID="cartqty" class="cart_quantity_input" Text ='<%#Eval("product_qty") %>'  Width ="60"></asp:Label> 
											</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">
                            <asp:Label ID="Label5" runat="server" Text='<%#Eval("total") %>'></asp:Label></p>
							</td>
							<td class="cart_delete">
                                <asp:Label ID="delete" runat="server" Text="pending" visible="false" ></asp:Label>
							</td>
                            
						</tr>
</ItemTemplate></asp:Repeater>
						
					</tbody>
                    
				</table>
			</div>
		</div>
				<div class="col-sm-12">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span>
                                <asp:Label ID="Label3" runat="server" Text="0"></asp:Label></span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span>
                                <asp:Label ID="Label7" runat="server" Text="0"></asp:Label></span></li>
						</ul>
                         <a> <asp:LinkButton ID="history" class="btn btn-default update" runat="server" OnClick="cheaKout_Click" >ok</asp:LinkButton></a>
							
							</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
</asp:Content>

