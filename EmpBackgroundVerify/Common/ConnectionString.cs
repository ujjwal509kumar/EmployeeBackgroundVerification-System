using System;
using System.Collections.Generic;
////using System.Linq;
using System.Web;
using System.Configuration;

namespace EmpBackgroundVerify.Common
{
    public class ConnectionString
    {
        internal static string getConnectionString()
        {

            return ConfigurationManager.ConnectionStrings["EmpBGverifyConnectionString"].ConnectionString;

        }
    }
}