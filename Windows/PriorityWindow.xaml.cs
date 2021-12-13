using System.Windows;
using System.Windows.Input;


namespace Agents
{
    public partial class PriorityWindow : Window
    {
        public PriorityWindow()
        {
            InitializeComponent();
        }
 
        private void OK_Click(object sender, RoutedEventArgs e) //Обработка нажатия кнопки ОК
        {       
            Close();           
        }

        private void NewPriority_PreviewTextInput(object sender, TextCompositionEventArgs e) // Разрешает вводить только числовые значения в TextBox
        {
            e.Handled = "0123456789".IndexOf(e.Text) < 0;
        } 
    }
}
