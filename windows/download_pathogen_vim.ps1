$client = new-object System.Net.WebClient
$client.DownloadFile("https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim", "$HOME\.vim\autoload\pathogen_temp.vim")