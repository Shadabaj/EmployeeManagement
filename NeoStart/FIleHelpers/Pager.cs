namespace NeoStart.FileHelpers
{
    public class Pager
    {
        // Properties
        public string SearchText { get; set; } = "";
        public string Controller { get; set; } = "Employee";
        public string Action { get; set; } = "Index";
        public int TotalItems { get; private set; }
        public int CurrentPage { get; private set; }
        public int PageSize { get; private set; }
        public int TotalPages { get; private set; }
        public int StartPage { get; private set; }
        public int EndPage { get; private set; }
        public int StartRecord { get; private set; }

        // Constructor
        public Pager(int totalItems, int page, int pageSize = 10)
        {
            TotalItems = totalItems;
            PageSize = pageSize;
            CurrentPage = page;

            // Calculate total pages
            TotalPages = (int)Math.Ceiling((decimal)totalItems / pageSize);

            // Ensure the current page is within the range of valid pages
            if (CurrentPage > TotalPages)
            {
                CurrentPage = TotalPages;
            }

    
            StartPage = CurrentPage - 5;
            EndPage = CurrentPage + 4;

          
            if (StartPage <= 0)
            {
                EndPage = EndPage - (StartPage - 1);
                StartPage = 1;
            }
            if (EndPage > TotalPages)
            {
                EndPage = TotalPages;

                if (EndPage > 10)
                {
                    StartPage = EndPage - 9; // Ensure a max of 10 pages to show
                }
            }

           
            StartRecord = (CurrentPage - 1) * PageSize + 1;
        }
    }
}
