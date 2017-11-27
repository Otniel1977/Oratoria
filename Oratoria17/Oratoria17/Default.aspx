<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Oratoria17.Default" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #calificacion {
            width: 550px;
            height: 172px;
        }
         #estuDatos {
            width: 850px;
            height: 172px;
        }
        #jurado {
            width: 218px;
            height: 56px;
        }
        #estudiante {
            width: 218px;
            height: 56px;
        }
        .hiddencol
  {
    display: none;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="primer">
    <div id="jurado">
        <div id="jura">
             <div id="imagenJ"></div>
        </div>
        <div id="detaJura">
        <div style="width: 222px; height: 151px">

        <asp:Label ID="Label1" runat="server" CssClass="h2 text-primary" Font-Size="Large"></asp:Label>
            <br />
        <asp:Label ID="Label2" runat="server" Text="Label" CssClass="h2 text-primary" Font-Size="Larger"></asp:Label>
            <br />
        <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Label"></asp:Label>
    
        </div>
            </div>
        <br />
    
    </div>
        <div id="estuDatos">
            CUADRO DE EVALUACIÓN<br />
            <div id="imagen"><asp:Image ID="Image1" runat="server" Height="100px" Width="100px" /></div>
            <div id="detalles"><asp:Label ID="Label5" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="Label4" runat="server"></asp:Label>
            <asp:Label ID="Label6" runat="server"></asp:Label>
            <asp:Label ID="Label7" runat="server"></asp:Label>
                </div>
        </div>
    </div>
  <div id ="segundo">
    <div id="estudiante" style=" overflow: auto; height: 308px; width: 268px;">
        <asp:GridView ID="GrdData" runat="server"  DataKeyNames="IdStudent" 
            AutoGenerateColumns="False" CellPadding="4" 
            ForeColor="#333333" GridLines="None" Width="224px" Height="251px" OnSelectedIndexChanged="GrdData_SelectedIndexChanged" OnRowDataBound="GrdData_RowDataBound"  >
            <AlternatingRowStyle BackColor="White"
                ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                 <asp:ImageField DataImageUrlField="Picture"
                   ControlStyle-Width="100" ControlStyle-Height="100"
                    HeaderText=""/>
                <asp:BoundField DataField="Nombre"
                    HeaderText="Nombre" ItemStyle-Wrap="false"></asp:BoundField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:CheckBox ID="cbSelect"
                            CssClass="gridCB" runat="server" OnCheckedChanged="cbSelect_CheckedChanged" AutoPostBack="True"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField >
                 <asp:BoundField DataField="Educational" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"
                    HeaderText="centro" ItemStyle-Wrap="false"></asp:BoundField>
                 <asp:BoundField DataField="Province" ItemStyle-CssClass="hiddencol"  HeaderStyle-CssClass="hiddencol"
                    HeaderText="Nombre" ItemStyle-Wrap="false" ></asp:BoundField>

                
            </Columns>
            <EditRowStyle BackColor="#999999"></EditRowStyle>
            <FooterStyle BackColor="#5D7B9D"
                Font-Bold="True" ForeColor="White"></FooterStyle>
            <HeaderStyle BackColor="#5D7B9D"
                Font-Bold="True" ForeColor="White"></HeaderStyle>
            <PagerStyle BackColor="#284775"
                ForeColor="White" HorizontalAlign="Center"></PagerStyle>
            <RowStyle BackColor="#F7F6F3"
                ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#E2DED6"
                Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
            <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
            <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
            <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
            <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    <div id="calificacion"   >

        &nbsp;<asp:Label cssclass="label label-success" ID="lblmsg" runat="server" Text="Label"></asp:Label>
&nbsp;<asp:GridView ID="Calificaciones" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="GrdData"
            ForeColor="#333333" GridLines="None" Width="529px" Height="204px" >
            <AlternatingRowStyle BackColor="White"
                ForeColor="#284775"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Categorias" HeaderText="Categorias" HtmlEncode="False" />
                <asp:TemplateField HeaderText="Calificacion">
                    <ItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Width="70px" Text='' onkeypress="solo_JQdecimal(this.id,5)"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999"></EditRowStyle>
            <FooterStyle BackColor="#5D7B9D"
                Font-Bold="True" ForeColor="White"></FooterStyle>
            <HeaderStyle BackColor="#5D7B9D"
                Font-Bold="True" ForeColor="White"></HeaderStyle>
            <PagerStyle BackColor="#284775"
                ForeColor="White" HorizontalAlign="Center"></PagerStyle>
            <RowStyle BackColor="#F7F6F3"
                ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#E2DED6"
                Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
            <SortedAscendingCellStyle BackColor="#E9E7E2">
            </SortedAscendingCellStyle>
            <SortedAscendingHeaderStyle BackColor="#506C8C">
            </SortedAscendingHeaderStyle>
            <SortedDescendingCellStyle BackColor="#FFFDF8">
            </SortedDescendingCellStyle>
            <SortedDescendingHeaderStyle BackColor="#6F8DAE">
            </SortedDescendingHeaderStyle>
        </asp:GridView>
        <asp:Button ID="BtnAdd" runat="server" Text="Salvar Puntuación" Width="254px" OnClick="SaveValues" />
        <br />
    </div>
     
      </div>
    <div class="clear">
  
    </div>
   <script>
      
       function solo_JQdecimal(id) {
          
           $('#' + id).on('keypress', function (e) {
               // Backspace = 8, Enter = 13, ’0′ = 48, ’9′ = 57, ‘.’ = 46
               var field = $(this);
               key = e.keyCode ? e.keyCode : e.which;
           

               if (key == 8) return true;
               if (key > 47 && key < 58) {
                   if (field.val() === "") return true;
                   var existePto = (/[.]/).test(field.val());
                   if (existePto === false) {
                       regexp = /.[0-9]{1}$/; //PARTE ENTERA 10
                   }
                   else {
                       regexp = /.[0-9]{2}$/; //PARTE DECIMAL2
                   }
                   return !(regexp.test(field.val()));
               }
               if (key == 46) {
                   if (field.val() === "") return false;
                   regexp = /^[0-9]+$/;
                   return regexp.test(field.val());
               }
               return false;
           });
       }

  

    </script>

</asp:Content>
