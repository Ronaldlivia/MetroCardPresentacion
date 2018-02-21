<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultarTarjeta.aspx.cs" Inherits="MetroCard.Presentacion.ConsultarTarjeta" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <br />
    <br />
    <br />
    <div class="form-horizontal">
        <div class="form-group" style="background-color: #f7c110">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="True">Mis Tarjetas</asp:Label>
        </div>
        <br />
        <asp:UpdatePanel ID="upCrudGrid" runat="server">
            <ContentTemplate>

                <asp:GridView ID="gvTarjetas" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered bs-table"
                    AllowPaging="true" OnRowCommand="gvTarjetas_RowCommand">

                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#ffffcc" />
                    <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                    <EmptyDataTemplate>
                        ¡No hay Tarjeta para mostrar
                    </EmptyDataTemplate>


                    <Columns>
                        <%--campos editables...--%>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Nro. Tarjeta">
                            <ItemTemplate>
                                <asp:Label ID="lbltarjeta" runat="server"><%# Eval("NroTarjeta")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txttarjeta" runat="server" Text='<%# Bind("NroTarjeta")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Saldo Actual">
                            <ItemTemplate>
                                <asp:Label ID="lblsaldo" runat="server"><%# Eval("Saldo")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="lblsaldo" runat="server" Text='<%# Bind("Saldo")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Ultimo uso">
                            <ItemTemplate>
                                <asp:Label ID="lblfechasaldo" runat="server"><%# Eval("FechaSaldo")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtfechasaldo" runat="server" Text='<%# Bind("FechaSaldo")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <%--botones de acción sobre los registros...--%>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                            <ItemTemplate>
                                <%--Botones de eliminar y editar cliente...--%>
                                <asp:Button ID="btnDelete" runat="server" Text="Recargar" CssClass="btn btn-danger" CommandName="Recargar" CommandArgument='<%# Eval("NroTarjeta") %>' />
                                <asp:Button ID="btnEdit" runat="server" Text="Ver Movimiento" CssClass="btn btn-info" CommandName="Ver" CommandArgument='<%# Eval("IdTarjeta") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
        <div class="form-group" style="background-color: #f7c110">
            <asp:Label runat="server" CssClass="col-md-4 control-label" Font-Bold="True">Movimiento de Tarjetas</asp:Label>
        </div>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:GridView ID="gvmovimiento" runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered bs-table"
                    DataKeyNames="NroTarjeta"
                    AllowPaging="true">

                    <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#ffffcc" />
                    <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                    <EmptyDataTemplate>
                        ¡No hay Tarjeta para mostrar
                    </EmptyDataTemplate>


                    <Columns>
                        <%--campos editables...--%>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Nro. Tarjeta">
                            <ItemTemplate>
                                <asp:Label ID="lblContactName" runat="server"><%# Eval("NroTarjeta")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtContactName" runat="server" Text='<%# Bind("NroTarjeta")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Saldo Anterior">
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server"><%# Eval("SaldoAnterior")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtPhone" runat="server" Text='<%# Bind("SaldoAnterior")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="300px" HeaderText="Fecha Movimiento">
                            <ItemTemplate>
                                <asp:Label ID="lblContactName" runat="server"><%# Eval("FechaMovimiento")%></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtContactName" runat="server" Text='<%# Bind("FechaMovimiento")%>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>

        <div class="modal" tabindex="-1" role="dialog" id="detailModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Recargar Tarjeta</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="form-horizontal">


                                    <br />
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="txtnro" CssClass="col-md-4 control-label">Nro. Tarjeta</asp:Label>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtnro" CssClass="form-control" />

                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <asp:Label runat="server" AssociatedControlID="txtcodigo" CssClass="col-md-4 control-label">Código Recarga</asp:Label>
                                        <div class="col-md-8">
                                            <asp:TextBox runat="server" ID="txtcodigo" CssClass="form-control" />

                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>

                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="gvTarjetas" EventName="RowCommand" />


                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="modal-footer">
                            <asp:Button ID="btnrecargar" runat="server" class="btn btn-info" Text="Recargar" OnClick="btnrecargar_Click" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>


    </div>
</asp:Content>
