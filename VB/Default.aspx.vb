Option Infer On

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
Imports DevExpress.Web

Partial Public Class Grid_Binding_CompositeKey_CompositeKey
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub

    Protected Sub grid_ProcessColumnAutoFilter(ByVal sender As Object, ByVal e As ASPxGridViewAutoFilterEventArgs)
        If e.Kind = GridViewAutoFilterEventKind.CreateCriteria AndAlso e.Column.FieldName = "Country" Then
            Dim oldValue As String = If(Session("CountryFilter") IsNot Nothing, DirectCast(Session("CountryFilter"), String), String.Empty)
            Session("CountryFilter") = e.Value
            If Not Object.Equals(oldValue, e.Value) Then
                Dim cityColumn = CType(grid.DataColumns("City"), GridViewDataComboBoxColumn)
                cityColumn.PropertiesComboBox.RequireDataBinding()
                grid.AutoFilterByColumn(cityColumn, String.Empty)
            End If
        End If
    End Sub
End Class
