using SynergyProga.PageFolder.ManagerPageFolder;
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
using System.Windows.Shapes;

namespace SynergyProga.WindowFolder.ManagerWindows
{
    /// <summary>
    /// Логика взаимодействия для ManagerMainWindow.xaml
    /// </summary>
    public partial class ManagerMainWindow : Window
    {
        public ManagerMainWindow()
        {
            InitializeComponent();
        }

        private void ListUserBtn_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ListEmployee());
        }

        private void AddEmployee_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AddEmployee());
        }

        private void EqList_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ListEquipment());
        }

        private void AddEq_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AddEquipment());
        }
        private void EqTypeAdd_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TypeEqAdd());
        }

        private void EqTypeList_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new TypeListEq());
        }
    }
}
