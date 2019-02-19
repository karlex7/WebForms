using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebFroms.Models;

namespace WebFroms
{
    public partial class WebForm3 : MyPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            GwPersons.DataSource = handler.personHandler.GetPersons();
            GwPersons.DataBind();

            RepeaterPerson.DataSource = handler.personHandler.GetPersons();
            RepeaterPerson.DataBind();
        }

        protected void GwPersons_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GwPersons.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void GwPersons_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow gvRow = GwPersons.Rows[e.RowIndex];
            Guid id = Guid.Parse(GetControl<Label>(gvRow.Cells[0].Controls).Text);
            
            Person p = handler.personHandler.GetPerson(id);
            p.FirstName = ((TextBox)gvRow.Cells[1].Controls[0]).Text;
            p.Surname= ((TextBox)gvRow.Cells[2].Controls[0]).Text;
            p.Telephone = ((TextBox)gvRow.Cells[3].Controls[0]).Text;
            handler.personHandler.UpdatePerson(p);
        }

        protected void GwPersons_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GwPersons.EditIndex = -1;
            BindData();
        }
        private T GetControl<T>(ControlCollection parent)
        {
            foreach (var ctrl in parent)
            {
                if (ctrl is T)
                {
                    return (T)ctrl;
                }
            }
            return default(T);
        }

        protected void RepeaterPerson_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType==ListItemType.Item)
            {
                //Email
                string id = ((Label)e.Item.FindControl("lblIDPerson")).Text;
                Person p = handler.personHandler.GetPerson(Guid.Parse(id));
                HtmlTableCell td = (HtmlTableCell)e.Item.FindControl("tdEmail");
                td.Controls.Add(new HyperLink { Text = p.Emails[0] });

                //Grad
                string idGrad = ((Label)e.Item.FindControl("lblCity")).Text;
                HtmlTableCell tdCity = (HtmlTableCell)e.Item.FindControl("city");
                string cityName = handler.cityHandler.GetGrad(int.Parse(idGrad));
                tdCity.Controls.Add(new Label { Text = cityName });
            }
        }
    }
}