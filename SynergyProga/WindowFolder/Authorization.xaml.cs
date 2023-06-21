using SynergyProga.ClassFolder;
using SynergyProga.DataFolder;
using SynergyProga.WindowFolder.AdminWindows;
using SynergyProga.WindowFolder.ManagerWindows;
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

namespace SynergyProga.WindowFolder
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {
        public Authorization()
        {
            InitializeComponent();
        }

        private void LogInBtn_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(LoginTb.Text))
            {
                MBClass.ErrorMB("Введите логин");
                LoginTb.Focus();
            }
            else if (string.IsNullOrWhiteSpace(PasswordPb.Password))
            {
                MBClass.ErrorMB("Введите пароль");
                PasswordPb.Focus();
            }
            else
            {
                try
                {
                    var user = DBEntities.GetContext()
                        .User
                        .FirstOrDefault(c => c.Login == LoginTb.Text);

                    if (user == null)
                    {
                        MBClass.ErrorMB("Пользователь с " +
                            "таким логином не существует");
                        LoginTb.Focus();
                        return;
                    }
                    if (user.Password != PasswordPb.Password)
                    {
                        MBClass.ErrorMB("Введен не верный пароль");
                        PasswordPb.Focus();
                        return;
                    }
                    else
                    {
                        switch (user.IdRole)
                        {
                            case 1:
                                MBClass.InfoMB("Администратор, добро пожаловать!");
                                new AdminMainWindow().ShowDialog();
                                break;
                            case 2:
                                MBClass.InfoMB("Менеджер, добро пожаловать!");

                                new ManagerMainWindow().ShowDialog();
                                break;
                        }
                    }

                }
                catch (Exception ex)
                {
                    MBClass.ErrorMB(ex);
                }
            }
        }
        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                DragMove();
            }
        }

        private void ExitBtn_Click(object sender, RoutedEventArgs e)
        {
            MBClass.MBExit();
        }

        private void MinimizeBtn_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
