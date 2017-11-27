using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oratoria17.Service;
using Oratoria17.serviceOratoria;

namespace Oratoria17
{
    public partial class login : System.Web.UI.Page
    {
       serviceOratoria.ServiceClient jury=new serviceOratoria.ServiceClient() ;
        // Service.ServiceClient jury = new Service.ServiceClient();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                

                var jurado = jury.GetJuryData(txtpwd.Text);
                if(jurado.Length> 0)
                {
                    var name = jurado[0].FullName;
                    var round = jurado[0].IdRound;
                    var IdJury = jurado[0].IdJury;
                    var Password = jurado[0].Password;
                    var Picture = jurado[0].Picture;
                    var RoundDescription = jurado[0].RoundDescription;
                    var IdCriteria = jurado[0].IdCriteria;
                    var NameCriteria = jurado[0].NameCriteria;
                    var IdJurado = jurado[0].IdJury;
                    Session["name"] = name.ToString();
                    Session["round"] = round.ToString();
                    Session["roundDesc"] = RoundDescription.ToString();
                    Session["IdJury"] = IdJurado.ToString();
                    Session["idCriteria"] = IdCriteria.ToString();
                    Session["picture"] = Picture.ToString();
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblmsg.Text = "Usuario invalido";
                }
            }
        }
    }
}