using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetNewsTableAdapters;

namespace StudentWebsite
{
    public partial class NewsContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                long id = Convert.ToInt64(Request["id"]);
                var newsTable = new T_NewsTableAdapter().GetDataByNewId(id);
                if (newsTable.Count <= 0)
                {
                    LitTitle.Visible = false;
                    LitAuthor.Visible = false;
                    Litdate.Visible = false;
                    LitContent.Text = "找不到指定的新闻";
                }
                else
                {
                    var newRow = newsTable.Single();
                    LitTitle.Text = newRow.Title;
                    LitAuthor.Text = newRow.Author;
                    Litdate.Text = newRow.DateTime.ToString("yyyy-MM-dd");
                    LitContent.Text = newRow.NewMsg;
                }
            }
        }
    }
}