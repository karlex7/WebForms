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
    public partial class WebForm2 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Person> persons = handler.personHandler.GetPersons().ToList();
            foreach (Person p in persons)
            {
                EditPerson ep = LoadControl("~/Controls/EditPerson.ascx") as EditPerson;
                EditContent.Controls.Add(ep);
                ep.LoadPersonData(p);
            }
        }
    }
}