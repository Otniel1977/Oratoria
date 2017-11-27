using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oratoria17.Service;
using Oratoria17.serviceOratoria;
using System.Data;
namespace Oratoria17
{
    public partial class Default : System.Web.UI.Page
    {
       serviceOratoria.ServiceClient service = new serviceOratoria.ServiceClient();
    // Service.ServiceClient service = new Service.ServiceClient();

        protected void Page_Load(object sender, EventArgs e)
        {
            int idEstudiante = 0;

            string nl = Environment.NewLine; // new line variable
            if (!IsPostBack)
            {
                var round = Session["round"];
                var idjury = Session["IdJury"];
                var pict = Session["picture"];
                Label1.Text = "JURADO <br/>" + Session["name"];
                Label2.Text = "Round " + Session["round"];
                Label3.Text = (string)Session["roundDesc"];
              
                var criteria = (string)(Session["idCriteria"]);
               var listaEstuRoundR = service.GetRoundResults(Convert.ToInt32(idjury),Convert.ToInt32(round));
           
              
                GrdData.DataSource = this.Estudiantes();
                GrdData.DataBind();
                Calificaciones.DataSource =this.Elementos(criteria, Convert.ToInt32(round));
                Calificaciones.DataBind();
         

                foreach (GridViewRow row in GrdData.Rows)
                {

                    idEstudiante = Convert.ToInt32(GrdData.DataKeys[row.RowIndex].Values[0].ToString());
                    CheckBox Chbox = (CheckBox)row.FindControl("cbSelect");
                   
                    for (int  o = 0; o < listaEstuRoundR.Count(); o++)
                    {
                        var idEst=listaEstuRoundR[o].Student.IdStudent.ToString();
                        
                        if (idEstudiante == Convert.ToInt32(idEst))
                        {
                            if (listaEstuRoundR[o].TotalValue > 0)
                            {
                                Chbox.Checked = true;
                                Chbox.Enabled = false;
                            }
                            else
                            {
                                Chbox.Checked = false;
                                Chbox.Enabled = true;
                            }
                        }

                    }


                 
                }


            }


        }
        
        protected void SaveValues(object sender, EventArgs e)
        {
            int idRound =Convert.ToInt32( Session["round"]);
            int idjury = Convert.ToInt32(Session["IdJury"]);
            int idEstudiante = 0;
           
         
            
            List<decimal> listas = new List<decimal>();


            if (String.IsNullOrEmpty(Label5.Text))
            {
               
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Debe seleccionar a un estudiante');window.location ='Default.aspx';", true);
                foreach (GridViewRow row in Calificaciones.Rows)
                {
                    var cali = (TextBox)row.FindControl("txtNombre");
                    cali.Text = "";



                }
                Label5.Text = "";

                Label4.Text = "";
                Label6.Text = "";
                Label7.Text = "";



            }
            else
            {
                idEstudiante = Convert.ToInt32(Label5.Text);


                foreach (GridViewRow row in Calificaciones.Rows)
                {
                    var cali = (TextBox)row.FindControl("txtNombre");
                    listas.Add(Convert.ToDecimal(cali.Text));



                }
                var cont = Calificaciones.Rows.Count;
                for (int i = cont; i < 4; i++)
                {
                    listas.Add(0);
                }





                bool evaluacion = service.SetStudentEvaluation(listas[0], listas[1], listas[2], listas[3], idEstudiante, idjury, idRound);
                ScriptManager.RegisterStartupScript(this, this.GetType(),"alert", "alert('Se salvó las calificaciones correctamente');window.location ='Default.aspx';", true);
                // Response.Write("<script>alert('Se salvó las calificaciones correctamente');</script>");

                //Page.Response.Redirect(Page.Request.Url.ToString(), true);

                foreach (GridViewRow row in Calificaciones.Rows)
                {
                    var cali = (TextBox)row.FindControl("txtNombre");
                    cali.Text = "";



                }

            }

        }

     

        protected void cbSelect_CheckedChanged(object sender, EventArgs e)
        {
           
            GridViewRow row = ((GridViewRow)((CheckBox)sender).NamingContainer);
            int index = row.RowIndex;
            CheckBox cb1 = (CheckBox)GrdData.Rows[index].FindControl("cbSelect");
            Label5.Text =GrdData.DataKeys[index].Values[0].ToString();
           
            Label4.Text= "<br/><b>Nombre del Estudiante:<b> <br/>" + row.Cells[1].Text;
            Label6.Text = "<br/><b>Provincia:<b><br/>" + row.Cells[4].Text;
            Label7.Text= "<br/><b>Centro Educativo:<b><br/>" + row.Cells[3].Text;
            Image ImageUrl = row.Cells[0].Controls[0] as Image;
            var i =ImageUrl.ImageUrl;
            var temp= i.Split('/');
            var im= temp[temp.Length - 1];
            Image1.ImageUrl = "../oratoriaweb/images/Students/"+im;
            foreach (GridViewRow row1 in Calificaciones.Rows)
            {
                var cali = (TextBox)row1.FindControl("txtNombre");
                cali.Text = "";



            }


        }

        public DataTable Elementos(string criteria ,int round)
        {
            var listaN = "";
            var listaElementos = service.GetElements(Int32.Parse(criteria));
            DataTable dtp = new DataTable();
            dtp.Columns.Add("Categorias");
            //if (criteria = 2)
            //{

            //}


            foreach (var listasE in listaElementos)
            {
                if (round == 2) {
                     listaN = listaN+listasE.Name+",";

                   // dtp.Rows.Add(  listasE.Name);
                }
                else
                {
                    dtp.Rows.Add("<b>" + listasE.Name + "</b><br/>" + listasE.Description);
                }
            }
            if (round == 2)
            {
                dtp.Rows.Add(listaN);
            }
            return dtp;
        }
        public DataTable Estudiantes()
        {
            var listaEstudiante = service.GetActiveStudents();
            DataTable dt = new DataTable();
            dt.Columns.Add("IdStudent");
            dt.Columns.Add("Picture");
            dt.Columns.Add("Nombre");
            dt.Columns.Add("Educational");
            dt.Columns.Add("Province");
            foreach (var listas in listaEstudiante)
            {
                var i = listas.Picture;
                var temp = i.Split('/');
                var im = temp[temp.Length - 1];
               var imagenES= "../oratoriaweb/images/Students/" + im;


                dt.Rows.Add(listas.IdStudent, imagenES, listas.FullName, listas.Educational_Center, listas.Province);
            }
            return dt;
        }

        protected void GrdData_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GrdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        }
    }
}