using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.ModelBinding;
using System.Globalization;

namespace ProjetoTDSA
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        private DataSet commandSql(string sqltxt)
        {
            SqlConnection strConect = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\duge\source\repos\ProjetoTDSA\ProjetoTDSA\App_Data\Database1.mdf;Integrated Security=True");
            strConect.Open();
            SqlDataAdapter strAdapt = new SqlDataAdapter(sqltxt, strConect);
            DataSet dsData = new DataSet();
            strAdapt.Fill(dsData);
            return dsData;
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtNome.Text = "";
            txtQuantidade.Text = "";
            txtPreco.Text = "";
            drlCategoria.SelectedValue=("");

        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text;
            string quantidade = txtQuantidade.Text;
            string preco = txtPreco.Text;
            string categoria = drlCategoria.Text;

            SqlDataSource1.InsertParameters["nome"].DefaultValue = nome;
            SqlDataSource1.InsertParameters["quantidade"].DefaultValue = quantidade;
            SqlDataSource1.InsertParameters["preco"].DefaultValue = preco;
            SqlDataSource1.InsertParameters["categoria"].DefaultValue = categoria;
            SqlDataSource1.Insert();

        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {

            string nome = txtNome.Text;
            int quantidade;
            try {
                quantidade = Convert.ToInt32(txtQuantidade.Text);
                }
            catch {
                quantidade = 0;
                    }
            decimal preco;
            try {
                preco = Convert.ToDecimal(txtPreco.Text);
                    }
            catch {
                preco = 0;
                    }
            string categoria = drlCategoria.Text;
            string query = "SELECT * FROM PRODUTO";
            if (nome != "" || quantidade != 0 || preco != 0 || categoria != "")
            {
                query += " WHERE";
                if (nome != "")
                    query += " nome ='" + nome + "' AND";
                else
                    query += " nome like '%%' AND";
                if (quantidade != 0)
                    query += " quantidade =" + quantidade + " AND";
                else
                    query += " quantidade like '%%' AND";
                if (preco != 0)
                    query += " preco =" + preco + " AND";
                else
                    query += " preco like '%%' AND";
                if (categoria != "")
                    query += " categoria ='" + categoria + "'";
                else
                    query += " categoria like '%%' ";
            }
            SqlDataSource1.SelectCommand = query;
            


        }
        protected void AtualizaValor(object sender, EventArgs e)
        {
            decimal ValorTotal = 0;

            foreach (GridViewRow row in gvwProduto.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    if (row.Cells[3].Text != "" || !String.IsNullOrEmpty(row.Cells[3].Text))
                    {
                        ValorTotal += decimal.Parse(row.Cells[3].Text);
                    }
                }
            }
            txtTotal.Text = ValorTotal.ToString();
        }

    }
}