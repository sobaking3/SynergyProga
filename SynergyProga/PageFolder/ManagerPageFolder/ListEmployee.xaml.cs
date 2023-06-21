using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
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
    /// Логика взаимодействия для ListEmployee.xaml
    /// </summary>
    public partial class ListEmployee : Page
    {
        public ListEmployee()
        {
            InitializeComponent();
            ListEmployeeLB.ItemsSource = DBEntities.GetContext()
            .Worker.Where(u => u.User.Roles.NameRole != "Директор" && u.User.Roles.NameRole != "Администратор" && u.User.Roles.NameRole != "Менеджер")
            .ToList().OrderBy(u => u.LastName);
        }

        private void DeleteM1_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Worker Worker = ListEmployeeLB.SelectedItem as Worker;

                if (ListEmployeeLB.SelectedItem == null)
                {
                    MBClass.ErrorMB("Пользователь не выбран");
                }
                else
                {
                    if (MBClass.QuestionMB($"Удалить пользователя " +
                    $"с Фамилией {Worker.LastName}?"))
                    {
                        DBEntities.GetContext().Worker.Remove(ListEmployeeLB.SelectedItem as Worker);
                        DBEntities.GetContext().SaveChanges();
                        MBClass.InfoMB("Пользователь удален");
                        ListEmployeeLB.ItemsSource = DBEntities.GetContext()
                    .Worker.ToList();
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
                ListEmployeeLB.ItemsSource = DBEntities.GetContext()
                    .Worker.Where(s => s.LastName
                    .StartsWith(SearchTb.Text) || s.FirstName
                    .StartsWith(SearchTb.Text))
                    .ToList().OrderBy(s => s.LastName);
            }
            catch (Exception ex)
            {
                MBClass.ErrorMB(ex);
            }
        }
    }
}
