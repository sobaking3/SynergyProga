using SynergyProga.ClassFolder;
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
using System.Windows.Shapes;

namespace SynergyProga.WindowFolder.AdminWindows
{
    /// <summary>
    /// Логика взаимодействия для AdminMainWindow.xaml
    /// </summary>
    public partial class AdminMainWindow : Window
    {
        public AdminMainWindow()
        {
            InitializeComponent();
        }


        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
            }
        }

        private void CloseBtn_Click(object sender, RoutedEventArgs e)
        {
            MBClass.MBExit();
        }


        private void ListUserBtn_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ListEmployee());
        }

        private void MinimizeBtn_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void AddEmployee_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AddEmployee());

        }
        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MBClass.MBLogOut(this);
        }
    }
}
