using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StudentWebsite.News
{
    public partial class ProList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BunExple.MaxLength = int.MaxValue;
            BunSkill.MaxLength = int.MaxValue;
        }
    }
}