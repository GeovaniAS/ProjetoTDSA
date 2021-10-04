<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjetoTDSA._Default" %>
 <script runat="server">
         private void OnRecordDeleting(Object source, SqlDataSourceCommandEventArgs e) {
             // Cancel the delete operation if the checkbox is not checked.
             LblNome.Text = "deleto";
         }
     


 </script>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Label ID="LblNome" runat="server" Text="Nome"></asp:Label>
        <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
        
        <asp:Label ID="lblCategoria" runat="server" Text="Categoria" margin-right=-1px></asp:Label>
        <asp:DropDownList ID="drlCategoria" runat="server" margin-right=-1px>
       
            <asp:ListItem Text="" Value=""/>
            <asp:ListItem Text="Categoria1" Value="categoria1"/>
            <asp:ListItem Text="Categoria2" Value="categoria2"/>
            <asp:ListItem Text="Categoria3" Value="categoria3"/>
        </asp:DropDownList>
          
        <br>
        <asp:Label ID="lblQuantidade" runat="server" Text="Quantidade:"></asp:Label>
        <asp:TextBox ID="txtQuantidade" runat="server"></asp:TextBox>
        <asp:Label ID="lblPreco" runat="server" Text="Preço:"></asp:Label>
        <asp:TextBox ID="txtPreco" runat="server"></asp:TextBox>
        <br>
        <asp:Button ID="btnPesquisar" runat="server" Text="Pesquisar:" OnClick="btnPesquisar_Click"/>
        <asp:Button ID="btnLimpar" runat="server" Text="Limpar" OnClick="btnLimpar_Click" />
        <asp:Button ID="btnInserir" runat="server" Text="Inserir"  OnClick="btnInserir_Click" />
        <asp:GridView ID="gvwProduto" runat="server" CellPadding="1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" GridLines="Vertical" Height="60%" Width="50%" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" UseAccessibleHeader="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" AllowSorting="True" HorizontalAlign="Center" OnDataBound="AtualizaValor" >
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerSettings PageButtonCount="5" Mode="NextPrevious" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="categoria" HeaderText="categoria" SortExpression="categoria" />
                <asp:BoundField DataField="preco" HeaderText="preco" SortExpression="preco" />
                <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                <asp:TemplateField HeaderText="Delete">
	                <ItemTemplate>
		                <asp:Button ID="deleteButton" runat="server" CommandName="Delete" Text="Excluir"
                            OnClientClick="return confirm('Voce tem certeza que deseja excluir essa linha do banco?');" />
	                    </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div align="right">
        <asp:Label ID="lblTotal" runat="server" Text="Valor Total:"></asp:Label>
        <asp:TextBox ID="txtTotal" runat="server" Height="16px" CausesValidation="True" Enabled="False" ReadOnly="True"></asp:TextBox>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
            DeleteCommand="DELETE FROM [Produto] WHERE [Id] = @Id" 
            SelectCommand="SELECT * FROM [Produto]" 
            InsertCommand="INSERT INTO [Produto] ([nome], [categoria], [preco], [quantidade]) VALUES (@nome, @categoria, @preco, @quantidade)">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="categoria" Type="String" />
                <asp:Parameter Name="preco" Type="Decimal" />
                <asp:Parameter Name="quantidade" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
               
    </div>

    <div class="row">
               
    </div>
    <asp:label id="Message"
             forecolor="Red"          
              runat="server"/>
    <br/>

</asp:Content>
