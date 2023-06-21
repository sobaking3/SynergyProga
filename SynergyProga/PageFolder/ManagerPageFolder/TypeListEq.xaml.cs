using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
using SynergyProga.PageFolder.AdminPageFolder;
using System;
using System.Collections.Generic;
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
    /// Логика взаимодействия для TypeListEq.xaml
    /// </summary>
    public partial class TypeListEq : Page
    {
        public TypeListEq()
        {
            InitializeComponent();
            ListEqTypeDG.ItemsSource = DBEntities.GetContext()
                .EquipmentType.ToList().OrderBy(u => u.IdEqType);
        }

        private void DeleteM1_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                EquipmentType EquipmentType = ListEqTypeDG.SelectedItem as EquipmentType;

                if (ListEqTypeDG.SelectedItem == null)
                {
                    MBClass.ErrorMB("Пользователь не выбран");
                }
                else
                {
                    if (MBClass.QuestionMB($"Удалить тип оборудование " +
                    $"с названием {EquipmentType.EqTypeName}?"))
                    {
                        DBEntities.GetContext().EquipmentType.Remove(ListEqTypeDG.SelectedItem as EquipmentType);
                        DBEntities.GetContext().SaveChanges();
                        MBClass.InfoMB("Оборудование удалено");
                        ListEqTypeDG.ItemsSource = DBEntities.GetContext()
                    .EquipmentType.ToList();
                    }
                }
            }
            catch (Exception ex)
            {
                MBClass.ErrorMB(ex);
            }
        }
        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {

            try
            {
                ListEqTypeDG.ItemsSource = DBEntities.GetContext()
                    .EquipmentType.Where(s => s.EqTypeName
                    .StartsWith(SearchTb.Text))
                    .ToList().OrderBy(s => s.EqTypeName);
            }
            catch (Exception ex)
            {
                MBClass.ErrorMB(ex);
            }
        }
    }
}
