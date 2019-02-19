using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFroms
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetRepoLblText();
        }

        protected void MasterLogout_Click(object sender, EventArgs e)
        {

        }
        private void SetRepoLblText()
        {
            if (HttpContext.Current.Request.Cookies["repo"] != null)
            {
                var repo = int.Parse(HttpContext.Current.Request.Cookies["repo"].Value);
                if (repo == 1)
                {
                    lblCurentRepo.Text = "DB";
                }
                else
                    lblCurentRepo.Text = "TXT";
            }
            else
                lblCurentRepo.Text = "DB";
        }
    }
}