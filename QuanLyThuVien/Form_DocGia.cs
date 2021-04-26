using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyThuVien
{
    public partial class Form_DocGia : Form
    {
        public Form_DocGia()
        {
            InitializeComponent();
        }

        private void docGiaBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.docGiaBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.quanLyThuVienDataSet);

        }

        private void Form_DocGia_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'quanLyThuVienDataSet.DocGia' table. You can move, or remove it, as needed.
            this.docGiaTableAdapter.Fill(this.quanLyThuVienDataSet.DocGia);

        }
    }
}
