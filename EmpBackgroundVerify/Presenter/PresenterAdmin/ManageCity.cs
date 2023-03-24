using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

namespace EmpBackgroundVerify.Presenter.PresenterAdmin
{
    public class ManageCity
    {
        public interface IManageCity
        {
            int CityId { get; set; }
            string CityName { get; set; }
        }

        public class CityDetails : IManageCity
        {
            public int CityId { get; set; }
            public string CityName { get; set; }
        }
    }
}