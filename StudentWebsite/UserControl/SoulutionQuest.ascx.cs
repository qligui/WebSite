using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetBBSTableAdapters;

namespace StudentWebsite.UserControl
{
    public partial class SoulutionQuest : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var data = new T_BBSTableAdapter().GetSloutionQuest(Status);
                RepeaterSoulation.DataSource = data;
                RepeaterSoulation.DataBind();
            }
        }
        public bool Status
        {
            get;
            set;
        }
    }
}