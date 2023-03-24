using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;

using EmpBackgroundVerify.Presenter.PresenterAdmin;
using System.Data.SqlClient;

namespace EmpBackgroundVerify.Model.ModelAdmin
{
    public class ModelCityDetails
    {
        EmpBackgroundVerify.Presenter.PresenterAdmin.ManageCity.IManageCity IobjCity;
        List<EmpBackgroundVerify.Presenter.PresenterAdmin.ManageCity.CityDetails> _listCityDetails = new List<ManageCity.CityDetails>();

        //property
        public List<ManageCity.CityDetails> _DisplayCity
        {
            get
            {
                return _listCityDetails;
            }
        }

        //Parameterised contructor
        public ModelCityDetails(ManageCity.IManageCity objCity)
        {
            if (objCity != null)
                this.IobjCity = objCity;
        }

        //Method to insert city details
        public bool InsertCityDetails()
        {
            string sql = @"insert into tblCities (CityName) values (@CityName)";
            using (SqlCommand cmd = new SqlCommand(sql, new SqlConnection(Common.ConnectionString.getConnectionString())))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@CityName",IobjCity.CityName);
                if (cmd.ExecuteNonQuery() == 1)
                    return true;
                else
                    return false;
            }
            
        }

        //Methode to view citydetails
        public void ViewCityDetails()
        {
            string _viewCity = "Select CityId,CityName from CITY";

            using (SqlCommand cmd = new SqlCommand(_viewCity, new SqlConnection(Common.ConnectionString.getConnectionString())))
            {
                cmd.Connection.Open();
                SqlDataReader _read = cmd.ExecuteReader();
                _listCityDetails.Clear();
                while (_read.Read())
                {
                    ManageCity.CityDetails _objCity = new ManageCity.CityDetails();
                    _objCity.CityName = _read["CityName"].ToString();
                    _objCity.CityId = Convert.ToInt32(_read["CityId"]);
                    _listCityDetails.Add(_objCity);
                }

            }

        }

        public bool DeleteCityDetails()
        {
            string _DeleteCity = "Delete from tblCities where CityId =" + IobjCity.CityId;
            using (SqlCommand cmd = new SqlCommand(_DeleteCity, new SqlConnection(Common.ConnectionString.getConnectionString())))
            {
                cmd.Connection.Open();
                if (cmd.ExecuteNonQuery() == 1)
                    return true;
                else
                    return false;
            }

        }

        public bool UpdateCityDetails()
        {

            string UpdateCity = @"Update tblCities set CityName = @CityName where CityId = @CityId";

            using (SqlCommand cmd = new SqlCommand(UpdateCity, new SqlConnection(Common.ConnectionString.getConnectionString())))
            {
                cmd.Connection.Open();
                cmd.Parameters.AddWithValue("@CityName", IobjCity.CityName);
                cmd.Parameters.AddWithValue("@CityId", IobjCity.CityId);
                if (cmd.ExecuteNonQuery() == 1)
                    return true;
                else
                    return false;
            }



        }

        public void ViewCityDetailsbyCityId()
        {
            string _viewCity = "Select CityId,CityName from tblCities where CityId = " + IobjCity.CityId;

            using (SqlCommand cmd = new SqlCommand(_viewCity, new SqlConnection(Common.ConnectionString.getConnectionString())))
            {
                cmd.Connection.Open();
                SqlDataReader _read = cmd.ExecuteReader();
                _listCityDetails.Clear();
                while (_read.Read())
                {
                    // CityDetails _objCity = new CityDetails();
                    ManageCity.CityDetails _objCity = new ManageCity.CityDetails();
                    _objCity.CityName = _read["CityName"].ToString();
                    _objCity.CityId = Convert.ToInt32(_read["CityId"]);
                    _listCityDetails.Add(_objCity);


                }

            }

        }

    }
}