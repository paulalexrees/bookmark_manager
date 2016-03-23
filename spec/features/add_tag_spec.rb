feature 'adding a tag to a link' do
  scenario 'the newly created link appears on the links page' do
    add_link_with_tag("Facebook", "www.facebook.com", "socialmedia")

    link = Link.first
    within 'ul#links' do
      expect(page).to have_content("socialmedia")
    end

    expect(link.tags.map(&:name)).to include("socialmedia")
  end
end
