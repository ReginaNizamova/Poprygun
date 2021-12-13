using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.ComponentModel;

namespace Agents
{
    public partial class Agent
    {

        private string agentTypeTitle;
        public string AgentTypeTitle
        {
            get { return agentTypeTitle; }
            set
            {
                agentTypeTitle = value;
                OnPropertyChanged("AgentTypeTitle");
            }
        }

        private int minCostForAgent;
        public int Discount
        {
            get { return minCostForAgent; }
            set
            {
                minCostForAgent = value;
                OnPropertyChanged("Discount");
            }
        }       
    }
    public partial class MainWindow : Window
    {
        const int pageSize = 10;
        int pageIndex = -1;
        int numberPage = 1;
        List<Agent> listAgentsTen = new List<Agent>();
        public List<Agent> listAgents = new List<Agent>();
        readonly AgentsEntities dataContext = new AgentsEntities();
        readonly DateTime firstDate = new DateTime(2019, 01, 01);
        readonly DateTime lastDate = new DateTime(2019, 12, 31);
        private const string PathImage = "C:/Users/User/Desktop/ДЗ на лето/Сессия 1/picture.png";

        public MainWindow()
        {
            InitializeComponent();

            FillList();

            pageIndex++;
            listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
            ListViewAgents.ItemsSource = listAgentsTen;
        }

        public List<Agent> FillList() //Заполняет listAgents
        {
            var queryAgents = from p in dataContext.ProductSales
                              select new
                              {
                                  title = p.Agent.Title,
                                  typeAgent = p.Agent.AgentType.Title,
                                  productCount = p.ProductCount,
                                  phone = p.Agent.Phone,
                                  priority = p.Agent.Priority,
                                  saleDate = p.SaleDate,
                                  minCostForAgent = p.Product.MinCostForAgent,
                                  discount = p.Product.MinCostForAgent * p.ProductCount,
                                  logo = p.Agent.Logo
                              };

            foreach (var item in queryAgents)
            {
                if (item.saleDate >= firstDate && item.saleDate <= lastDate) //if количество продаж за год
                {
                    if (item.discount >= 10000 && item.discount < 50000) //if размер скидки
                    {
                        if (item.logo == "отсутствует")  //if наличие лого агента
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 5,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 5,
                                Logo = item.logo
                            });
                        }

                    }

                    else if (item.discount >= 50000 && item.discount < 150000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 10,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 10,
                                Logo = item.logo
                            });
                        }
                    }

                    else if (item.discount >= 150000 && item.discount < 500000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 20,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 20,
                                Logo = item.logo
                            });
                        }
                    }

                    else if (item.discount >= 500000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 25,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 25,
                                Logo = item.logo
                            });
                        }
                    }

                    else
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                ProductCount = item.productCount,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 0,
                                Logo = item.logo
                            });
                        }
                    }
                }

                else
                {
                    if (item.discount >= 10000 && item.discount < 50000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 5,
                                ProductCount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 5,
                                ProductCount = 0,
                                Logo = item.logo
                            });
                        }

                    }

                    else if (item.discount >= 50000 && item.discount < 150000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 10,
                                ProductCount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 10,
                                ProductCount = 0,
                                Logo = item.logo
                            });
                        }
                    }

                    else if (item.discount >= 150000 && item.discount < 500000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 20,
                                ProductCount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 20,
                                ProductCount = 0,
                                Logo = item.logo
                            });
                        }
                    }

                    else if (item.discount >= 500000)
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 25,
                                ProductCount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 25,
                                ProductCount = 0,
                                Logo = item.logo
                            });
                        }
                    }

                    else
                    {
                        if (item.logo == "отсутствует")
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 0,
                                ProductCount = 0,
                                Logo = PathImage
                            });
                        }

                        else
                        {
                            listAgents.Add(new Agent()
                            {
                                Title = item.title,
                                AgentTypeTitle = item.typeAgent,
                                Phone = item.phone,
                                Priority = item.priority,
                                Discount = 0,
                                ProductCount = 0,
                                Logo = item.logo
                            });
                        }
                    }
                }
            }

            return listAgents;
        }

        public int FindCountAgents() //Находит количество агентов
        {
            var countAgents = from p in dataContext.Agents
                              select new
                              {
                                  p.ID
                              };

            return countAgents.Count();
        }

        private void ForwardButton_Click(object sender, RoutedEventArgs e) //Обработка нажатия кнопки вперед
        {

            int countPage = FindCountAgents();

            List<Agent> listAgents = FillList();

            if (numberPage == countPage / pageSize)
            {
                forwardButton.IsEnabled = false;
            }

            else
            {
                backButton.IsEnabled = true;
                numberPage++;
                pageIndex++;
                listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                ListViewAgents.ItemsSource = listAgentsTen;

                CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.ItemsSource);

                view.Filter = AgentSearch;
            }
        } 

        private void BackButton_Click(object sender, RoutedEventArgs e) //Обработка нажатия кнопки назад
        {
            List<Agent> listAgents = FillList();

            if (numberPage == 1)
            {
                backButton.IsEnabled = false;
            }

            forwardButton.IsEnabled = true;
            numberPage--;
            pageIndex--;
            listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
            ListViewAgents.ItemsSource = listAgentsTen;

            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.ItemsSource);

            view.Filter = AgentSearch;
        }

        private void Sort_SelectionChanged(object sender, SelectionChangedEventArgs e)  // Сортировка
        {
            ComboBoxItem comboBox = (ComboBoxItem)Sort.SelectedItem;
            string valueComboBox = comboBox.Content.ToString();

            switch (valueComboBox)
            {
                case "Не сортировать":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;

                    view.Filter = AgentSearch;
                    break;
                }

                case "↑ Наименование":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;


                    view.SortDescriptions.Add(new SortDescription("Title", ListSortDirection.Ascending));
                    view.Filter = AgentSearch;
                    break;
                }

                case "↓ Наименование":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;


                    view.SortDescriptions.Add(new SortDescription("Title", ListSortDirection.Descending));
                    view.Filter = AgentSearch;
                    break;
                }

                case "↑ Скидка":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;

                    view.SortDescriptions.Add(new SortDescription("Discount", ListSortDirection.Ascending));
                    view.Filter = AgentSearch;
                    break;
                }

                case "↓ Скидка":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;

                    view.SortDescriptions.Add(new SortDescription("Discount", ListSortDirection.Descending));
                    view.Filter = AgentSearch;
                    break;
                }

                case "↑ Приоритет агента":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;

                    view.SortDescriptions.Add(new SortDescription("Priority", ListSortDirection.Ascending));
                    view.Filter = AgentSearch;
                    break;
                }

                case "↓ Приоритет агента":
                {
                    CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.Items);
                    view.SortDescriptions.Clear();
                    listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                    ListViewAgents.ItemsSource = listAgentsTen;

                    view.SortDescriptions.Add(new SortDescription("Priority", ListSortDirection.Descending));
                    view.Filter = AgentSearch;
                    break;
                }
            }
        }

        private void Filter_SelectionChanged(object sender, SelectionChangedEventArgs e)  //Фильтр
        {
            ComboBoxItem comboBox = (ComboBoxItem)Filter.SelectedItem;

            if (Convert.ToString(comboBox.Content) == "Все типы")
            {
                listAgentsTen = listAgents.Skip(pageIndex * pageSize).Take(pageSize).ToList();
                ListViewAgents.ItemsSource = listAgentsTen;
            }
            else
            {
                listAgentsTen = listAgents.Where(p => p.AgentTypeTitle == Convert.ToString(comboBox.Content)).ToList();
                ListViewAgents.ItemsSource = listAgentsTen;
            }
        }

        private bool AgentSearch(object item)  //Поиск
        {
            if (String.IsNullOrEmpty(Search.Text))
            {
                return true;
            }
            else
            {
                return ((item as Agent).Title.IndexOf(Search.Text, StringComparison.OrdinalIgnoreCase) >= 0) || ((item as Agent).Phone.IndexOf(Search.Text, StringComparison.OrdinalIgnoreCase) >= 0);
            }
        }

        private void FilterTextChanged(object sender, TextChangedEventArgs e)  //Обновляет ListView при изменении TextBox
        {
            CollectionViewSource.GetDefaultView(ListViewAgents.ItemsSource).Refresh();
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewAgents.ItemsSource);

            view.Filter = AgentSearch;
        }

        private void ListViewAgents_SelectionChanged(object sender, SelectionChangedEventArgs e) //Показывает/скрывает кнопку изменения приоритета
        {
            if (ListViewAgents.SelectedItems.Count >= 2)
                ChangePriorityButton.Visibility = Visibility.Visible;

            else
                ChangePriorityButton.Visibility = Visibility.Hidden;
        }

        private void ChangePriorityButton_Click(object sender, RoutedEventArgs e) // Обработка нажатия кнопки изменения приоритета
        {

            PriorityWindow priorityWindow = new PriorityWindow();

            List<Agent> listViewItems = new List<Agent>();

            foreach (Agent item in ListViewAgents.SelectedItems)
            {
                listViewItems.Add(item);
            }

            priorityWindow.NewPriority.Text = listViewItems.OrderByDescending(s => s.Priority).Select(s => s.Priority).First().ToString();

            priorityWindow.ShowDialog();
            priorityWindow.WindowStartupLocation = WindowStartupLocation.CenterOwner;
        }       
    }   
}
