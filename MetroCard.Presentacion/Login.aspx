<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MetroCard.Presentacion.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <style type="text/css">
        .centerDiv {
            width: 30%;
            height: 200px;
            margin: 0 auto;
           
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="centerDiv">

            <div class="col-md-12 col-center">
                <div class="col-md-12">
                    <section id="loginForm">
                        <div class="form-horizontal">
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="form-group">
                                <img src="Content/logo.png" width="100px" height="100px" />
                                Metro Card
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtcorreo" CssClass="col-md-2 control-label">Correo</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtcorreo" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcorreo"
                                        CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtclave" CssClass="col-md-2 control-label">Clave</asp:Label>
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtclave" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtclave" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Iniciar sesión" CssClass="btn btn-default" />
                                </div>
                            </div>
                        </div>
                        <p>
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" NavigateUrl="~/RegistrarUsuario.aspx">Nuevo Usuario</asp:HyperLink>

                        </p>
                    </section>
                </div>

                <div class="col-md-4">
                    <section id="socialLoginForm">
                    </section>
                </div>
            </div>
        </div>

       
    </form>
</body>
</html>
