﻿using SynergyProga.WindowFolder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Authorization = SynergyProga.WindowFolder.Authorization;

namespace SynergyProga.ClassFolder
{
    public class MBClass
    {
        public static void ErrorMB(Exception ex)
        {
            MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
        }
        public static void ErrorMB(string text)
        {
            MessageBox.Show(text,
                "Ошибка", MessageBoxButton.OK,
                MessageBoxImage.Error);
        }
        public static void InfoMB(string text)
        {
            MessageBox.Show(text, "Информация",
               MessageBoxButton.OK,
               MessageBoxImage.Information);
        }
        public static bool QuestionMB(string text)
        {
            return MessageBoxResult.Yes ==
               MessageBox.Show(text, "Вопрос",
               MessageBoxButton.YesNo,
               MessageBoxImage.Question);
        }
        public static void MBExit()
        {
            bool result = QuestionMB("Вы действительно" +
               " желаете выйти?");
            if (result == true)
            {
                App.Current.Shutdown();
            }
        }
        public static void MBLogOut(Window window)
        {
            bool result = QuestionMB("Вы действительно" +
               " желаете выйти из аккаунта?");
            if (result == true)
            {
                Authorization loginWindow = new Authorization();
                window.Close();
                loginWindow.Show();
            }
        }
    }
}
