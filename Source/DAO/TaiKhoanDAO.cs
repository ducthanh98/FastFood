using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class TaiKhoanDAO
    { 
        public int MaTaiKhoan { get; set; } 

        public string TenTaiKhoan { get; set; }

        public string MatKhau { get; set; }
        public bool GioiTinh { get; set; }

        public string SDT { get; set; }

        public int QuyenHan { get; set; }

        public bool KichHoat { get; set; }

        public string DiaChi { get; set;  }

        public int? MaChiNhanh { get; set; }
    }
}
