using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class ComBo_LoaiSanPham
    {
        public int MaComBo { set; get; }
        public string TenComBo { set; get; }
        public Decimal DonGia { set; get; }
        public string HinhAnh { set; get; }
        public  List<SanPham_REL> moTa { set; get; }

    }

}
