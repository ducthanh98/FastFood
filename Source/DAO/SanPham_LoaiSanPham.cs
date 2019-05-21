using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class SanPham_LoaiSanPham
    {
        public int MaLoaiSanPham { set; get; }
        public string TenLoaiSanPham { set; get; }
        public int MaSanPham { set; get; }
        public string TenSanPham { set; get; }
        public string HinhAnh { set; get; }
        public string MoTa { set; get; }
        public Decimal DonGia { set; get; }
        public bool TrangThai { set; get; }
    }
}
