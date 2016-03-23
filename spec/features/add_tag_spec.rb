feature 'adding a tag to a link' do
  scenario 'the newly created link appears on the links page' do
    add_link_with_tag("Facebook", "www.facebook.com", "Social Media")

    link = Link.first
    within 'ul#links' do
      expect(page).to have_content("Social Media")
    end

    expect(link.tags.map(&:name)).to include("Social Media")
  end
end
