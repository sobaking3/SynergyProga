using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
using System;
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

namespace SynergyProga.PageFolder.ManagerPageFolder
{
    /// <summary>
    /// Логика взаимодействия для AddEquipment.xaml
    /// </summary>
    public partial class AddEquipment : Page
    {
        Equipment equipment = new Equipment();
        public AddEquipment()
        {
            InitializeComponent();
            WorkerCb.ItemsSource = DBEntities.GetContext()
                .Roles.Except(DBEntities.GetContext().Roles.Where(r => r.NameRole == "Администратор"
            || r.NameRole == "Директор" 
            || r.NameRole == "Менеджер")).ToList();
        }

        private void AddUserBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ElementsToolsClass.AllFieldsFilled(this))
            {
                try
                {
                    AddEquip();

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
        private void AddEquip()
        {
            var AddEquip = new Equipment()
            {
                EqName = NameTb.Text,
                EqNumber = NumberTb.Text,
                EqCost= CostTb.Text,
                IdEqType = Int32.Parse(EqTypeCb.SelectedValue.ToString()),
                IdWorkerInfo = Int32.Parse(WorkerCb.SelectedValue.ToString()),
            };
            DBEntities.GetContext().Equipment.Add(AddEquip);
            DBEntities.GetContext().SaveChanges();
        }
    }
}
