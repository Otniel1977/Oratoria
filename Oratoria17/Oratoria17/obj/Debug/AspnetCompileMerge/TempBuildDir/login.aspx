<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Oratoria17.login" %>

<title>Oratoria</title> 
     
    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>
 
 
<form id="form1" runat="server">
        <div style="max-width: 600px;">
            <div class="panel panel-default">
                <div class="panel-heading h4 text-primary text-center">
Login panel</div>
<div class="panel-body">
                    <div class="form-horizontal" role="form">
   
<div class="form-group">
                            <label class="col-sm-2 control-label" for="txtpwd">Password</label>
                            <div class="col-sm-10">
                                <asp:textbox class="form-control" id="txtpwd" placeholder="Enter Password" runat="server" textmode="Password"></asp:textbox>
                            </div>
</div>
<div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:label cssclass="label label-danger" id="lblmsg" runat="server"></asp:label>
                            </div>
</div>
<div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:button cssclass="btn btn-success" id="btnLogin" onclick="btnLogin_Click" runat="server" text="Submit">
                            </asp:button></div>
</div>
</div>
</div>
</div>
</div>
</form>

