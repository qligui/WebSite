using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetNewsTableAdapters;

namespace StudentWebsite.UserControl
{
    public partial class NewsControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var data = new T_NewsTableAdapter().GetDataByNewsTypeId(MaxLength, TypeId);
                RepterNews.DataSource = data;
                RepterNews.DataBind();
            }
        }
        public long TypeId
        {
            get;
            set;
        }
        public int MaxLength
        {
            get;
            set;
        }
    }
}