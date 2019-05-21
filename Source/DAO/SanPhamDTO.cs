using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SanPhamDTO
    { 
        public int MaSanPham { get; set; } 
        public string TenSanPham { get; set; }
        public decimal DonGia { get; set; }
        public int MaLoaiSanPham { get; set; }
        public string HinhAnh { get; set; }
        public string MoTa { get; set; }
        public bool TrangThai { get; set; }

    }
}
