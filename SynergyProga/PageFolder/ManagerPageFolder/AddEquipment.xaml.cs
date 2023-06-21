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
    }
}
