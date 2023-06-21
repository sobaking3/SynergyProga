using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
using SynergyProga.PageFolder.AdminPageFolder;
using System;
using System.Collections.Generic;
using System.Globalization;
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
    /// Логика взаимодействия для ListEquipment.xaml
    /// </summary>


    public partial class ListEquipment : Page
    {
        public ListEquipment()
        {
            InitializeComponent();
            ListEqDG.ItemsSource = DBEntities.GetContext()
                .Equipment.ToList().OrderBy(u => u.IdEquipment);
        }

        private void DeleteM1_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Equipment Equipment = ListEqDG.SelectedItem as Equipment;

                if (ListEqDG.SelectedItem == null)
                {
                    MBClass.ErrorMB("Пользователь не выбран");
                }
                else
                {
                    if (MBClass.QuestionMB($"Удалить оборудование " +
                    $"под номером {Equipment.EqNumber}?"))
                    {
                        DBEntities.GetContext().Equipment.Remove(ListEqDG.SelectedItem as Equipment);
                        DBEntities.GetContext().SaveChanges();
                        MBClass.InfoMB("Оборудование удалено");
                        ListEqDG.ItemsSource = DBEntities.GetContext()
                    .Equipment.ToList();
                    }
                }
            }
            catch (Exception ex)
            {фи
                MBClass.ErrorMB(ex);
            }
        }
        private void SearchTb_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                ListEqDG.ItemsSource = DBEntities.GetContext()
                    .Equipment.Where(s => s.EqName
                    .StartsWith(SearchTb.Text) || s.EqNumber
                    .StartsWith(SearchTb.Text))
                    .ToList().OrderBy(s => s.EqName);
            }
            catch (Exception ex)
            {
                MBClass.ErrorMB(ex);
            }
        }
    }
}
