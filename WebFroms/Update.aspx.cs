using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebFroms.Controls;
using WebFroms.Models;

namespace WebFroms
{
    public partial class WebForm5 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["IDPerson"];
            Person p = handler.personHandler.GetPerson(Guid.Parse(id));
            EditPerson epc = LoadControl("~/Controls/EditPerson.ascx") as EditPerson;
            editPerson.Controls.Add(epc);
            epc.LoadPersonData(p);
        }
    }
}