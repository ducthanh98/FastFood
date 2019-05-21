using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class AddToCart
    {
        List<ComBo_LoaiSanPham> dsCB { set; get; }
        List<SanPhamDTO> dsSP { set; get; }
    }
}
