<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="MetroCard.Presentacion._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .centerDiv {
            width: 50%;
            height: 200px;
            margin: 0 auto;
        }
    </style>
    <br />
    <br />
     <hr />
            <br />
    <div class="centerDiv">
        <div class="form-horizontal">
           
            <div class="form-group" style="background-color: #f7c110">
                <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="True">Datos de Tarjeta</asp:Label>
            </div>
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtnombres" CssClass="col-md-4 control-label">Nombres</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtnombres" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnombres"
                        CssClass="text-danger" ErrorMessage="El campo de nombre de usuario es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtpaterno" CssClass="col-md-4 control-label">Apellido Paterno</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtpaterno" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtpaterno" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtmaterno" CssClass="col-md-4 control-label">Apellido Materno</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtmaterno" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmaterno" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddltipodoc" CssClass="col-md-4 control-label">Tipo Documento</asp:Label>
                <div class="col-md-6">

                    <asp:DropDownList runat="server" ID="ddltipodoc" CssClass="form-control">
                        <asp:ListItem>--Seleccione--</asp:ListItem>
                        <asp:ListItem Value="1">DNI</asp:ListItem>
                        <asp:ListItem Value="2">Carne Extranjeria</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddltipodoc" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtnrodoc" CssClass="col-md-4 control-label">Nro. Documento</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtnrodoc" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnrodoc" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtfechanac" CssClass="col-md-4 control-label">Fecha Nacimiento</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtfechanac" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtfechanac" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txttelefono" CssClass="col-md-4 control-label">Telefono</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txttelefono" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txttelefono" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtcorreo" CssClass="col-md-4 control-label">Correo</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtcorreo" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcorreo" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txtclave" CssClass="col-md-4 control-label">Clave</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtclave" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtclave" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group" style="background-color: #f7c110">
                <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="True">Datos de Tarjeta</asp:Label>
            </div>
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="txttarjeta" CssClass="col-md-4 control-label">Nro Tarjeta</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txttarjeta" CssClass="form-control" />
                    <asp:Button runat="server" Text="+" CssClass="btn btn-default" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txttarjeta" CssClass="text-danger" ErrorMessage="El campo de contraseña es obligatorio." />
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-offset-2 col-md-10">
                    <asp:Button runat="server" Text="Registrar" ID="btnregistrar" CssClass="btn btn-default" OnClick="btnregistrar_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
