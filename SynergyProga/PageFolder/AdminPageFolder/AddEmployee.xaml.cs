using Microsoft.Win32;
using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SynergyProga.PageFolder.AdminPageFolder
{
    /// <summary>
    /// Логика взаимодействия для AddEmployee.xaml
    /// </summary>
    public partial class AddEmployee : Page
    {
        Worker Worker = new Worker();
        User user = new User();
        public AddEmployee()
        {
            InitializeComponent();
            RoleCb.ItemsSource = DBEntities.GetContext()
            .Roles.Except(DBEntities.GetContext().Roles.Where(r => r.NameRole == "Администратор"
            || r.NameRole == "Директор"))
            .ToList();
        }

        private void AddUserBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ElementsToolsClass.AllFieldsFilled(this))
            {
                try
                {
                    AddUser();
                    WorkerAdd();

                    MBClass.InfoMB("Сотрудник добавлен");
                    ElementsToolsClass.ClearAllControls(this);
                }
                catch (DbEntityValidationException ex)
                {
                    MBClass.ErrorMB(ex);
                }
            }
            else
            {
                MBClass.ErrorMB("Вы не ввели все нужные данные!");
            }

        }

        private void AddUser()
        {
            var userAdd = new User()
            {
                Login = LoginTb.Text,
                Password = PasswordPb.Text,
                IdRole = Int32.Parse(RoleCb.SelectedValue.ToString())
            };
            DBEntities.GetContext().User.Add(userAdd);
            DBEntities.GetContext().SaveChanges();
            user.IdUser = userAdd.IdUser;
        }

        private void WorkerAdd()
        {
            var WorkerAdd = new Worker()
            {
                LastName = LastNameTb.Text,
                FirstName = FirstNameTb.Text,
                MiddleName = MiddleNameTb.Text,
                DateOfBirth = DatePickerTb.Text,
                Number = NumberTb.Text,
                Email = EmailTb.Text,
                IdUser = user.IdUser,
                PhotoStaff = !string.IsNullOrEmpty(selectedFileName) ? ImageClass.ConvertImageToByteArray(selectedFileName) : null
            };
            DBEntities.GetContext().Worker.Add(WorkerAdd);
            DBEntities.GetContext().SaveChanges();
        }
        string selectedFileName = "";

        private void AddPhoto()
        {
            try
            {
                OpenFileDialog op = new OpenFileDialog();
                op.InitialDirectory = "";
                op.Filter = "All supported graphics|*.jpg;*.jpeg;*.png|" +
                    "JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|" +
                    "Portable Network Graphic (*.png)|*.png";

                if (op.ShowDialog() == true)
                {
                    selectedFileName = op.FileName;
                    Worker.PhotoStaff = ImageClass.ConvertImageToByteArray(selectedFileName);
                    ImPhoto.Source = ImageClass.ConvertByteArrayToImage(Worker.PhotoStaff);
                }
            }
            catch (Exception ex)
            {
                MBClass.ErrorMB(ex);
            }
        }
        private void AddImgBtn_Click(object sender, RoutedEventArgs e)
        {
            AddPhoto();
        }
    }
}
