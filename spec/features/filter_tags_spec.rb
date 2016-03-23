feature 'filtering links by a given tag' do
  scenario 'shows a page of filtered links' do
    add_link_with_tag("Google", "www.google.com", "search")
    add_link_with_tag("Daily Mail", "www.dailymail.co.uk", "news")
    add_link_with_tag("Bing", "www.bing.com", "search")
    visit '/tags/search'

    link = Link.first
    expect(page).to have_content("Google")
    expect(page).to have_content("Bing")
    expect(page).not_to have_content("Daily Mail")
  end
end
