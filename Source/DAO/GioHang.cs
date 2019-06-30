using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class GioHang
    {
        public SanPhamDAO sp { set; get; }
        public Combo_SanPham cb { set; get; }
        public int SoLuong { set; get; }
       
    }
}
