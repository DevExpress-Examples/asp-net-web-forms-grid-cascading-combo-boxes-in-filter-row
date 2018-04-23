<%-- BeginRegion --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Binding_CompositeKey_CompositeKey" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
	<title>Change the filter combobox list values based on the value another filter combobox</title>
</head>
<body>
	<form id="form1" runat="server">

	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="adInvoices" Width="100%" AutoGenerateColumns="False" OnProcessColumnAutoFilter="grid_ProcessColumnAutoFilter">
		<Columns>
			<dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="1">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataComboBoxColumn FieldName="Country"
				VisibleIndex="2">
				<PropertiesComboBox DataSourceID="adCountries" TextField="Country">
				</PropertiesComboBox>
			</dxwgv:GridViewDataComboBoxColumn>
			<dxwgv:GridViewDataComboBoxColumn FieldName="City"
				VisibleIndex="2">
				<PropertiesComboBox DataSourceID="adCities" TextField="City">
				</PropertiesComboBox>
			</dxwgv:GridViewDataComboBoxColumn>
			<dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="4">
			</dxwgv:GridViewDataColumn>

			<dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="6">
				<PropertiesTextEdit DisplayFormatString="c">
				</PropertiesTextEdit>
			</dxwgv:GridViewDataTextColumn>
		</Columns>
		<Settings ShowGroupPanel="True" ShowFilterRow="true" />
	</dxwgv:ASPxGridView>
	<%-- BeginRegion DataSource --%>
	<asp:AccessDataSource ID="adInvoices" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [CustomerID], [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
	</asp:AccessDataSource>
	<asp:AccessDataSource ID="adCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT distinct [Country] FROM [Invoices]">
	</asp:AccessDataSource>
	<asp:AccessDataSource ID="adCities" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT distinct [City] FROM [Invoices] Where [Country]=?">
		<SelectParameters>
			<asp:SessionParameter SessionField="CountryFilter" Name="Country" DefaultValue="" />
		</SelectParameters>
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	</form>
</body>
</html>
