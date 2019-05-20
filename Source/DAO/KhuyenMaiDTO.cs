using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class KhuyenMaiDTO
    {
        public int MaKhuyenMai { set; get; }
        public string TenKhuyenMai { set; get; }
        public string HinhAnh { set; get; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime ThoiGianKetThuc { set; get; }
        public double ChietKhau { set; get; }
    }
}
