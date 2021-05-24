using System;
using System.Data.Entity;

namespace EFDemoFirst
{
    class Program
    {
        dbHumanResourceEntities db = new dbHumanResourceEntities();
        #region DisplayDetails
        /// <summary>
        /// Display all employees details
        /// Can be used for complete information from tblemployeeinfo
        /// </summary>
        void DisplayAllEmployees()
        {
            Console.WriteLine("Employee Details");
            Console.WriteLine("==============================================================");
            foreach (var item in db.tblEmployeeInfoes)
            {
                Console.WriteLine(item.Id + "\t" + item.Name + "\t" + item.Location + "\t" + item.DepId + "\t" + item.tblDepartment.Name);
            }
            Console.WriteLine("==============================================================");
        }
        void DisplayAllDepartment()
        {
            foreach (var dep in db.tblDepartments)
            {
                Console.WriteLine(dep.DepId);
                Console.WriteLine(dep.Name);
            }
        }
        void GetEmployee()
        {
            Console.WriteLine("Enter the employeeid");
            int empid = int.Parse(Console.ReadLine());
            tblEmployeeInfo item = db.tblEmployeeInfoes.Find(empid);
            Console.WriteLine(item.Id + "\t" + item.Name + "\t" + item.Location + "\t" + item.DepId + "\t" + item.tblDepartment.Name);
        }
        void GetDepartmentwiseEmployees()
        {
            foreach (var dep in db.tblDepartments)
            {
                Console.WriteLine(dep.DepId + "\t" + dep.Name);
                foreach (var item in dep.tblEmployeeInfoes)
                {
                    Console.WriteLine(item.Id + "\t" + item.Name + "\t" + item.Location + "\t" + item.Salary);
                }
            }
        }
        #endregion

        #region Makechangesindepartment
        void InsertDepartment()
        {
            tblDepartment dep = new tblDepartment();
            Console.WriteLine("Enter Department id");
            dep.DepId = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter Name of the Department");
            dep.Name = Console.ReadLine();

            db.tblDepartments.Add(dep);
            db.SaveChanges();
            Console.WriteLine("Inserted new Department Succesfully!!");
        }
        public void EditDepartment()
        {
            Console.WriteLine("Enter the department id for editing");
            int id = int.Parse(Console.ReadLine());
            tblDepartment obj = db.tblDepartments.Find(id);
            if(obj!=null)
            {
                Console.WriteLine("Department Details to be edited ");
                Console.WriteLine(obj.Name);

                Console.WriteLine("Pls enter the New Department Name");
                obj.Name = Console.ReadLine();

                db.Entry(obj).State = EntityState.Modified;
                db.SaveChanges();
                Console.WriteLine("Modified the Department Name Succesfully!!!");
            }
           

        }

        void DeleteDepartment()
        {
            int depid;
            Console.WriteLine("Enter the Department to be deleted");
            depid = int.Parse(Console.ReadLine());
            tblDepartment department = db.tblDepartments.Find(depid);
            if (department != null)
                db.tblDepartments.Remove(department);
            else
            {
                Console.WriteLine("Invalid Department Id");
                return;
            }
            Console.WriteLine("Are you sure this department should be removed permanently? Yes/No");
            string choice = Console.ReadLine();
            if (choice.ToUpper() == "YES")
            {
                try {
                    db.SaveChanges();
                    Console.WriteLine("Deleted the Department Succesfully");
                }
                catch (InvalidOperationException e) { Console.WriteLine("The departmentid is invalid....Sorry we cannot delete"); }
                catch (Exception e) { Console.WriteLine("Error while deleting the record from Database....Please try later " + e.Message); }


            }
            else
                Console.WriteLine("Oops....We have not deleted the department!!!");
        }
        #endregion
        void ShowDepCount()
        {
            var result=db.prcdeptcount();
            Console.WriteLine("The count of departments is {0}!!!",result);
        }
        static void Main(string[] args)
        {
            //DisplayAllEmployees();
            //GetEmployee();
            // GetDepartmentwiseEmployees();

            //new Program().InsertDepartment();
            // new Program().EditDepartment();
            //new Program().DeleteDepartment();
            new Program().ShowDepCount();
            Console.ReadKey();
        }
    }
}
