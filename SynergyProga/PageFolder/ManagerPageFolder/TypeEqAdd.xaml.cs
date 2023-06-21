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
    /// Логика взаимодействия для TypeEqAdd.xaml
    /// </summary>
    public partial class TypeEqAdd : Page
    {
        public TypeEqAdd()
        {
            InitializeComponent();
        }

        private void AddUserBtn_Click(object sender, RoutedEventArgs e)
        {
            if (ElementsToolsClass.AllFieldsFilled(this))
            {
                try
                {
                    EqTypeAdd();

                    MBClass.InfoMB("Тип товара добавлен");
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
        private void EqTypeAdd()
        {
            var EqTypeAdd = new EquipmentType()
            {
                EqTypeName = EqTypeTb.Text,
            };
            DBEntities.GetContext().EquipmentType.Add(EqTypeAdd);
            DBEntities.GetContext().SaveChanges();
        }
    }
}
