using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetMeansTableAdapters;

namespace StudentWebsite.UserControl
{
    public partial class MeansControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                T_MeansLoadTableAdapter adapter = new T_MeansLoadTableAdapter();
                var data = adapter.GetDataByOrderById(MaxLength);
                RepeaterMeans.DataSource = data;
                RepeaterMeans.DataBind();
            }
        }
        public int MaxLength
        {
            get;
            set;
        }
    }
}