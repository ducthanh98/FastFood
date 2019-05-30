using Common;
using DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ReportBL
    {
        public List<ChartReport> GetDataForChart()
        {
            return new SqlHelper<ChartReport>().ExecuteProcAndGetData("CTReport_Dashboard_Chart");
        }
        public List<Dashboard_OverView> GetOverviewData()
        {
            return new SqlHelper<Dashboard_OverView>().ExecuteProcAndGetData("CTReport_Dashboard_Overview");
        }

    }
}
