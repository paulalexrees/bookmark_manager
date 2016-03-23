def add_link_with_tag(title,url,tags)
  visit '/links/new'
  fill_in(:title, with: title)
  fill_in(:url, with: url)
  fill_in(:tag, with: tags)
  click_button("Submit")
end
