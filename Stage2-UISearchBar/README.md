# UISearchBar

- 本单元比较简单，见代码即可





- 自定义searchBar

  ```objective-c
  -(void) searchBar2 {
      UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 414, 50)];
      searchBar.showsCancelButton = true;
      searchBar.showsBookmarkButton = true; // 标签
      searchBar.delegate = self;
      searchBar.backgroundImage = [UIImage imageNamed:@"searchbarbg.png"];
      
      [searchBar setImage:[UIImage imageNamed:@"bookmarkicon.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
      [searchBar setImage:[UIImage imageNamed:@"bookmarkiconhighlighted.png"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
      [self.view addSubview:searchBar];
  }
  ```

  