using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SanPham_LoaiSanPham
    {
        public string TenLoaiSanPham { set; get; }
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public decimal DonGia { get; set; }
        public string HinhAnh { get; set; }
        public string MoTa { get; set; }
    }
}
