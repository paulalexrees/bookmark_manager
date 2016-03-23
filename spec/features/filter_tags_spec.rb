feature 'filtering links by a given tag' do
  scenario 'shows a page of filtered links' do
    tag = "search"
    add_link_with_tag("Google", "www.google.com", tag)
    add_link_with_tag("Daily Mail", "www.dailymail.co.uk", "news")
    visit '/tags/search'

    link = Link.first
    expect(page).to have_content("Google")
    expect(page).not_to have_content("Daily Mail")
  end
end
