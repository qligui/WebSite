using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetNewsTableAdapters;

namespace StudentWebsite.News
{
    public partial class NewsEditUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string action=Request["action"];
                if(action=="addnew")
                {
                    FvEditUI.ChangeMode(FormViewMode.Insert);
                }
                else if(action=="edit")
                {
                    FvEditUI.ChangeMode(FormViewMode.Edit);
                }
                else
                {
                    throw new Exception("action值有误"+action);
                }
            }
        }

        protected void FvEditUI_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["DateTime"] = DateTime.Now;
        }

        protected void FvEditUI_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("NewsMange.aspx");
        }
        protected void FvEditUI_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            e.NewValues["DateTime"] = DateTime.Now;

        }

        protected void FvEditUI_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("NewsMange.aspx");
        }

        protected void FvEditUI_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Response.Redirect("NewsMange.aspx");
            }
            else
            {
                return;
            }
        }
    }
}