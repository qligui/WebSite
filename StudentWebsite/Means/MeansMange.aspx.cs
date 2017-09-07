using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentWebsite.DAL.DataSetMeansTableAdapters;
using System.IO;

namespace StudentWebsite.Means
{
    public partial class MeansMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LvMeans_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                //int index = e.ItemIndex;
                int index = ((ListViewDataItem)e.Item).DisplayIndex;
                long id = (long)LvMeans.DataKeys[index].Value;
                T_MeansLoadTableAdapter adapter = new T_MeansLoadTableAdapter();
                var rows = adapter.GetDataByMeanId(id);
                var data = rows.Single();//获取唯一值；
                File.Delete(Server.MapPath("~/Means/Download/" + data.FileName)); 
            }
        }
    }
}