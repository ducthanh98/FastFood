﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{ 
    public class Combo_Insert 
    {
        public int MaCombo { get; set; }
        public string HinhAnh { get; set; }
        public decimal DonGia { get; set; }
        public string TenCombo { get; set; }
        public List<SanPham_InsertComboREL> sanPham { get; set; }
    } 
}