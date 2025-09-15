using System;
using System.Web.UI;

namespace onlinecarrental.View.Public
{
    public partial class Landing : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Page.Title = "MarCon Project Hub – Seamless Project Mobility";
            }
        }
    }
}
