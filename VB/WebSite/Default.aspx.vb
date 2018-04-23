Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView

Partial Public Class Grid_Binding_CompositeKey_CompositeKey
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub grid_ProcessColumnAutoFilter(ByVal sender As Object, ByVal e As ASPxGridViewAutoFilterEventArgs)
		If (Not Object.ReferenceEquals(e.Column, grid.Columns("Country"))) Then
			Return
		End If
		Dim oldValue As String
		If Session("CountryFilter") IsNot Nothing Then
			oldValue = CStr(Session("CountryFilter"))
		Else
			oldValue = String.Empty
		End If
		Session("CountryFilter") = e.Value
		If (Not Object.Equals(oldValue, e.Value)) Then
			grid.AutoFilterByColumn(grid.Columns("City"), "")
		End If
	End Sub
End Class
