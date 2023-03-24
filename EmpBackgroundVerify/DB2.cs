using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Data;

namespace EmpBackgroundVerify
{
    public class DB2
    {
        DB b = new DB();

        public bool IsValidLogin_Admin(string id, string pswd)
        {
            string sql = string.Format("select count(*) from tblAdmin where AdminId='{0}' and Password='{1}'", id, pswd);
            if (b.DoAggregate(sql) == 1)
                return true;
            else
                return false;
        }

        public bool IsValidLogin_Company(string id, string pswd)
        {
            string sql = string.Format("select count(*) from tblCompanies where CompanyId='{0}' and Password='{1}' and Status='Approved'", id, pswd);
            if (b.DoAggregate(sql) == 1)
                return true;
            else
                return false;
        }
        public bool IsValidLogin_Employee(int id, string pswd)
        {
            string sql = string.Format("select count(*) from tblEmployees where EmpId={0} and Password='{1}'", id, pswd);
            if (b.DoAggregate(sql) == 1)
                return true;
            else
                return false;
        }

        //public DataTable Admin_Get_AdminId(string id)
        //{
        //    string sql = string.Format("select * from tblAdmin where LoginId='{0}'",id);

        //}
        #region Admin Modules
        #region Admin ChangePassword
        public int Admin_ChangePassword(string pswd, string id)
        {
            string sql = string.Format("update tblAdmin set Password='{0}' where AdminId='{1}'", pswd, id);
            return b.DoTransaction(sql);
        }
        #endregion

        #region City module
        #region Get all City details
        public DataTable Cities_GetAll()
        {
            string sql = string.Format("select * from tblCities");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get City details based on cityId
        public DataTable Cities_Get_CityId(int cityid)
        {
            string sql = string.Format("select * from tblCities where CityId={0}", cityid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Checking for existance of city name
        public int Cities_Exist(string cityname)
        {
            string sql = string.Format("select count(*) from tblCities where CityName='{0}'", cityname);
            return b.DoAggregate(sql);
        }
        #endregion

        #region Admin Add City details
        public int Cities_Add(string cityname)
        {
            string sql = string.Format("insert into tblCities (CityName) values ('{0}')", cityname);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Admin update City details
        public int Cities_Update(string cityname, int cityid)
        {
            string sql = string.Format("update tblCities set CityName='{0}' where CityId={1}", cityname, cityid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region delete city based on city id
        public int Cities_Delete(int cityid)
        {
            string sql = string.Format("delete from tblCities where CityId={0}", cityid);
            return b.DoTransaction(sql);
        }
        #endregion

        #endregion

        #region Company approval module

        #region Get All companies details
        public DataTable Company_GetAll()
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.Status='Pending'");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get All companies details
        public DataTable Company_GetAll_Approved()
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.Status='Approved'");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get companies details based on cityId
        public DataTable Company_Get_CityId(int cityid)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CityId={0} and tblCompanies.Status='Pending'", cityid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get approved companies details based on cityId
        public DataTable Company_GetApproved_CityId(int cityid)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CityId={0} and tblCompanies.Status!='Pending'", cityid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get approved companies details based on cityId and company Id
        public DataTable Company_GetApproved_CityIdCompId(int cityid, string compId)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CityId={0} and tblCompanies.CompanyId='{1}' and tblCompanies.Status!='Pending'", cityid, compId);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Change Company status
        public int Company_ChangeStatus(string com_ids, string status)
        {
            string sql = string.Format("update tblCompanies set Status='{0}' where CompanyId in ({1})", status, com_ids);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Delete company details
        public int Company_Delete(string com_ids)
        {
            string sql = string.Format("delete from tblCompanies  where CompanyId in ({0})", com_ids);
            return b.DoTransaction(sql);
        }
        #endregion

        #endregion

        #region reply to queries

        #region get company ids which has posted queries
        public DataTable Reply_GetPostesCompId()
        {
            string sql = string.Format("select * from tblCompanies where CompanyId in (select CompanyId from tblQueries where Reply='No Reply')");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get company ids whose queries has been replaced
        public DataTable Reply_GetAnsQueryCompId()
        {
            string sql = string.Format("select * from tblCompanies where CompanyId in (select CompanyId from tblQueries where Reply!='No Reply')");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get all queries
        public DataTable Reply_GetAllQueries()
        {
            string sql = string.Format("select tblQueries.*,tblCompanies.CompanyName from tblQueries inner join tblCompanies on tblQueries.CompanyId =tblCompanies.CompanyId where tblQueries.Reply='No Reply'");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get all answered queries
        public DataTable Reply_GetAllAnsQueries()
        {
            string sql = string.Format("select tblQueries.*,tblCompanies.CompanyName from tblQueries inner join tblCompanies on tblQueries.CompanyId =tblCompanies.CompanyId where tblQueries.Reply!='No Reply'");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get queries based on companyID
        public DataTable Reply_GetQueries_compId(string compid)
        {
            string sql = string.Format("select tblQueries.*,tblCompanies.CompanyName from tblQueries inner join tblCompanies on tblQueries.CompanyId =tblCompanies.CompanyId where tblCompanies.CompanyId='{0}' and tblQueries.Reply='No Reply' ", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get answered queries based on companyID
        public DataTable Reply_GetAnsQueries_compId(string compid)
        {
            string sql = string.Format("select tblQueries.*,tblCompanies.CompanyName from tblQueries inner join tblCompanies on tblQueries.CompanyId =tblCompanies.CompanyId where tblCompanies.CompanyId='{0}' and tblQueries.Reply!='No Reply' ", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get queries based on queryId
        public DataTable Reply_GetQueries_QueryId(int qid)
        {
            string sql = string.Format("select tblQueries.*,tblCompanies.CompanyName from tblQueries inner join tblCompanies on tblQueries.CompanyId =tblCompanies.CompanyId  where tblQueries.QueryId={0}", qid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region delete queries
        public int Reply_Delete_QueryId(int qid)
        {
            string sql = string.Format("delete from tblQueries where QueryId={0}", qid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region send reply to query
        public int Reply_SendReply(int qid, string reply)
        {
            string sql = string.Format("update tblQueries set Reply='{0}',ReplyDate='{1}' where QueryId={2}", reply, DateTime.Now.ToString(), qid);
            return b.DoTransaction(sql);
        }
        #endregion



        #endregion

        #region view company and employee details




        #endregion



        #endregion

        #region Company registration module
        public int Company_Register(string comid, string pswd, string comname, string addr, string mobileno, int cityid, string emailid, string webaddr, string Regdate, string certphoto)
        {
            string sql = string.Format("insert into tblCompanies (CompanyId,Password,CompanyName,Address,MobileNo,CityId,EmailId,WebsiteAddress,RegisteredDate,Status,Certificate,Date) values ('{0}','{1}','{2}','{3}','{4}',{5},'{6}','{7}','{8}','Pending','{9}','{10}')", comid, pswd, comname, addr, mobileno, cityid, emailid, webaddr, Regdate, certphoto, DateTime.Now.ToShortDateString());
            return b.DoTransaction(sql);
        }

        #region checking existance of company name
        public int Company_Exists(string comname, int cityid)
        {
            string sql = string.Format("select count(*) from tblCompanies where CompanyName='{0}' and CityId={1}", comname, cityid);
            return b.DoAggregate(sql);
        }
        #endregion

        #region CompanyCount
        public int CompanyCount()
        {
            string sql = string.Format("select count(*) from tblCompanies");
            return b.DoAggregate(sql);
        }
        #endregion

        #region fetching company max Id
        public string Company_GetMaxId()
        {
            string sql = string.Format("select Max(CompanyId) from tblCompanies");
            return b.DoAggregate2(sql);
        }
        #endregion

        #endregion

        #region Company modules
        //----------------------------------------------------------------------------
        #region Get company details based on companyid
        public DataTable Company_Get_ComId(string compid)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CompanyId='{0}' and tblCompanies.Status='Approved'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get company details based on companyid
        public DataTable Company_Get_ComId2(string compid)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CompanyId='{0}' ", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get company details based on companyid which are not approved
        public DataTable Company_Get_ComId_Pending(string compid)
        {
            string sql = string.Format("select tblCompanies.*,tblCities.CityName from tblCompanies inner join tblCities on tblCompanies.CityId=tblCities.CityId where tblCompanies.CompanyId='{0}' and tblCompanies.Status!='Approved'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Delete Company details based on compId
        public int Company_Delete_CompId(string compid)
        {
            string sql = string.Format("delete from tblCompanies where CompanyId='{0}'", compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Delete Request details based on compId
        public int Request_Delete_CompId(string compid)
        {
            string sql = string.Format("delete from tblRequest where RequestTo='{0}' or RequestFrom='{0}'", compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Update company details based on companyid
        public int Company_Update(string comid, string comname, string addr, string mobileno, int cityid, string emailid, string webaddr, string Regdate)
        {
            string sql = string.Format("update tblCompanies set CompanyName='{0}',Address='{1}',MobileNo='{2}',CityId={3},EmailId='{4}',WebsiteAddress='{5}',RegisteredDate='{6}',Date='{7}' where CompanyId='{8}'", comname, addr, mobileno, cityid, emailid, webaddr, Regdate, DateTime.Now.ToShortDateString(), comid);
            return b.DoTransaction(sql);
        }
        #endregion



        #region Admin ChangePassword
        public int Company_ChangePassword(string pswd, string id)
        {
            string sql = string.Format("update tblCompanies set Password='{0}' where CompanyId='{1}'", pswd, id);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Department modules

        #region add departments
        public int Dept_Add(string deptname, string compid)
        {
            string sql = string.Format("insert into tblDepartments (DeptName,CompanyId) values ('{0}','{1}')", deptname, compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update departments
        public int Dept_Update(string deptname, int deptid)
        {
            string sql = string.Format("update tblDepartments set DeptName='{0}' where DeptId={1}", deptname, deptid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region delete departments
        public int Dept_Delete(int deptid)
        {
            string sql = string.Format("delete from tblDepartments where DeptId={0}", deptid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Get all depts
        public DataTable Dept_GetAll()
        {
            string sql = string.Format("select * from tblDepartments ");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get depts by dept id
        public DataTable Dept_Get_DeptId(int deptid)
        {
            string sql = string.Format("select * from tblDepartments where DeptId={0}", deptid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get depts by company id
        public DataTable Dept_Get_CompId(string compid)
        {
            string sql = string.Format("select * from tblDepartments where CompanyId='{0}'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Checking for existence of dept
        public int Dept_Exists(string deptname, string compid)
        {
            string sql = string.Format("select count(*) from tblDepartments where DeptName='{0}' and CompanyId='{1}'", deptname, compid);
            return b.DoAggregate(sql);
        }
        #endregion

        #endregion

        #region Designation modules

        #region add designation
        public int Desg_Add(string Desgname, string compid)
        {
            string sql = string.Format("insert into tblDesignations (Designation,CompanyId) values ('{0}','{1}')", Desgname, compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update designation
        public int Desg_Update(string Desgname, int Desgid)
        {
            string sql = string.Format("update tblDesignations set Designation='{0}' where DesId={1}", Desgname, Desgid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region delete designation
        public int Desg_Delete(int Desgid)
        {
            string sql = string.Format("delete from tblDesignations where DesId={0}", Desgid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Get all designation
        public DataTable Desg_GetAll()
        {
            string sql = string.Format("select * from tblDesignations ");
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get designation by designation id
        public DataTable Desg_Get_DesgId(int Desgid)
        {
            string sql = string.Format("select * from tblDesignations where DesId={0}", Desgid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get designation by company id
        public DataTable Desg_Get_CompId(string compid)
        {
            string sql = string.Format("select * from tblDesignations where CompanyId='{0}'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Checking for existence of designation
        public int Desg_Exists(string Desgname, string compid)
        {
            string sql = string.Format("select count(*) from tblDesignations where Designation='{0}' and CompanyId='{1}'", Desgname, compid);
            return b.DoAggregate(sql);
        }
        #endregion

        #endregion

        #region Manage employee module

        #region checking employee details exists or not
        public int Employee_CardNo_Exists(string cardno)
        {
            string sql = string.Format("select count(*) from tblEmployees where AadharCardNo='{0}'", cardno);
            return b.DoAggregate(sql);
        }
        #endregion


        #region Add employee basic details
        //public int Employee_Add_New_Basic(string name, string address, string mobileno, string emailid, string photopath, string dob, string quali, string cardno)
        //{
        //    string sql = string.Format("insert into tblEmployees (EmpName,Address,MobileNo,EmailId,Photo,DOB,Qualification,AadharCardNo,Date) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')",name,address,mobileno,emailid,photopath,dob,quali,cardno,DateTime.Now.ToShortDateString());
        //    return b.DoTransaction(sql);
        //}
        public int Employee_Add_New_Basic(string name,string Password, string address, string mobileno, string emailid, string dob, string quali, string cardno)
        {
            string sql = string.Format("insert into tblEmployees (EmpName,Password,Address,MobileNo,EmailId,DOB,Qualification,AadharCardNo,Date) values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", name,Password, address, mobileno, emailid, dob, quali, cardno, DateTime.Now.ToShortDateString());
            return b.DoTransaction(sql);
        }
        #endregion

        #region Add employee basic details
        public int Employee_UpdatePhoto(string photopath, int empid)
        {
            string sql = string.Format("update tblEmployees set Photo='{0}' where EmpId={1}", photopath, empid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Add employee job details
        public int Employee_Add_New_Job(int empid, int deptid, int desid, string doj, int rating, string compid)
        {
            string sql = string.Format("insert into tblEmployeeDetails (EmpId,DeptId,DesId,DOJ,Status,Rating,CompanyId) values ({0},{1},{2},'{3}','Working',{4},'{5}')", empid, deptid, desid, DateTime.Now.ToString(), rating, compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region Add employee salary details
        public int Employee_Add_New_Salary(int empid, int sal, string salDate, string compid, int rating)
        {
            string sql = string.Format("insert into tblSalaries (EmpId,CTC,HikeDate,CompanyId,Date,Status,Rating) values ({0},{1},'{2}','{3}','{4}','Pending',{5})", empid, sal, salDate, compid, DateTime.Now.ToString(), rating);
            return b.DoTransaction(sql);
        }
        #endregion

        #region employee ID exist or not
        public int Employee_EmpId_Exists(int id)
        {
            string sql = string.Format("select count(*) from tblEmployees where EmpId={0}", id);
            return b.DoAggregate(sql);
        }
        #endregion

        #region employee ID exist or not
        public int EmployeeDtails_EmpId_Exists2(int id)
        {
            string sql = string.Format("select count(*) from tblEmployeeDetails where EmpId={0} and Status='Left'", id);
            return b.DoAggregate(sql);
        }
        #endregion

        #region get max employee id
        public int Employee_GetMaxId()
        {
            string sql = string.Format("select Max(EmpId) from tblEmployees");
            return b.DoAggregate(sql);
        }
        #endregion

        #region get emp count
        public int Employee_Count()
        {
            string sql = string.Format("select count(*) from tblEmployees");
            return b.DoAggregate(sql);
        }
        #endregion


        #endregion

        #region View Employees module

        #region Get company-department wise designations
        public DataTable EmpView_Des_DeptId(int deptid, string compid)
        {
            string sql = string.Format("select * from tblDesignations where DesId in (SELECT distinct tblDesignations.DesId FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId where tblDepartments.CompanyId='{0}' and tblDesignations.CompanyId='{0}' and tblDepartments.DeptId={1})", compid, deptid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get all emps details of a company
        public DataTable Employee_GetAll_CompId(string compid)
        {
            string sql = string.Format("SELECT tblEmployees.*, tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblSalaries.CompanyId='{0}' and tblEmployeeDetails.Status='Working' and tblSalaries.Status='Pending'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get all emps details of a particular dept
        public DataTable Employee_GetAll_CompId_DeptId(string compid, int deptid)
        {
            string sql = string.Format("SELECT tblEmployees.*, tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblSalaries.CompanyId='{0}' and tblDepartments.DeptId ={1} and tblEmployeeDetails.Status='Working' and tblSalaries.Status='Pending'", compid, deptid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get all emps details of a particular dept and designation
        public DataTable Employee_GetAll_CompId_DeptId_DesId(string compid, int deptid, int desid)
        {
            string sql = string.Format("SELECT tblEmployees.*, tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblSalaries.CompanyId='{0}' and tblDepartments.DeptId ={1} and tblDesignations.DesId={2} and tblEmployeeDetails.Status='Working' and tblSalaries.Status='Pending'", compid, deptid, desid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get particular details based on empId
        public DataTable Employee_Get_EmpId(int empid)
        {
            string sql = string.Format("SELECT tblEmployees.*, tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0} and tblEmployeeDetails.Status='Working' and tblSalaries.Status='Pending'", empid);
            return b.DoNonTransaction(sql);
        }
        #endregion


        #endregion

        #region update employee info

        #region update emp profile without photo
        public int Employee_Update_Profile(string name, string addr, string mobileno, string emailid, string dob, string quali, string cardno, int empid)
        {
            string sql = string.Format("update tblEmployees set EmpName='{0}',Address='{1}',MobileNo='{2}',EmailId='{3}',DOB='{4}',Qualification='{5}',AadharCardNo='{6}',Date='{7}' where EmpId={8}", name, addr, mobileno, emailid, dob, quali, cardno, DateTime.Now.ToString(), empid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update emp profile with photo
        public int Employee_Update_Profile_Photo(string name, string addr, string mobileno, string emailid, string dob, string quali, string cardno, string photo, int empid)
        {
            string sql = string.Format("update tblEmployees set EmpName='{0}',Address='{1}',MobileNo='{2}',EmailId='{3}',DOB='{4}',Qualification='{5}',AadharCardNo='{6}',Date='{7}',Photo='{8}' where EmpId={9}", name, addr, mobileno, emailid, dob, quali, cardno, DateTime.Now.ToString(), photo, empid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update employees previous job status as promoted on promotion
        public int Employee_Update_WorkStatus(int detailid)
        {
            string sql = string.Format("update tblEmployeeDetails set Status='Promoted' where DetailId={0}", detailid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update emp designation
        public int Employee_Update_Designation(int empid, int deptid, int desid, string doj)
        {
            string sql = string.Format("insert into tblEmployeeDetails (EmpId,DeptId,DesId,DOJ,Status,Date) Values ({0},{1},{2},'{3}','Working','{4}')", empid, deptid, desid, doj, DateTime.Now.ToString());
            return b.DoTransaction(sql);
        }
        #endregion

        #region update emp designation
        public int Employee_Update_Designation2(int empid, int deptid, int desid, string doj, string compid)
        {
            string sql = string.Format("insert into tblEmployeeDetails (EmpId,DeptId,DesId,DOJ,Status,Date,CompanyId) Values ({0},{1},{2},'{3}','Working','{4}','{5}')", empid, deptid, desid, doj, DateTime.Now.ToString(), compid);
            return b.DoTransaction(sql);
        }
        #endregion

        #region update employee salary status to "Hiked"
        public int Employee_UpdateSalaryStatus(int empid, string compid)
        {
            string sql = string.Format("update tblSalaries set Status='Hiked' where EmpId={0} and CompanyId='{1}' and Status='Pending'", empid, compid);
            return b.DoTransaction(sql);
        }

        #endregion

        #region update employee salary
        public int Employee_UpdateSalary(int empid, int ctc, string hikedate, int rating, string compid)
        {
            string sql = string.Format("insert into tblSalaries (EmpId,CTC,HikeDate,Rating,CompanyId,Date,Status) values ({0},{1},'{2}',{3},'{4}','{5}','Pending')", empid, ctc, hikedate, rating, compid, DateTime.Now.ToString());
            return b.DoTransaction(sql);
        }

        #endregion

        #region update employee work status as left
        public int Employee_UpdateWorkStatus(int empid, string quitdate, string quite_reason, int rating)
        {
            string sql = string.Format("update tblEmployeeDetails set Status='Left',QuitDate='{0}',QuitReason='{1}',Rating={2} where EmpId={3} and Status='Working'", quitdate, quite_reason, rating, empid);
            return b.DoTransaction(sql);
        }

        #endregion

        #region update employee salary status as LEFT on status updation
        public int Employee_UpdateSalaryStatus_OnLeft(int empid)
        {
            string sql = string.Format("update tblSalaries set Status='Left' where EmpID={0}", empid);
            return b.DoTransaction(sql);
        }

        #endregion

        #region delete employee details
        public int Employee_DeleteEmp(int empid)
        {
            string sql = string.Format("delete from tblEmployees where EmpID={0}", empid);
            return b.DoTransaction(sql);
        }

        #endregion

        #endregion

        #region Employee background verification

        #region get employee details based on empid
        public DataTable BG_GetEmpWorkDetails_EmpId(int empid)
        {
            //string sql = string.Format("SELECT tblEmployees.*, tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0}",empid);
            string sql = string.Format("SELECT tblEmployeeDetails.*, tblDesignations.Designation, tblDepartments.DeptName, tblSalaries.SalaryId, tblSalaries.CTC, tblSalaries.HikeDate, tblSalaries.Rating AS Expr1, tblSalaries.Status AS Expr2 FROM tblDesignations INNER JOIN tblDepartments INNER JOIN tblSalaries INNER JOIN tblEmployees ON tblSalaries.EmpId = tblEmployees.EmpId INNER JOIN tblCompanies ON tblSalaries.CompanyId = tblCompanies.CompanyId ON tblDepartments.CompanyId = tblCompanies.CompanyId ON  tblDesignations.CompanyId = tblCompanies.CompanyId INNER JOIN tblEmployeeDetails ON tblDesignations.DesId = tblEmployeeDetails.DesId AND tblDepartments.DeptId = tblEmployeeDetails.DeptId AND tblEmployees.EmpId = tblEmployeeDetails.EmpId where tblEmployeeDetails.EmpId={0}", empid);

            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get employee basic details based on empid
        public DataTable BG_GetEmpBasicDetails_EmpId(int empid)
        {
            string sql = string.Format("select * from tblEmployees where EmpId={0}", empid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get employees company IDs
        public DataTable BG_GetEmp_CompIds(int empid)
        {
            //string sql = string.Format("SELECT  distinct tblSalaries.CompanyId FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0}",empid);
            string sql = string.Format("SELECT distinct tblEmployeeDetails.CompanyId FROM tblDesignations INNER JOIN tblDepartments INNER JOIN tblSalaries INNER JOIN tblEmployees ON tblSalaries.EmpId = tblEmployees.EmpId INNER JOIN tblCompanies ON tblSalaries.CompanyId = tblCompanies.CompanyId ON tblDepartments.CompanyId = tblCompanies.CompanyId ON  tblDesignations.CompanyId = tblCompanies.CompanyId INNER JOIN tblEmployeeDetails ON tblDesignations.DesId = tblEmployeeDetails.DesId AND tblDepartments.DeptId = tblEmployeeDetails.DeptId AND tblEmployees.EmpId = tblEmployeeDetails.EmpId where tblEmployeeDetails.EmpId={0}", empid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get employees details based on company ID
        public DataTable BG_GetEmpDetails_EmpId_CompId(int empid, string compid)
        {
            //string sql = string.Format("SELECT tblEmployeeDetails.DetailId, tblEmployeeDetails.DeptId, tblEmployeeDetails.DesId, tblEmployeeDetails.DOJ, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblSalaries.CompanyId, tblDepartments.DeptName, tblDesignations.Designation FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0} and tblSalaries.CompanyId='{1}'", empid,compid);
            //string sql = string.Format("SELECT tblDepartments.DeptName, tblDesignations.Designation,tblEmployeeDetails.DOJ, tblEmployeeDetails.Rating, tblSalaries.CTC,tblSalaries.HikeDate, tblEmployeeDetails.Status, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0} and tblSalaries.CompanyId='{1}'", empid, compid);
            //string sql = string.Format("SELECT tblEmployeeDetails.*, tblDesignations.Designation, tblDepartments.DeptName, tblSalaries.SalaryId, tblSalaries.CTC, tblSalaries.HikeDate, tblSalaries.Rating AS Expr1, tblSalaries.Status AS Expr2 FROM tblDesignations INNER JOIN tblDepartments INNER JOIN tblSalaries INNER JOIN tblEmployees ON tblSalaries.EmpId = tblEmployees.EmpId INNER JOIN tblCompanies ON tblSalaries.CompanyId = tblCompanies.CompanyId ON tblDepartments.CompanyId = tblCompanies.CompanyId ON  tblDesignations.CompanyId = tblCompanies.CompanyId INNER JOIN tblEmployeeDetails ON tblDesignations.DesId = tblEmployeeDetails.DesId AND tblDepartments.DeptId = tblEmployeeDetails.DeptId AND tblEmployees.EmpId = tblEmployeeDetails.EmpId where tblEmployeeDetails.EmpId={0} and tblEmployeeDetails.CompanyId='{1}'", empid, compid);
            string sql = string.Format("SELECT tblDepartments.DeptName,tblDesignations.Designation, tblEmployeeDetails.DOJ, tblSalaries.CTC, tblSalaries.HikeDate, tblSalaries.Rating AS SalaryRating, tblSalaries.Status AS SalaryStatus,tblEmployeeDetails.Status AS WorkStatus,tblEmployeeDetails.QuitDate,tblEmployeeDetails.QuitReason,tblEmployeeDetails.Rating AS OverAllRating FROM tblDesignations INNER JOIN tblDepartments INNER JOIN tblSalaries INNER JOIN tblEmployees ON tblSalaries.EmpId = tblEmployees.EmpId INNER JOIN tblCompanies ON tblSalaries.CompanyId = tblCompanies.CompanyId ON tblDepartments.CompanyId = tblCompanies.CompanyId ON  tblDesignations.CompanyId = tblCompanies.CompanyId INNER JOIN tblEmployeeDetails ON tblDesignations.DesId = tblEmployeeDetails.DesId AND tblDepartments.DeptId = tblEmployeeDetails.DeptId AND tblEmployees.EmpId = tblEmployeeDetails.EmpId where tblEmployeeDetails.EmpId={0} and tblEmployeeDetails.CompanyId='{1}'", empid, compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get employee's details based on aadhar card no
        public DataTable BG_GetEmpDetails_CardNo(string cardno)
        {
            string sql = string.Format("select * from tblEmployees where AadharCardNo='{0}'", cardno);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Geting viwer company details
        public int BG_AddCompanyVisitDetails(string viewerCompId, string ViewedCompId, int empid)
        {
            string sql = string.Format("insert into tblVisitors (ViewerCompanyId,ViewedCompanyId,EmpId,Date) values ('{0}','{1}',{2},'{3}')", viewerCompId, ViewedCompId, empid, DateTime.Now.ToString());
            return b.DoTransaction(sql);
        }
        #endregion

        #region send request to employee's company
        public int BG_SendRequest(string comp_from, string comp_to, int empid)
        {
            string sql = string.Format("insert into tblRequest (RequestFrom,RequestTo,EmpId,Date,Reply) values ('{0}','{1}',{2},'{3}','No Reply')", comp_from, comp_to, empid, DateTime.Now.ToString());
            return b.DoTransaction(sql);
        }
        #endregion

        #endregion

        #region Visitor company details
        #region Get viewer company details
        public DataTable Visitor_GetDetails_CompId(string compid)
        {
            string sql = string.Format("select * from tblVisitors where ViewedCompanyId='{0}'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get viewer company name
        public DataTable Visitor_GetViewerCompName_CompIds(string compid)
        {
            string sql = string.Format("select * from tblCompanies where CompanyId in (select distinct ViewerCompanyId from tblVisitors where ViewedCompanyId='{0}')", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get emp ids based on visitor company id
        public DataTable Visitor_GetEmpIds_Vcompid(string vcompid, string compid)
        {
            string sql = string.Format("select distinct EmpId from tblVisitors where ViewerCompanyId='{0}' and ViewedCompanyId='{1}'", vcompid, compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #endregion

        #region reply to confirmation request modules
        #region requested company names based on comp id
        //public DataTable ConfirmRequest_GetVCompIds(string compid)
        //{
        //    string sql = string.Format("select distinct RequestFrom from tblRequest where RequestTo='{0}'",compid);
        //    return b.DoNonTransaction(sql);
        //}
        public DataTable Request_GetDetails_CompId(string compid)
        {
            string sql = string.Format("select * from tblRequest where RequestTo='{0}'", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Get requested company name
        public DataTable Request_GetRequestCompName_CompIds(string compid)
        {
            string sql = string.Format("select * from tblCompanies where CompanyId in (select distinct RequestFrom from tblRequest where RequestTo='{0}' and Reply='No Reply')", compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get emp ids based on request company id
        public DataTable Request_GetEmpIds_Rcompid(string rcompid, string compid)
        {
            string sql = string.Format("select distinct EmpId from tblRequest where RequestFrom='{0}' and RequestTo='{1}' and Reply='No Reply'", rcompid, compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region get request ID based on reqTo,reqFrom,empId
        public DataTable Request_GetReqId(string rTo, string rFrom, int empid)
        {
            string sql = string.Format("select * from tblRequest where RequestTo='{0}' and RequestFrom='{1}' and EmpId={2}", rTo, rFrom, empid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #region Add reply send by company to database
        public int Request_UpdateReply_ReqId(string reply, int reqid)
        {
            string sql = string.Format("update tblRequest set Reply='{0}' where RequestId={1}", reply, reqid);
            return b.DoTransaction(sql);
        }
        #endregion


        #endregion

        #region View reply sent to confirmation request

        #region get reply from requested company
        public DataTable ConfirmInbox_GetAllReplyComp(string comp)
        {
            string sql = string.Format("select distinct RequestTo from tblRequest where RequestFrom='{0}' and Reply!='No Reply'", comp);
            return b.DoNonTransaction(sql);
        }
        #endregion


        #region get reply from requested company
        public DataTable ConfirmInbox_GetAllReply_compId(string compid, string Rcomp)
        {
            string sql = string.Format("select * from tblRequest where RequestTo='{0}' and RequestFrom='{1}' and Reply!='No Reply'", Rcomp, compid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #endregion

        #region View confirmation request sent to company

        #region get reply from requested company
        public DataTable ConfirmOutbox_GetAllReqComp(string comp)
        {
            string sql = string.Format("select distinct RequestTo from tblRequest where RequestFrom='{0}' and Reply='No Reply'", comp);
            return b.DoNonTransaction(sql);
        }
        #endregion


        #region get reply from requested company
        public DataTable ConfirmOutbox_GetAllReq_compId(string Fcompid, string Tcomp)
        {
            string sql = string.Format("select * from tblRequest where RequestTo='{0}' and RequestFrom='{1}' and Reply='No Reply'", Tcomp, Fcompid);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #endregion

        #region Posting Query module

        #region Post query
        public int Query_Post(string compId, string query)
        {
            string sql = string.Format("insert into tblQueries (CompanyId,Query,PostedDate,Reply) values ('{0}','{1}','{2}','No Reply')", compId, query, DateTime.Now.ToString());
            return b.DoTransaction(sql);
        }
        #endregion

        #region get all queries based on company ID
        public DataTable Query_GetAll(string compId)
        {
            //string sql = string.Format("select * from tblQueries where CompanyId='{0}' and Reply='No Reply'",compId);
            string sql = string.Format("select * from tblQueries where CompanyId='{0}'", compId);
            return b.DoNonTransaction(sql);
        }
        #endregion

        #endregion

        //----------------------------------------------------------------------------
        #endregion

        #region STAFFINF PROBLEM

        #region fetching left employee details

        public DataTable SP_GetEmp_CompId_Left(string compid)
        {
            string sql = string.Format("select * from tblEmployeeDetails where CompanyId='{0}' and Status='Left'", compid);
            return b.DoNonTransaction(sql);
        }

        #endregion



        #endregion


        public DataTable BG_GetEmp_OverAllDetails(int empid)
        {
            //string sql = string.Format("SELECT  distinct tblSalaries.CompanyId FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0}",empid);
            string sql = string.Format("SELECT tblCompanies.CompanyId, tblCompanies.CompanyName, tblDepartments.DeptName, tblDesignations.Designation, tblSalaries.CTC, tblSalaries.HikeDate, tblSalaries.Rating AS SalaryRating, tblSalaries.Status AS SalaryStatus,tblEmployeeDetails.Status AS WorkStatus, tblEmployeeDetails.QuitDate, tblEmployeeDetails.QuitReason, tblEmployeeDetails.Rating AS OverAllRating, tblEmployees.EmpId, convert(varchar(10),tblEmployeeDetails.DOJ,103) as DOJ FROM tblCompanies INNER JOIN tblDepartments ON tblCompanies.CompanyId = tblDepartments.CompanyId INNER JOIN tblDesignations ON tblCompanies.CompanyId = tblDesignations.CompanyId INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId AND tblDesignations.DesId = tblEmployeeDetails.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblCompanies.CompanyId = tblSalaries.CompanyId AND tblEmployees.EmpId = tblSalaries.EmpId WHERE tblEmployees.EmpId = {0}", empid);
            return b.DoNonTransaction(sql);
        }
        public DataTable GetCompanyDetails()
        {
            string sql = string.Format("Select * from tblCompanies where Status='Approved'");
            return b.DoNonTransaction(sql);
        }
        public int Employee_SelfUpdateProfile(int EmpId,string compId,int deptId,int desId,string name, string address, string mobileno, string emailid, int exp, int CTC)
        {
            string sql = string.Format("insert into tblSelfEmpolyeeDetails (EmpId,CompanyId,DeptId,DesId,EmployeeName,MobileNo,EmailId,Address,Expr,CTC) values ({0},'{1}',{2},{3},'{4}','{5}','{6}','{7}',{8},{9})", EmpId, compId, deptId, desId, name, mobileno, emailid, address, exp, CTC);
            return b.DoTransaction(sql);
        }
        public DataTable BG_GetEmp_SelftDetails(int empid)
        {
            //string sql = string.Format("SELECT  distinct tblSalaries.CompanyId FROM tblDepartments INNER JOIN tblEmployeeDetails ON tblDepartments.DeptId = tblEmployeeDetails.DeptId INNER JOIN tblDesignations ON tblEmployeeDetails.DesId = tblDesignations.DesId INNER JOIN tblEmployees ON tblEmployeeDetails.EmpId = tblEmployees.EmpId INNER JOIN tblSalaries ON tblEmployees.EmpId = tblSalaries.EmpId where tblEmployees.EmpId={0}",empid);
            string sql = string.Format("SELECT tblCompanies.CompanyName, tblSelfEmpolyeeDetails.EmployeeName, tblDepartments.DeptName, tblDesignations.Designation, tblSelfEmpolyeeDetails.MobileNo, tblSelfEmpolyeeDetails.EmailId, tblSelfEmpolyeeDetails.Address, tblSelfEmpolyeeDetails.Expr, tblSelfEmpolyeeDetails.CTC, tblSelfEmpolyeeDetails.EmpId FROM tblCompanies INNER JOIN tblDepartments ON tblCompanies.CompanyId = tblDepartments.CompanyId INNER JOIN tblDesignations ON tblCompanies.CompanyId = tblDesignations.CompanyId INNER JOIN tblSelfEmpolyeeDetails ON tblCompanies.CompanyId = tblSelfEmpolyeeDetails.CompanyId AND tblDepartments.DeptId = tblSelfEmpolyeeDetails.DeptId AND tblDesignations.DesId = tblSelfEmpolyeeDetails.DesId where tblSelfEmpolyeeDetails.EmpId={0}", empid);
            return b.DoNonTransaction(sql);
        }
    }
}