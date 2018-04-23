using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;

public partial class Grid_Binding_CompositeKey_CompositeKey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void grid_ProcessColumnAutoFilter(object sender, ASPxGridViewAutoFilterEventArgs e) {
        if(!object.ReferenceEquals(e.Column, grid.Columns["Country"])) return;
        string oldValue = Session["CountryFilter"] != null ? (string)Session["CountryFilter"] : string.Empty;
        Session["CountryFilter"] = e.Value;
        if(!object.Equals(oldValue, e.Value)) {
            grid.AutoFilterByColumn(grid.Columns["City"], "");
        }
    }
}
